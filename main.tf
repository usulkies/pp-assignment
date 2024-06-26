module "minikube_cluster" {
  providers = {
    minikube = minikube
  }
  source          = "./modules/minikube"
  minikube_driver = var.minikube_driver
  cluster_name    = var.minikube_cluster_name
  cluster_nodes   = var.minikube_cluster_nodes
}

provider "kubernetes" {
  host                   = module.minikube_cluster.host
  client_certificate     = module.minikube_cluster.client_certificate
  client_key             = module.minikube_cluster.client_key
  cluster_ca_certificate = module.minikube_cluster.cluster_ca_certificate
}

module "webapp" {
  for_each = var.web_applications_stacks
  providers = {
    kubernetes = kubernetes
  }
  source                            = "./modules/webapp"
  webapp_name                       = each.value.name
  webapp_namespace                  = each.value.namespace
  webapp_replicas                   = each.value.replicas
  create_namespace                  = each.value.create_namespace
  minikube_cluster_name             = var.minikube_cluster_name
  create_localhost_service_endpoint = var.create_localhost_service_endpoint
}


