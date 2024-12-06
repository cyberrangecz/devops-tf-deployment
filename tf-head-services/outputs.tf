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
