variable "acme_contact" {
  type        = string
  description = "Let's encrypt contact email address"
}

variable "application_credential_id" {
  type        = string
  description = "Application credentials ID for accessing OpenStack project"
}

variable "application_credential_secret" {
  type        = string
  description = "Application credentials secret for accessing OpenStack project"
}

variable "deploy_head_timeout" {
  type        = number
  description = "Timeout for deploying kypo-crp-head helm package in seconds"
  default     = 3600
}

variable "enable_monitoring" {
  type        = bool
  description = "If Prometheus monitoring should be enabled"
  default     = false
}

variable "gen_user_count" {
  type        = number
  description = "Number of local users to generate"
}

variable "git_config" {
  type = object({
    providers            = map(string)
    user                 = string
    ansibleNetworkingUrl = string
    ansibleNetworkingRev = string
    }
  )
  description = "Git configuration for KYPO."
  sensitive   = true
  default = {
    providers            = {}
    user                 = "git"
    ansibleNetworkingUrl = "https://gitlab.ics.muni.cz/muni-kypo-crp/backend-python/ansible-networking-stage/kypo-ansible-stage-one.git"
    ansibleNetworkingRev = "v1.0.18"
  }
}

variable "guacamole_admin_password" {
  type        = string
  description = "Password of guacamole admin user"
}

variable "guacamole_user_password" {
  type        = string
  description = "Password of guacamole normal user"
}

variable "head_host" {
  type        = string
  description = "FQDN/IP address of node/LB, where KYPO head services are running"
}

variable "head_ip" {
  type        = string
  description = "IP address of node/LB, where KYPO head services are running"
}

variable "helm_repository" {
  type        = string
  description = "Repository with KYPO-head helm packages"
  default     = "https://gitlab.ics.muni.cz/api/v4/projects/2358/packages/helm/stable"
}

variable "kubernetes_host" {
  type        = string
  description = "FQDN/IP address of Kubernetes API"
}

variable "kubernetes_client_certificate" {
  type        = string
  description = "Base64 encoded client certificate for authentication to Kubernetes API"
}

variable "kubernetes_client_key" {
  type        = string
  description = "Base64 encoded client key for authentication to Kubernetes API"
}

variable "kypo_crp_head_version" {
  type        = string
  description = "Version of kypo-crp-head helm package"
  default     = "4.0.0"
}

variable "kypo_gen_users_version" {
  type        = string
  description = "Version of kypo-gen-users helm package"
  default     = "2.0.1"
}

variable "kypo_postgres_version" {
  type        = string
  description = "Version of kypo-postgres helm package"
  default     = "2.1.0"
}

variable "man_flavor" {
  type        = string
  description = "Flavor name used for man nodes"
  default     = "csirtmu.tiny1x2"
}

variable "man_image" {
  type        = string
  description = "OpenStack image used for man nodes"
  default     = "debian-10-man"
}

variable "os_auth_url" {
  type        = string
  description = "OpenStack authentication URL"
}

variable "os_region" {
  type        = string
  description = "OpenStack region"
  default     = ""
}

variable "oidc_providers" {
  type = list(object({
    url              = string
    logoutUrl        = string
    clientId         = string
    label            = string
    issuerIdentifier = string
    userInfoUrl      = string
    responseType     = string
    }
  ))
  description = "List of OIDC providers. Set issuerIdentifier and userInfoUrl to empty string if not used."
  default     = []
}

variable "openid_configuration_insecure" {
  type        = bool
  description = "Ignore invalid tls certificate of local Keycloak"
  default     = false
}

variable "prometheus_jobs" {
  type        = list(any)
  description = "List of custom prometheus jobs"
  default     = []
}

variable "proxy_host" {
  type        = string
  description = "FQDN/IP address of proxy-jump host"
}

variable "proxy_key" {
  type        = string
  description = "Base64 encoded proxy-jump ssh private key"
}

variable "sandbox_ansible_timeout" {
  type        = number
  description = "Timeout for sandbox provisioning stage"
  default     = 7200
}

variable "smtp_config" {
  type = object({
    smtp_server           = string
    smtp_port             = number
    smtp_encryption       = string
    sender_email          = string
    sender_email_password = string
    }
  )
  description = "SMTP configuration for Sandbox Service notificatins"
  sensitive   = true
  default = {
    smtp_server           = ""
    smtp_port             = 25
    smtp_encryption       = ""
    sender_email          = ""
    sender_email_password = ""
  }
  validation {
    condition     = contains(["SSL", "TSL", "INSECURE", ""], var.smtp_config.smtp_encryption)
    error_message = "The connection type must be one of SSL, TSL, INSECURE or empty string."
  }
}

variable "tls_private_key" {
  type        = string
  description = "Base64 encoded tls private key. If not specified, it will be generated."
  default     = ""
}

variable "tls_public_key" {
  type        = string
  description = "Base64 encoded tls public key. If not specified, it will be generated"
  default     = ""
}

variable "users" {
  type = map(
    object({
      iss              = string
      email            = string
      fullName         = string
      givenName        = string
      familyName       = string
      admin            = bool
      keycloakUsername = string
      keycloakPassword = string
      }
  ))
  description = "Dictionary with with users, that should be created in KYPO. For users from external OIDC providers, set password to empty string."
  sensitive   = true
}
