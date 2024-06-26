<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.30.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.30.0 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_namespace_v1.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace_v1) | resource |
| [kubernetes_service.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [null_resource.run_minikube_tunnel](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [local_file.minikube_tunnel_url](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_localhost_service_endpoint"></a> [create\_localhost\_service\_endpoint](#input\_create\_localhost\_service\_endpoint) | Whether to create a localhost endpoint | `bool` | `false` | no |
| <a name="input_create_namespace"></a> [create\_namespace](#input\_create\_namespace) | Whether to create the namespace | `bool` | `false` | no |
| <a name="input_minikube_cluster_name"></a> [minikube\_cluster\_name](#input\_minikube\_cluster\_name) | The name of the minikube cluster | `string` | `"minikube"` | no |
| <a name="input_nginx_image_tag"></a> [nginx\_image\_tag](#input\_nginx\_image\_tag) | The image to use for the webapp | `string` | `"latest"` | no |
| <a name="input_webapp_name"></a> [webapp\_name](#input\_webapp\_name) | Name of the webapp | `string` | `"webapp"` | no |
| <a name="input_webapp_namespace"></a> [webapp\_namespace](#input\_webapp\_namespace) | The namespace to deploy the webapp | `string` | `"default"` | no |
| <a name="input_webapp_port"></a> [webapp\_port](#input\_webapp\_port) | The port the webapp listens on | `number` | `80` | no |
| <a name="input_webapp_probe_path"></a> [webapp\_probe\_path](#input\_webapp\_probe\_path) | The path to probe for readiness | `string` | `"/"` | no |
| <a name="input_webapp_replicas"></a> [webapp\_replicas](#input\_webapp\_replicas) | The number of replicas to run | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_minikube_tunnel_url"></a> [minikube\_tunnel\_url](#output\_minikube\_tunnel\_url) | n/a |
<!-- END_TF_DOCS -->