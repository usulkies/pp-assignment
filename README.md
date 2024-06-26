# PP Assignment
Automating Infrastructure with Terraform

This project provides a Terraform solution for setting up a Minikube cluster and deploying web applications on it. The solution has been tested with the Docker driver, which should be installed on your system. Additionally, Minikube must be installed according to the instructions provided at [Minikube Start Guide](https://minikube.sigs.k8s.io/docs/start).

Please note that the configuration and deployment details may vary based on your specific requirements and system setup.

## Prerequisites

- Docker: The Docker driver is used for creating the Minikube cluster. Ensure Docker is installed and running on your system. You can download Docker from [here](https://www.docker.com/products/docker-desktop).
- Minikube: This project uses Minikube for creating a local Kubernetes cluster. Follow the instructions [here](https://minikube.sigs.k8s.io/docs/start) to install Minikube.

## Setup and Execution

1. Clone this repository to your local system.
2. Navigate to the project directory.
3. Run `terraform init` to initialize your Terraform workspace.
4. Run `terraform apply` to create your infrastructure.

For more detailed information about the modules, resources, inputs, and outputs of this Terraform project, please refer to the auto-generated documentation below.

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
| <a name="input_web_applications_stacks"></a> [web\_applications\_stacks](#input\_web\_applications\_stacks) | The web applications to deploy | <pre>map(object({<br>    name                              = string<br>    namespace                         = string<br>    replicas                          = number<br>    create_localhost_service_endpoint = bool<br>    create_namespace                  = optional(bool, false)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "create_localhost_service_endpoint": true,<br>    "create_namespace": false,<br>    "name": "my-default-webapp",<br>    "namespace": "default",<br>    "replicas": 3<br>  }<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_services_local_endpoints"></a> [application\_services\_local\_endpoints](#output\_application\_services\_local\_endpoints) | The local endpoints for each application service |
<!-- END_TF_DOCS -->