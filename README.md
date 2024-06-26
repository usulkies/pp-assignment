# pp-assignment
Automating Infrastructure with Terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.30.0 |
| <a name="requirement_minikube"></a> [minikube](#requirement\_minikube) | >= 0.3.10 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_minikube_cluster"></a> [minikube\_cluster](#module\_minikube\_cluster) | ./modules/minikube | n/a |
| <a name="module_webapp"></a> [webapp](#module\_webapp) | ./modules/webapp | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_localhost_service_endpoint"></a> [create\_localhost\_service\_endpoint](#input\_create\_localhost\_service\_endpoint) | Whether to create a localhost endpoint | `bool` | n/a | yes |
| <a name="input_minikube_cluster_name"></a> [minikube\_cluster\_name](#input\_minikube\_cluster\_name) | The name of the minikube cluster | `string` | n/a | yes |
| <a name="input_minikube_cluster_nodes"></a> [minikube\_cluster\_nodes](#input\_minikube\_cluster\_nodes) | The number of nodes for the minikube cluster | `number` | n/a | yes |
| <a name="input_minikube_driver"></a> [minikube\_driver](#input\_minikube\_driver) | The driver to use for the minikube cluster | `string` | n/a | yes |
| <a name="input_web_applications_stacks"></a> [web\_applications\_stacks](#input\_web\_applications\_stacks) | The web applications to deploy | <pre>map(object({<br>    name                              = string<br>    namespace                         = string<br>    replicas                          = number<br>    create_localhost_service_endpoint = bool<br>    create_namespace                  = bool<br>  }))</pre> | <pre>{<br>  "default": {<br>    "create_localhost_service_endpoint": true,<br>    "create_namespace": false,<br>    "name": "my-default-webapp",<br>    "namespace": "default",<br>    "replicas": 3<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_services_local_endpoints"></a> [application\_services\_local\_endpoints](#output\_application\_services\_local\_endpoints) | n/a |
<!-- END_TF_DOCS -->