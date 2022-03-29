module "flavors" {
  count                = var.deploy_flavors ? 1 : 0
  source               = "git@gitlab.ics.muni.cz:muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-flavors.git"
  standard_small_disk  = var.standard_small_disk
  standard_medium_disk = var.standard_medium_disk
  standard_large_disk  = var.standard_large_disk
}

module "images" {
  count  = var.deploy_images ? 1 : 0
  source = "git@gitlab.ics.muni.cz:muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-images.git"
}

module "openstack_base" {
  source                = "git@gitlab.ics.muni.cz:muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-openstack-base.git"
  external_network_name = var.external_network_name
  dns_nameservers       = var.dns_nameservers
}

module "proxy_jump" {
  source                = "git@gitlab.ics.muni.cz:muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-proxy-jump.git"
  external_network_name = var.external_network_name
  flavor_name           = var.deploy_flavors ? module.flavors[0].standard_medium_name : var.kypo_proxy_flavor_name
  image_name            = var.deploy_images ? module.images[0].focal_name : var.kypo_proxy_image_name
  key_pair              = module.openstack_base.keypair_name
  network_id            = module.openstack_base.network_id
  security_group        = module.openstack_base.sg_proxy_name
  depends_on            = [module.openstack_base]
}

module "kubernetes_cluster" {
  count                 = var.deploy_kubernetes_cluster ? 1 : 0
  source                = "git@gitlab.ics.muni.cz:muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-kubernetes-cluster.git"
  external_network_name = var.external_network_name
  flavor_name           = var.deploy_flavors ? module.flavors[0].standard_large_name : var.kypo_kubernetes_cluster_flavor_name
  image_name            = var.deploy_images ? module.images[0].focal_name : var.kypo_kubernetes_cluster_image_name
  key_pair              = module.openstack_base.keypair_name
  network_id            = module.openstack_base.network_id
  private_key           = module.openstack_base.private_key
  security_group        = module.openstack_base.sg_head_name
  depends_on            = [module.openstack_base]
}
