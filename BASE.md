# Deployment of OpenStack base resources

1. Execute OpenStack application credentials script in current shell:\
`source /path/to/app-cred-<name>-openrc.sh`

2. Enter tf-openstack-base directory:\
`cd tf-openstack-base`

3. Get the name of the OpenStack external network that will allow you to allocate floating IP addresses from the public IP address range. List all external networks:\
`openstack network list --external --column Name`

4. Create **deployment.tfvars** from template **deployment.tfvars-template**:\
`cp tfvars/deployment.tfvars-template tfvars/deployment.tfvars`\
 and setup **external_network_name** variable:\
 `external_network_name = "openstack_external_network"`

5. Initialize Terraform:\
`terraform init`

## Deploy all OpenStack resources (with flavors)
For private OpenStack cloud deployments with admin application credentials, Terraform can deploy all required OpenStack resources.

5. Deploy all OpenStack resources:
    1. `terraform apply -var-file tfvars/deployment.tfvars -var-file tfvars/vars-all.tfvars`

## Deploy base OpenStack resources (without flavors)
For public OpenStack cloud deployments or private ones without admin application credentials, it is necessary to use flavors provided by the cloud provider.

5. Deploy base OpenStack resources:
    1. Get the flavor names used for the KYPO base servers. List all flavors.\
      `openstack flavor list --column Name`
    2. Setup the following variables in vars-base.tfvars with values obtained in previous step. kypo_kubernetes_cluster_flavor_name needs at least **4 VCPUs, 16384 MB RAM and 80 GB Disk**,  kypo_proxy_flavor_name needs at least **1 CPU, 2048 MB RAM and 10 GB Disk**.
    ```
    kypo_kubernetes_cluster_flavor_name = ""
    kypo_proxy_flavor_name              = ""
    ```
    3. `terraform apply -var-file tfvars/deployment.tfvars -var-file tfvars/vars-base.tfvars`
