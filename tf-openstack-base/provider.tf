terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
    tls = {
      source  = "registry.terraform.io/hashicorp/tls"
      version = "3.1.0"
    }
  }
  required_version = ">= 0.13"
}

provider "openstack" {}
