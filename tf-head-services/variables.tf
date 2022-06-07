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

variable "gen_user_count" {
  type        = number
  description = "Number of local users to generate"
}

variable "git_config" {
  type = object({
    type                 = string
    server               = string
    sshPort              = number
    restServerUrl        = string
    user                 = string
    privateKey           = string
    accessToken          = string
    ansibleNetworkingUrl = string
    ansibleNetworkingRev = string
    }
  )
  description = "Git configuration for KYPO. For internal GIT, set privateKey to empty string."
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
  default     = "0.0.6-rc.1"
}

variable "os_auth_url" {
  type        = string
  description = "OpenStack authentication URL"
}

variable "oidc_providers" {
  type = list(object({
    url              = string
    logoutUrl        = string
    clientId         = string
    label            = string
    issuerIdentifier = string
    userInfoUrl      = string
    }
  ))
  description = "List of OIDC providers. Set issuerIdentifier and userInfoUrl to empty string if not used."
}

variable "proxy_host" {
  type        = string
  description = "FQDN/IP address of proxy-jump host"
}

variable "proxy_key" {
  type        = string
  description = "Base64 encoded proxy-jump ssh private key"
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
      iss        = string
      password   = string
      email      = string
      fullName   = string
      givenName  = string
      familyName = string
      admin      = bool
      }
  ))
  description = "Dictionary with with users, that should be created in KYPO. For users from external OIDC providers, set password to empty string."
}
