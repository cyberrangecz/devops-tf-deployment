<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.88.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.17.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.35.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_efs_access_point.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_access_point) | resource |
| [aws_efs_file_system.efs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.efs_mount](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |
| [aws_iam_openid_connect_provider.eks_oidc_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.ebs_csi_driver_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.efs_csi_driver_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ebs_csi_driver_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.efs_csi_driver_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.efs_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [helm_release.aws_ebs_csi_driver](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.aws_efs_csi_driver](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.traefik](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_service_account.ebs_csi_driver_sa](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [kubernetes_service_account.efs_csi_driver_sa](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [kubernetes_storage_class.ebs_sc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/storage_class) | resource |
| [kubernetes_storage_class.root_efs_sc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/storage_class) | resource |
| [aws_eks_cluster.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_security_group.eks_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [kubernetes_service.traefik](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service) | data source |
| [terraform_remote_state.aws_base](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [tls_certificate.oidc](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | AWS account ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-central-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_traefik_lb_hostname"></a> [traefik\_lb\_hostname](#output\_traefik\_lb\_hostname) | FQDN of Traefik LB |
<!-- END_TF_DOCS -->