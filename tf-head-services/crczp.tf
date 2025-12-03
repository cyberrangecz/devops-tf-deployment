resource "random_password" "grafana_secret" {
  length  = 64
  special = false
}

module "helm" {
  source                        = "git::https://github.com/cyberrangecz/tf-module-helm.git?ref=v1.3.0"
  acme_contact                  = var.acme_contact
  application_credential_id     = var.application_credential_id
  application_credential_secret = var.application_credential_secret
  aws_config                    = local.aws_config
  deploy_head_timeout           = var.deploy_head_timeout
  gen_user_count                = var.gen_user_count
  git_config                    = var.git_config
  head_host                     = var.head_host
  helm_repository               = var.helm_repository
  certs_version                 = var.certs_version
  head_version                  = var.head_version
  gen_users_version             = var.gen_users_version
  postgres_version              = var.postgres_version
  man_flavor                    = var.man_flavor
  man_image                     = var.man_image
  os_auth_url                   = var.os_auth_url
  oidc_providers                = length(var.oidc_providers) > 0 ? var.oidc_providers : local.oidc_providers
  proxy_host                    = local.proxy_host
  proxy_key                     = local.proxy_key
  sandbox_ansible_timeout       = var.sandbox_ansible_timeout
  self_signed                   = var.self_signed
  tls_private_key               = var.tls_private_key
  tls_public_key                = var.tls_public_key
  users                         = var.users
  value_files                   = [var.kubernetes_api_url != "" ? "values.yaml" : "values-aws.yaml"]
}

module "monitoring" {
  count                         = var.enable_monitoring ? 1 : 0
  source                        = "git::https://github.com/cyberrangecz/tf-module-monitoring.git?ref=v1.0.0"
  application_credential_id     = var.application_credential_id
  application_credential_secret = var.application_credential_secret
  grafana_oidc_provider         = local.grafana_oidc_provider
  head_host                     = var.head_host
  openid_configuration_insecure = var.openid_configuration_insecure
  os_auth_url                   = var.os_auth_url
  os_region                     = var.os_region
  depends_on = [
    module.helm
  ]
}

