output "minikube_tunnel_url" {
  value = var.create_localhost_endpoint ? module.webapp.minikube_tunnel_url : null
}