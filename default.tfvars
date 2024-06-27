minikube_driver                   = "docker"
minikube_cluster_name             = "my-minikube"
minikube_cluster_nodes            = 2
create_localhost_service_endpoint = true
web_applications_stacks = {
  default = {
    name                              = "my-default-webapp"
    namespace                         = "default"
    replicas                          = 12
    create_localhost_service_endpoint = true
  }
#   bonus-app = {
#     name                              = "my-bonus-webapp"
#     namespace                         = "my-bonus-namespace"
#     replicas                          = 3
#     create_localhost_service_endpoint = true
#     create_namespace                  = true
#   }
}