module "flavors" {
  count                = var.deploy_flavors ? 1 : 0
  source               = "git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-flavors.git?ref=v1.0.1"
  standard_small_disk  = var.standard_small_disk
  standard_medium_disk = var.standard_medium_disk
  standard_large_disk  = var.standard_large_disk
  csirtmu_tiny_disk    = var.csirtmu_tiny_disk
  standard_small_ram   = var.standard_small_ram
  standard_medium_ram  = var.standard_medium_ram
  standard_large_ram   = var.standard_large_ram
  csirtmu_tiny_ram     = var.csirtmu_tiny_ram
}

module "images" {
  count  = var.deploy_images ? 1 : 0
  source = "git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-images.git?ref=v1.1.0"
}

module "openstack_base" {
  source                = "git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-openstack-base.git?ref=v1.0.0"
  external_network_name = var.external_network_name
  dns_nameservers       = var.dns_nameservers
}

data "openstack_images_image_v2" "ubuntu" {
  name        = var.deploy_images ? module.images[0].focal_name : var.kypo_proxy_image_name
  most_recent = true
  depends_on  = [module.images]
}

module "proxy_jump" {
  source                = "git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-proxy-jump.git?ref=v1.0.0"
  external_network_name = var.external_network_name
  flavor_name           = var.deploy_flavors ? module.flavors[0].standard_medium_name : var.kypo_proxy_flavor_name
  image_id              = data.openstack_images_image_v2.ubuntu.id
  key_pair              = module.openstack_base.keypair_name
  network_id            = module.openstack_base.network_id
  security_group        = module.openstack_base.sg_proxy_name
  depends_on            = [module.openstack_base]
}

module "kubernetes_cluster" {
  count                 = var.deploy_kubernetes_cluster ? 1 : 0
  source                = "git::https://gitlab.ics.muni.cz/muni-kypo-crp/devops/terraform-modules/kypo-crp-tf-module-kypo-kubernetes-cluster.git?ref=v1.0.2"
  external_network_name = var.external_network_name
  flavor_name           = var.deploy_flavors ? module.flavors[0].standard_large_name : var.kypo_kubernetes_cluster_flavor_name
  image_id              = data.openstack_images_image_v2.ubuntu.id
  key_pair              = module.openstack_base.keypair_name
  network_id            = module.openstack_base.network_id
  private_key           = module.openstack_base.private_key
  security_group        = module.openstack_base.sg_head_name
  depends_on            = [module.openstack_base]
}
