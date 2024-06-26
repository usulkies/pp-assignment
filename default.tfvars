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
  another-app = {
    name                              = "my-other-webapp"
    namespace                         = "my-another-namespace"
    replicas                          = 3
    create_localhost_service_endpoint = true
    create_namespace                  = true
  }
}