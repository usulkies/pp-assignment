variable "minikube_driver" {
  type        = string
  description = "The driver to use for the minikube cluster"
  default     = "docker"
}

variable "webapp_replicas" {
  type        = number
  description = "The number of replicas for the webapp deployment"
}