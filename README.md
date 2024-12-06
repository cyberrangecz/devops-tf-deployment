# devops-tf-deployment

This repository provides tools for deploying CyberRangeCZ Platform to OpenStack or AWS clouds using OpenTofu.

## Requirements

### OpenStack Deployment
* **Supported OpenStack Releases**: Train to Yoga (may work on newer releases)
* **Required OpenStack Components**:
    * Nova
    * Neutron with user-defined networking and floating IP addresses
    * Keystone
* **Additional Resources**:
    * Two floating IP addresses
    * An OpenStack router with internet access

### AWS Deployment
* **AWS Account**
* **VPC Limits Requirements**:
    * 1 VPC per **CyberRangeCZ Platform deployment**
    * 2 service VPCs per **built sandbox**
    * Additional VPCs equal to the number of networks defined in the sandbox topology per **built sandbox**
      (Refer to the [Sandbox Topology Definition Guide](https://docs.platform.cyberrange.cz/user-guide-advanced/sandboxes/topology-definition/#networks))

## Preparing the Deployment Environment
* Install OpenTofu (at least v1.8.0)

  ```snap install opentofu --classic```

* Clone deployment repository

  ```git clone https://github.com/cyberrangecz/devops-tf-deployment.git```

## Deployment

The deployment consists of two steps. First step is deployment of basic cloud resources (flavors, images, networking, instances) with [tf-openstack-base](tf-openstack-base) for OpenStack or [tf-aws-base](tf-aws-base) and [tf-aws-kube-base](tf-aws-kube-base) for AWS.
The second step is deploying the CyberRangeCZ Platform Helm application to this virtual infrastructure with [tf-head-services](tf-head-services).

Follow these guides to deploy CyberRangeCZ Platform:
1. [Deployment of Cloud base resources](BASE.md)
2. [Deployment of CyberRangeCZ Platform Helm application](HELM.md)
