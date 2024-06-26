variable "minikube_driver" {
  type        = string
  description = "The driver to use for the minikube cluster"
  default     = "docker"
}

variable "addons" {
  type        = list(string)
  description = "The list of addons to enable for the minikube cluster"
  default = [
    "default-storageclass",
    "storage-provisioner"
  ]
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