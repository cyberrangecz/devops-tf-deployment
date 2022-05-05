module "kypo_crp" {
  source                        = "git@gitlab.ics.muni.cz:muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-crp-helm.git"
  acme_contact                  = var.acme_contact
  application_credential_id     = var.application_credential_id
  application_credential_secret = var.application_credential_secret
  gen_user_count                = var.gen_user_count
  git_config                    = var.git_config
  guacamole_admin_password      = var.guacamole_admin_password
  guacamole_user_password       = var.guacamole_user_password
  head_host                     = var.head_host
  head_ip                       = var.head_ip
  helm_repository               = var.helm_repository
  os_auth_url                   = var.os_auth_url
  oidc_providers                = var.oidc_providers
  proxy_host                    = var.proxy_host
  proxy_key                     = var.proxy_key
  users                         = var.users
}
