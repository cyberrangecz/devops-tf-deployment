output "cluster_ip" {
  value       = module.kubernetes_cluster[0].cluster_ip
  description = "Floating IP address of kubernetes cluster instance"
}

output "proxy_host" {
  value       = module.proxy_jump.proxy_floating_ip
  description = "FQDN/IP address of proxy-jump host"
}

output "proxy_key" {
  value       = base64encode(nonsensitive(module.openstack_base.private_key))
  description = "Base64 encoded proxy-jump ssh private key"
}

output "kubernetes_client_key" {
  value       = base64encode(nonsensitive(module.kubernetes_cluster[0].kubernetes_private_key))
  description = "Base64 encoded client key for authentication to Kubernetes API"
}

output "kubernetes_client_certificate" {
  value       = base64encode(module.kubernetes_cluster[0].kubernetes_certificate)
  description = "Base64 encoded client certificate for authentication to Kubernetes API"
}
