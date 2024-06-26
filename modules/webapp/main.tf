resource "kubernetes_namespace_v1" "this" {
  count = var.create_namespace ? 1 : 0
  metadata {
    name = var.webapp_namespace
  }
}
resource "kubernetes_deployment" "this" {
  metadata {
    name      = var.webapp_name
    namespace = var.webapp_namespace
  }

  spec {
    replicas = var.webapp_replicas
    selector {
      match_labels = {
        app = var.webapp_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.webapp_name
        }
      }
      spec {
        init_container {
          name  = "init"
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
          image = "nginx:${var.nginx_image_tag}"
          name  = "webapp"
          readiness_probe {
            http_get {
              path = var.webapp_probe_path
              port = "http"
            }
            initial_delay_seconds = 5
            period_seconds        = 5
          }
          port {
            container_port = var.webapp_port
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
  depends_on = [kubernetes_namespace_v1.this]
}

resource "kubernetes_service" "this" {
  metadata {
    name      = var.webapp_name
    namespace = var.webapp_namespace
  }
  wait_for_load_balancer = false
  spec {
    type = "NodePort"
    selector = {
      app = kubernetes_deployment.this.metadata.0.name
    }
    port {
      port        = 8080
      target_port = var.webapp_port
      name        = "http"
    }
  }
  depends_on = [kubernetes_deployment.this]
}

locals {
  url_file_name = "url-${var.minikube_cluster_name}-${var.webapp_name}.txt"
}

resource "null_resource" "run_minikube_tunnel" {
  count = var.create_localhost_service_endpoint ? 1 : 0
  triggers = {
    service_name = kubernetes_service.this.metadata.0.name
    time         = timestamp()
  }
  provisioner "local-exec" {
    command = <<-EOT
      rm ${local.url_file_name} || true
      minikube -p ${var.minikube_cluster_name} service ${kubernetes_service.this.metadata.0.name} -n ${var.webapp_namespace} --url 2>/dev/null >> ${local.url_file_name} &
      # Wait until file contains a URL
      while ! grep -q "http" "${local.url_file_name}" ; do
        echo "Waiting for URL..."
        sleep 1
      done
    EOT
  }

  depends_on = [
    kubernetes_deployment.this,
    kubernetes_service.this,
  ]
}

data "local_file" "minikube_tunnel_url" {
  count      = var.create_localhost_service_endpoint ? 1 : 0
  filename   = local.url_file_name
  depends_on = [null_resource.run_minikube_tunnel]
}
