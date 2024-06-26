output "minikube_tunnel_url" {
  precondition {
    condition     = var.create_localhost_endpoint
    error_message = "Localhost endpoint not created"
  }
  value = trimspace(data.local_file.minikube_tunnel_url.content)
}
