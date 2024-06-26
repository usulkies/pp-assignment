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

variable "webapp_name" {
  type        = string
  description = "The name of the webapp"
}
variable "webapp_namespace" {
  type        = string
  description = "The namespace to deploy the webapp"
}
variable "webapp_replicas" {
  type        = number
  description = "The number of replicas for the webapp deployment"
}

variable "create_localhost_endpoint" {
  type        = bool
  description = "Whether to create a localhost endpoint"
}




