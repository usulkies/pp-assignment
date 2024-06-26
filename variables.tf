variable "minikube_driver" {
  type        = string
  description = "The driver to use for the minikube cluster"
}

variable "minikube_cluster_name" {
  type        = string
  description = "The name of the minikube cluster"
}

variable "minikube_cluster_nodes" {
  type        = number
  description = "The number of nodes for the minikube cluster"
}

variable "web_applications_stacks" {
  type = map(object({
    name                              = string
    namespace                         = string
    replicas                          = number
    create_localhost_service_endpoint = bool
    create_namespace                  = optional(bool, false)
  }))
  description = "The web applications to deploy"
  default = {
    default = {
      name                              = "my-default-webapp"
      namespace                         = "default"
      replicas                          = 3
      create_localhost_service_endpoint = true
      create_namespace                  = false
    }
  }
}

variable "create_localhost_service_endpoint" {
  type        = bool
  description = "Whether to create a localhost endpoint"
}
