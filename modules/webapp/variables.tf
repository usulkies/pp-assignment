variable "webapp_name" {
  description = "Name of the webapp"
  type        = string
  default     = "webapp"
}

variable "webapp_namespace" {
  description = "The namespace to deploy the webapp"
  type        = string
  default     = "default"
}

variable "create_namespace" {
  description = "Whether to create the namespace"
  type        = bool
  default     = false
}

variable "nginx_image_tag" {
  description = "The image to use for the webapp"
  type        = string
  default     = "latest"
}

variable "webapp_port" {
  description = "The port the webapp listens on"
  type        = number
  default     = 80
}

variable "webapp_probe_path" {
  description = "The path to probe for readiness"
  type        = string
  default     = "/"
}

variable "webapp_replicas" {
  description = "The number of replicas to run"
  type        = number
  default     = 3
}

variable "minikube_cluster_name" {
  description = "The name of the minikube cluster"
  type        = string
  default     = "minikube"
}

variable "create_localhost_service_endpoint" {
  description = "Whether to create a localhost endpoint"
  type        = bool
  default     = false
}