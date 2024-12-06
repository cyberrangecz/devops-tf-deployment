data "kubernetes_service" "traefik" {
  metadata {
    name      = "traefik"
    namespace = "kube-system"
  }
  depends_on = [
    helm_release.traefik
  ]
}

output "traefik_lb_hostname" {
  value       = data.kubernetes_service.traefik.status[0].load_balancer[0].ingress[0].hostname
  description = "FQDN of Traefik LB"
}

