output "monitoring_admin_password" {
  value       = try(module.monitoring[0].admin_password, "")
  description = "Password for Prometheus and Grafana admin users"
  sensitive   = true
}

output "keycloak_password" {
  value       = module.helm.keycloak_password
  description = "Password for Keycloak admin users"
  sensitive   = true
}

output "netbird_owner_password" {
  description = "Password of the first NetBird owner user"
  value       = try(module.netbird[0].netbird_owner_password, "")
  sensitive   = true
}
