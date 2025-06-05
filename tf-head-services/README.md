```aws eks update-kubeconfig --region eu-central-1 --name head```
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_helm"></a> [helm](#module\_helm) | git::https://github.com/cyberrangecz/tf-module-helm.git | v1.0.0 |
| <a name="module_monitoring"></a> [monitoring](#module\_monitoring) | git::https://github.com/cyberrangecz/tf-module-monitoring.git | v1.0.0 |

## Resources

| Name | Type |
|------|------|
| [random_password.grafana_secret](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_contact"></a> [acme\_contact](#input\_acme\_contact) | Let's encrypt contact email address | `string` | n/a | yes |
| <a name="input_application_credential_id"></a> [application\_credential\_id](#input\_application\_credential\_id) | Application credentials ID for accessing OpenStack project (mutually exclusive with aws parameter) | `string` | `""` | no |
| <a name="input_application_credential_secret"></a> [application\_credential\_secret](#input\_application\_credential\_secret) | Application credentials secret for accessing OpenStack project (mutually exclusive with aws parameter) | `string` | `""` | no |
| <a name="input_aws_config"></a> [aws\_config](#input\_aws\_config) | AWS configuration (mutually exclusive with application\_credential\_id, application\_credential\_secret and os\_auth\_url parameters) | <pre>object({<br/>    accessKeyId      = string<br/>    secretAccessKey  = string<br/>    region           = string<br/>    availabilityZone = string<br/>    baseVpc          = string<br/>    baseSubnet       = string<br/>    }<br/>  )</pre> | <pre>{<br/>  "accessKeyId": "",<br/>  "availabilityZone": "eu-central-1a",<br/>  "baseSubnet": "BaseSubnetA",<br/>  "baseVpc": "BaseNet",<br/>  "region": "eu-central-1",<br/>  "secretAccessKey": ""<br/>}</pre> | no |
| <a name="input_certs_version"></a> [certs\_version](#input\_certs\_version) | Version of certs helm package | `string` | `"1.0.0"` | no |
| <a name="input_deploy_head_timeout"></a> [deploy\_head\_timeout](#input\_deploy\_head\_timeout) | Timeout for deploying crczp-head helm package in seconds | `number` | `3600` | no |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | If Prometheus monitoring should be enabled | `bool` | `false` | no |
| <a name="input_gen_user_count"></a> [gen\_user\_count](#input\_gen\_user\_count) | Number of local users to generate | `number` | n/a | yes |
| <a name="input_gen_users_version"></a> [gen\_users\_version](#input\_gen\_users\_version) | Version of gen-users helm package | `string` | `"1.0.0"` | no |
| <a name="input_git_config"></a> [git\_config](#input\_git\_config) | Git configuration | <pre>object({<br/>    providers            = map(string)<br/>    user                 = string<br/>    ansibleNetworkingUrl = string<br/>    ansibleNetworkingRev = string<br/>    }<br/>  )</pre> | <pre>{<br/>  "ansibleNetworkingRev": "v1.3.0",<br/>  "ansibleNetworkingUrl": "https://github.com/cyberrangecz/ansible-stage-one.git",<br/>  "providers": {},<br/>  "user": "git"<br/>}</pre> | no |
| <a name="input_head_host"></a> [head\_host](#input\_head\_host) | FQDN/IP address of node/LB, where head services are running | `string` | n/a | yes |
| <a name="input_head_version"></a> [head\_version](#input\_head\_version) | Version of head helm package | `string` | `"1.0.0"` | no |
| <a name="input_helm_repository"></a> [helm\_repository](#input\_helm\_repository) | Repository with head helm packages | `string` | `"oci://ghcr.io/cyberrangecz/stable"` | no |
| <a name="input_kubernetes_api_url"></a> [kubernetes\_api\_url](#input\_kubernetes\_api\_url) | Kubernetes API URL | `string` | `""` | no |
| <a name="input_kubernetes_token"></a> [kubernetes\_token](#input\_kubernetes\_token) | Token for authentication to Kubernetes API (AWS EKS) | `string` | `""` | no |
| <a name="input_man_flavor"></a> [man\_flavor](#input\_man\_flavor) | Flavor name used for man nodes | `string` | `"standard.small"` | no |
| <a name="input_man_image"></a> [man\_image](#input\_man\_image) | OpenStack image used for man nodes | `string` | `"debian-12-x86_64"` | no |
| <a name="input_oidc_providers"></a> [oidc\_providers](#input\_oidc\_providers) | List of OIDC providers. Set issuerIdentifier and userInfoUrl to empty string if not used. | <pre>list(object({<br/>    url              = string<br/>    logoutUrl        = string<br/>    clientId         = string<br/>    label            = string<br/>    issuerIdentifier = string<br/>    userInfoUrl      = string<br/>    responseType     = string<br/>    }<br/>  ))</pre> | `[]` | no |
| <a name="input_openid_configuration_insecure"></a> [openid\_configuration\_insecure](#input\_openid\_configuration\_insecure) | Ignore invalid tls certificate of local Keycloak | `bool` | `false` | no |
| <a name="input_os_auth_url"></a> [os\_auth\_url](#input\_os\_auth\_url) | OpenStack authentication URL (mutually exclusive with aws parameter) | `string` | `""` | no |
| <a name="input_os_region"></a> [os\_region](#input\_os\_region) | OpenStack region | `string` | `""` | no |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | Version of postgres helm package | `string` | `"1.0.0"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-central-1"` | no |
| <a name="input_sandbox_ansible_timeout"></a> [sandbox\_ansible\_timeout](#input\_sandbox\_ansible\_timeout) | Timeout for sandbox provisioning stage | `number` | `7200` | no |
| <a name="input_self_signed"></a> [self\_signed](#input\_self\_signed) | Use selfsigned certificates instead of Let's Encrypt for fqdn | `bool` | `false` | no |
| <a name="input_smtp_config"></a> [smtp\_config](#input\_smtp\_config) | SMTP configuration for Sandbox Service notificatins | <pre>object({<br/>    smtp_server           = string<br/>    smtp_port             = number<br/>    smtp_encryption       = string<br/>    sender_email          = string<br/>    sender_email_password = string<br/>    }<br/>  )</pre> | <pre>{<br/>  "sender_email": "",<br/>  "sender_email_password": "",<br/>  "smtp_encryption": "",<br/>  "smtp_port": 25,<br/>  "smtp_server": ""<br/>}</pre> | no |
| <a name="input_tls_private_key"></a> [tls\_private\_key](#input\_tls\_private\_key) | Base64 encoded tls private key. If not specified, it will be generated. | `string` | `""` | no |
| <a name="input_tls_public_key"></a> [tls\_public\_key](#input\_tls\_public\_key) | Base64 encoded tls public key. If not specified, it will be generated | `string` | `""` | no |
| <a name="input_users"></a> [users](#input\_users) | Dictionary with with users, that should be created in CyberRangeCZ Platform. For users from external OIDC providers, set password to empty string. | <pre>map(<br/>    object({<br/>      iss              = string<br/>      email            = string<br/>      fullName         = string<br/>      givenName        = string<br/>      familyName       = string<br/>      admin            = bool<br/>      keycloakUsername = string<br/>      keycloakPassword = string<br/>      }<br/>  ))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keycloak_password"></a> [keycloak\_password](#output\_keycloak\_password) | Password for Keycloak admin users |
| <a name="output_monitoring_admin_password"></a> [monitoring\_admin\_password](#output\_monitoring\_admin\_password) | Password for Prometheus and Grafana admin users |
<!-- END_TF_DOCS -->
