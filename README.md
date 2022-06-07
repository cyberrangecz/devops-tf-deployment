# kypo-crp-tf-deployment

This repository is used  to deploy KYPO CRP to the OpenStack cloud with Terraform.

## Requirements

* OpenStack releases from Train to Yoga, but it may also work on newer releases.
* Required OpenStack components:
    * Nova
    * Neutron with user-defined networking and floating IP addresses
    * Keystone
* two floating IP addresses and an OpenStack router with access to the internet

## Preparing the Deployment Environment
* [Obtain Application Credentials](https://docs.openstack.org/keystone/yoga/user/application_credentials.html)
* Install Terraform (at least v1.1.8)

  ```snap install terraform --classic```

* Clone deployment repository

  ```git clone https://gitlab.ics.muni.cz/muni-kypo-crp/devops/kypo-crp-tf-deployment.git```

## Deployment

The deployment consists of two steps. First step is deployment of basic OpenStack resources (flavors, images, networking, instances) with [tf-openstack-base](tf-openstack-base).
The second step is deploying the KYPO-CRP Helm application to this virtual infrastructure with [tf-head-services](tf-head-services).

Follow these guides to deploy KYPO CRP:
1. [Deployment of OpenStack base resources](BASE.md)
2. [Deployment of KYPO-CRP Helm application](HELM.md)
