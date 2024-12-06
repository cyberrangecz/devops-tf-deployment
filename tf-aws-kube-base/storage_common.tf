data "aws_eks_cluster" "eks" {
  name = "head"
}

data "aws_eks_cluster_auth" "eks" {
  name = data.aws_eks_cluster.eks.name
}

data "tls_certificate" "oidc" {
  url = data.aws_eks_cluster.eks.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks_oidc_provider" {
  url             = data.aws_eks_cluster.eks.identity[0].oidc[0].issuer
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.oidc.certificates[0].sha1_fingerprint]
}
