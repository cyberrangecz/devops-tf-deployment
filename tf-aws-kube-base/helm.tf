data "aws_security_group" "eks_ingress" {
  name = "eks-ingress-sg"
}

resource "helm_release" "traefik" {
  name             = "traefik"
  repository       = "https://helm.traefik.io/traefik"
  chart            = "traefik"
  version          = "10.3.0"
  namespace        = "kube-system"
  create_namespace = true

  values = [
    <<EOF
service:
  annotations:
    service.beta.kubernetes.io/aws-load-balancer-security-groups: "${data.aws_security_group.eks_ingress.id}"
    service.beta.kubernetes.io/aws-load-balancer-scheme: "internet-facing"
  type: LoadBalancer
  ports:
    web:
      port: 80
      expose: true
    websecure:
      port: 443
      expose: true

ingressRoute:
  dashboard:
    enabled: true

ingressClass:
  enabled: true
  isDefaultClass: true

EOF
  ]
}
