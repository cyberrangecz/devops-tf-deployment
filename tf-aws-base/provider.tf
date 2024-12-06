terraform {
  required_providers {
    aws = {
      version = "5.38.0"
      source  = "aws"
    }
    null = {
      version = "3.2.2"
      source  = "null"
    }
    tls = {
      version = "4.0.5"
      source  = "hashicorp/tls"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "null" {
}
