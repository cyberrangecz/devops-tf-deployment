<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 1.47.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_flavors"></a> [flavors](#module\_flavors) | git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-flavors.git | v1.0.1 |
| <a name="module_images"></a> [images](#module\_images) | git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-images.git | v1.4.1 |
| <a name="module_kubernetes_cluster"></a> [kubernetes\_cluster](#module\_kubernetes\_cluster) | git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-kubernetes-cluster.git | v3.0.0 |
| <a name="module_openstack_base"></a> [openstack\_base](#module\_openstack\_base) | git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-openstack-base.git | v1.0.1 |
| <a name="module_proxy_jump"></a> [proxy\_jump](#module\_proxy\_jump) | git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-proxy-jump.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [openstack_images_image_v2.ubuntu](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/data-sources/images_image_v2) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_csirtmu_tiny_disk"></a> [csirtmu\_tiny\_disk](#input\_csirtmu\_tiny\_disk) | Disk size of csirtmu tiny flavor in GB | `string` | `"20"` | no |
| <a name="input_csirtmu_tiny_ram"></a> [csirtmu\_tiny\_ram](#input\_csirtmu\_tiny\_ram) | RAM size of csirtmu tiny flavor in MB | `string` | `"2048"` | no |
| <a name="input_deploy_flavors"></a> [deploy\_flavors](#input\_deploy\_flavors) | If flavors should be created in OpenStack | `bool` | `false` | no |
| <a name="input_deploy_kubernetes_cluster"></a> [deploy\_kubernetes\_cluster](#input\_deploy\_kubernetes\_cluster) | If KYPO kubernetes cluster for head services should be deployed | `bool` | `true` | no |
| <a name="input_dns_nameservers"></a> [dns\_nameservers](#input\_dns\_nameservers) | List of DNS name servers used for instances | `list(string)` | <pre>[<br>  "1.1.1.1",<br>  "1.0.0.1"<br>]</pre> | no |
| <a name="input_external_network_name"></a> [external\_network\_name](#input\_external\_network\_name) | External network name used for floating IP allocation | `string` | n/a | yes |
| <a name="input_import_kali"></a> [import\_kali](#input\_import\_kali) | Import Kali image | `bool` | `true` | no |
| <a name="input_k3s_version"></a> [k3s\_version](#input\_k3s\_version) | Version of k3s distribution | `string` | `"v1.25.3+k3s1"` | no |
| <a name="input_kypo_kubernetes_cluster_flavor_name"></a> [kypo\_kubernetes\_cluster\_flavor\_name](#input\_kypo\_kubernetes\_cluster\_flavor\_name) | OpenStack flavor used by KYPO kubernetes cluster instance | `string` | n/a | yes |
| <a name="input_kypo_proxy_flavor_name"></a> [kypo\_proxy\_flavor\_name](#input\_kypo\_proxy\_flavor\_name) | OpenStack flavor used by KYPO proxy jump instance | `string` | n/a | yes |
| <a name="input_preinstalled_man"></a> [preinstalled\_man](#input\_preinstalled\_man) | Import preinstalled man image | `bool` | `true` | no |
| <a name="input_standard_large_disk"></a> [standard\_large\_disk](#input\_standard\_large\_disk) | Disk size of standard large flavor in GB | `string` | `"80"` | no |
| <a name="input_standard_large_ram"></a> [standard\_large\_ram](#input\_standard\_large\_ram) | RAM size of standard large flavor in MB | `string` | `"16384"` | no |
| <a name="input_standard_medium_disk"></a> [standard\_medium\_disk](#input\_standard\_medium\_disk) | Disk size of standard medium flavor in GB | `string` | `"80"` | no |
| <a name="input_standard_medium_ram"></a> [standard\_medium\_ram](#input\_standard\_medium\_ram) | RAM size of standard medium flavor in MB | `string` | `"4096"` | no |
| <a name="input_standard_small_disk"></a> [standard\_small\_disk](#input\_standard\_small\_disk) | Disk size of standard small flavor in GB | `string` | `"80"` | no |
| <a name="input_standard_small_ram"></a> [standard\_small\_ram](#input\_standard\_small\_ram) | RAM size of standard small flavor in MB | `string` | `"2048"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ip"></a> [cluster\_ip](#output\_cluster\_ip) | Floating IP address of KYPO kubernetes cluster instance |
| <a name="output_kubernetes_client_certificate"></a> [kubernetes\_client\_certificate](#output\_kubernetes\_client\_certificate) | Base64 encoded client certificate for authentication to Kubernetes API |
| <a name="output_kubernetes_client_key"></a> [kubernetes\_client\_key](#output\_kubernetes\_client\_key) | Base64 encoded client key for authentication to Kubernetes API |
| <a name="output_proxy_host"></a> [proxy\_host](#output\_proxy\_host) | FQDN/IP address of proxy-jump host |
| <a name="output_proxy_key"></a> [proxy\_key](#output\_proxy\_key) | Base64 encoded proxy-jump ssh private key |
<!-- END_TF_DOCS -->
