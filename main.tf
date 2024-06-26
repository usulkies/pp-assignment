resource "minikube_cluster" "minikube" {
  driver       = var.minikube_driver
  cluster_name = "my-minikube-cluster"
  addons = [
    "ingress", "ingress-dns", "default-storageclass",
    "storage-provisioner"
  ]
  nodes = 3
}

provider "kubernetes" {
  host                   = minikube_cluster.minikube.host
  client_certificate     = minikube_cluster.minikube.client_certificate
  client_key             = minikube_cluster.minikube.client_key
  cluster_ca_certificate = minikube_cluster.minikube.cluster_ca_certificate
}

resource "kubernetes_deployment" "static_webapp" {
  metadata {
    name = "static-webapp"
  }

  spec {
    replicas = var.webapp_replicas
    selector {
      match_labels = {
        app = "static-webapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "static-webapp"
        }
      }
      spec {
        init_container {
          name  = "init-nginx"
          image = "busybox"
          command = [
            "sh", "-c", "echo $HOSTNAME > /mnt/index.html"
          ]
          volume_mount {
            name       = "nginx-index-volume"
            mount_path = "/mnt"
          }
        }
        container {
          image = "nginx:latest"
          name  = "my-webapp"
          readiness_probe {
            http_get {
              path = "/"
              port = "http"
            }
            initial_delay_seconds = 5
            period_seconds        = 5
          }
          port {
            container_port = 80
            name           = "http"
          }
          volume_mount {
            name       = "nginx-index-volume"
            mount_path = "/usr/share/nginx/html"
          }
        }
        volume {
          name = "nginx-index-volume"
          empty_dir {}
        }
      }
    }
  }
}

resource "kubernetes_service" "static_webapp" {
  metadata {
    name = "static-webapp"
  }
  wait_for_load_balancer = false
  spec {
    type = "NodePort"
    selector = {
      app = kubernetes_deployment.static_webapp.metadata.0.name
    }
    port {
      port        = 8080
      target_port = 80
      name        = "http"
    }
  }
}

resource "null_resource" "run_minikube_tunnel" {
  provisioner "local-exec" {
    command = <<-EOT
      set -x

      # Run minikube tunnel with the profile name
      minikube -p my-minikube-cluster service ${kubernetes_service.static_webapp.metadata.0.name} > minikube_tunnel.log 2>&1 &
    EOT
  }

  depends_on = [
    kubernetes_deployment.static_webapp,
    kubernetes_service.static_webapp,]
}
