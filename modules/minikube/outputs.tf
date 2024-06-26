output "host" {
  value       = minikube_cluster.minikube.host
  description = "The host of the minikube cluster"
}
output "client_certificate" {
  value       = minikube_cluster.minikube.client_certificate
  sensitive   = true
  description = "The client certificate of the minikube cluster"
}
output "client_key" {
  value       = minikube_cluster.minikube.client_key
  sensitive   = true
  description = "The client key of the minikube cluster"
}
output "cluster_ca_certificate" {
  value       = minikube_cluster.minikube.cluster_ca_certificate
  sensitive   = true
  description = "The cluster CA certificate of the minikube cluster"
}