data "terraform_remote_state" "aws_base" {
  backend = "local"

  config = {
    path = "../tf-aws-base/terraform.tfstate"
  }
}

provider "helm" {
  kubernetes {
    host                   = data.terraform_remote_state.aws_base.outputs.eks_cluster_host
    cluster_ca_certificate = base64decode(data.terraform_remote_state.aws_base.outputs.eks_cluster_ca_certificate)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", "head"]
    }
  }
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.aws_base.outputs.eks_cluster_host
  cluster_ca_certificate = base64decode(data.terraform_remote_state.aws_base.outputs.eks_cluster_ca_certificate)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", "head"]
  }
}

provider "aws" {
  region = var.region
}
