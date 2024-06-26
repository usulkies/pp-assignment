<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_minikube"></a> [minikube](#requirement\_minikube) | >= 0.3.10 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_minikube"></a> [minikube](#provider\_minikube) | >= 0.3.10 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [minikube_cluster.minikube](https://registry.terraform.io/providers/scott-the-programmer/minikube/latest/docs/resources/cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addons"></a> [addons](#input\_addons) | The list of addons to enable for the minikube cluster | `list(string)` | <pre>[<br>  "default-storageclass",<br>  "storage-provisioner"<br>]</pre> | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the minikube cluster | `string` | `"my-minikube-cluster"` | no |
| <a name="input_cluster_nodes"></a> [cluster\_nodes](#input\_cluster\_nodes) | The number of nodes for the minikube cluster | `number` | `1` | no |
| <a name="input_minikube_driver"></a> [minikube\_driver](#input\_minikube\_driver) | The driver to use for the minikube cluster | `string` | `"docker"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | The client certificate of the minikube cluster |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | The client key of the minikube cluster |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | The cluster CA certificate of the minikube cluster |
| <a name="output_host"></a> [host](#output\_host) | The host of the minikube cluster |
<!-- END_TF_DOCS -->