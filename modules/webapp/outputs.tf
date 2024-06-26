output "minikube_tunnel_url" {
  value = var.create_localhost_service_endpoint ? trimspace(data.local_file.minikube_tunnel_url[0].content) : null
}
