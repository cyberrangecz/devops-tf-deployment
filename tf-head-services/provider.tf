provider "helm" {
  kubernetes {
    host               = "https://${var.kubernetes_host}:6443"
    client_certificate = base64decode(var.kubernetes_client_certificate)
    client_key         = base64decode(var.kubernetes_client_key)
    insecure           = true
  }
}

provider "kubernetes" {
  host               = "https://${var.kubernetes_host}:6443"
  client_certificate = base64decode(var.kubernetes_client_certificate)
  client_key         = base64decode(var.kubernetes_client_key)
  insecure           = true
  ignore_annotations = [
    "cattle\\.io\\/status",
    "lifecycle\\.cattle\\.io\\/create\\.namespace-auth"
  ]
}
