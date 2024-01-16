resource "random_password" "grafana_secret" {
  length  = 64
  special = false
}

locals {
  oidc_providers = [{
    url              = "https://${var.head_host}/keycloak/realms/KYPO"
    logoutUrl        = "https://${var.head_host}/keycloak/realms/KYPO/protocol/openid-connect/logout"
    clientId         = "KYPO-Client"
    label            = "Login with local Keycloack"
    responseType     = "code"
    refreshToken     = true
    issuerIdentifier = ""
    userInfoUrl      = ""
  }]
  grafana_oidc_provider = {
    url          = "https://${var.head_host}/keycloak/realms/KYPO"
    clientId     = "Grafana-Client"
    clientSecret = random_password.grafana_secret.result
  }
}

module "kypo_crp" {
  source                        = "git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-crp-helm.git?ref=v2.1.1"
  acme_contact                  = var.acme_contact
  application_credential_id     = var.application_credential_id
  application_credential_secret = var.application_credential_secret
  deploy_head_timeout           = var.deploy_head_timeout
  gen_user_count                = var.gen_user_count
  git_config                    = var.git_config
  guacamole_admin_password      = var.guacamole_admin_password
  guacamole_user_password       = var.guacamole_user_password
  head_host                     = var.head_host
  head_ip                       = var.head_ip
  helm_repository               = var.helm_repository
  kypo_crp_head_version         = var.kypo_crp_head_version
  kypo_gen_users_version        = var.kypo_gen_users_version
  kypo_postgres_version         = var.kypo_postgres_version
  man_flavor                    = var.man_flavor
  man_image                     = var.man_image
  os_auth_url                   = var.os_auth_url
  oidc_providers                = length(var.oidc_providers) > 0 ? var.oidc_providers : local.oidc_providers
  proxy_host                    = var.proxy_host
  proxy_key                     = var.proxy_key
  sandbox_ansible_timeout       = var.sandbox_ansible_timeout
  tls_private_key               = var.tls_private_key
  tls_public_key                = var.tls_public_key
  users                         = var.users
}

module "monitoring" {
  count                         = var.enable_monitoring ? 1 : 0
  source                        = "git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-monitoring.git?ref=v1.0.3"
  application_credential_id     = var.application_credential_id
  application_credential_secret = var.application_credential_secret
  grafana_oidc_provider         = local.grafana_oidc_provider
  head_host                     = var.head_host
  openid_configuration_insecure = var.openid_configuration_insecure
  os_auth_url                   = var.os_auth_url
  os_region                     = var.os_region
  prometheus_jobs               = var.prometheus_jobs
  depends_on = [
    module.kypo_crp
  ]
}
