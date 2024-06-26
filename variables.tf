variable "minikube_driver" {
  type        = string
  description = "The driver to use for the minikube cluster"
  default     = "docker"
}

variable "webapp_replicas" {
  type        = number
  description = "The number of replicas for the webapp deployment"
  default     = 3
}

variable "cluster_name" {
  type        = string
  description = "The name of the minikube cluster"
  default     = "my-minikube-cluster"
}

variable "cluster_nodes" {
  type        = number
  description = "The number of nodes for the minikube cluster"
  default     = 1
}