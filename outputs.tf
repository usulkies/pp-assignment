output "application_services_local_endpoints" {
  value = {
    for k, v in var.web_applications_stacks : k => {
      name = v.name
      url  = var.create_localhost_service_endpoint ? module.webapp[k].minikube_tunnel_url : null
    }
  }
  description = "The local endpoints for each application service"
}