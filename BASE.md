# Deployment of OpenStack base resources

1. Obtain Application Credentials:\
https://docs.openstack.org/keystone/yoga/user/application_credentials.html

2. Execute OpenStack application credentials script in current shell:\
`source /path/to/app-cred-<name>-openrc.sh`

3. Enter tf-openstack-base directory:\
`cd tf-openstack-base`

4. Get the name of the OpenStack external network that will allow you to allocate floating IP addresses from the public IP address range. List all external networks:\
`openstack network list --external --column Name`

5. Create **deployment.tfvars** from template **deployment.tfvars-template**:\
`cp tfvars/deployment.tfvars-template tfvars/deployment.tfvars`\
 and setup **external_network_name** variable:\
 `external_network_name = "openstack_external_network"`

   To use network traffic forwarding, also uncomment and set **hypervisor_cidr** to the narrowest CIDR covering the tunnel source addresses of the compute nodes, which send the mirrored GRE traffic. It creates the **sandbox-mirror-sg** security group (GRE ingress from this CIDR only, no egress) that must exist before `network_forwarding_enabled` is turned on in the sandbox service:\
 `hypervisor_cidr = "10.99.0.0/16"`

   Network forwarding also uses the external network of the existing **base-router-public** router for the forwarding router of each sandbox. Every sandbox with network forwarding needs 1 router, 2 external IP addresses and 1 extra port of project quota.

6. Initialize OpenTofu:\
`tofu init`

## Deploy OpenStack base resources (with flavors)
For private OpenStack cloud deployments with admin application credentials, OpenTofu can deploy all required OpenStack resources.

7. Deploy OpenStack base resources:
    1. `tofu apply -var-file tfvars/deployment.tfvars -var-file tfvars/vars-all.tfvars`

## Deploy OpenStack base resources (without flavors)
For public OpenStack cloud deployments or private ones without admin application credentials, it is necessary to use flavors provided by the cloud provider.

7. Deploy OpenStack base resources:
    1. Get the flavor names used for the CyberRangeCZ Platform base servers. List all flavors.\
      `openstack flavor list --column Name`
    2. Setup the following variables in vars-base.tfvars with values obtained in previous step. kubernetes_cluster_flavor_name needs at least **4 VCPUs, 16384 MB RAM and 80 GB Disk**,  proxy_flavor_name needs at least **1 CPU, 2048 MB RAM and 10 GB Disk**.
    ```
    kubernetes_cluster_flavor_name = ""
    proxy_flavor_name              = ""
    ```
    3. `tofu apply -var-file tfvars/deployment.tfvars -var-file tfvars/vars-base.tfvars`

# AWS IAM User

For optimal setup, it is recommended to create a dedicated user for CyberRangeCZ Platform. Assign this user two IAM policies: [IAM-EC2.md](IAM-EC2.md) and [IAM.md](IAM.md). Then, generate an Access Key for the user. These credentials will be utilized in the .env file. [IAM-EC2.md](IAM-EC2.md) includes the VPC Traffic Mirroring and snapshot permissions used by network traffic forwarding and volumes in sandboxes.

# Deployment of AWS base resources

1. Enter tf-aws-base directory:\
`cd tf-aws-base`

2. Copy, fill and source AWS .env file:
```
cp .env-template .env
source .env
```

3. Initialize OpenTofu:\
`tofu init`

4. Deploy AWS base resources:\
`tofu apply`

# Deployment of AWS Kubernetes base resources

1. Enter tf-aws-kube-base directory:\
`cd tf-aws-kube-base`

2. Copy, fill and source AWS .env file:
```
cp .env-template .env
source .env
```

3. Create **deployment.tfvars** from template **deployment.tfvars-template**:\
`cp tfvars/deployment.tfvars-template tfvars/deployment.tfvars`\
 and setup **account_id** variable:\
 `account_id = "aws_account_id"`

3. Initialize OpenTofu:\
`tofu init`

4. Deploy AWS Kubernetes base resources:\
`tofu apply -var-file tfvars/deployment.tfvars`
