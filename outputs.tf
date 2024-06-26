output "minikube_tunnel_url" {
  value = trimspace(data.local_file.minikube_tunnel_url.content)
}
