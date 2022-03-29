# kypo-crp-tf-deployment

This repository is used  to deploy KYPO CRP to the OpenStack cloud with Terraform.

## Requirements

* OpenStack releases from Train to Yoga, but it may also work on newer releases.
* Required OpenStack components:
    * Nova
    * Neutron with user-defined networking and floating IP addresses
    * Keystone
    * Heat
* two floating IP addresses and an OpenStack router with access to the internet
* OpenStack application credentials with **unrestricted** parameter
* Terraform v1.1.8

## Deployment

The deployment consists of two steps. First step is deployment of basic OpenStack resources (flavors, images, networking, instances) with [tf-openstack-base](tf-openstack-base).
The second step is deploying the KYPO-CRP helm application to this virtual infrastructure with [tf-head-services](tf-head-services).

Follow these guides to deploy KYPO CRP:
1. [Deployment of OpenStak base resources](BASE.md)
2. [Deployment of KYPO-CRP helm application](HELM.md)
