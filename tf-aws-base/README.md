<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.38.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | 3.2.2 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.38.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat_eip](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/eip) | resource |
| [aws_eks_cluster.head](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.workers](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/eks_node_group) | resource |
| [aws_iam_policy.efs_client_access_policy](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.eks_cluster](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/iam_role) | resource |
| [aws_iam_role.workers](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.efs_client_access_attachment](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_policy](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cni_policy](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_ec2_policy](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_service_policy](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_worker_node_policy](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.proxy](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/instance) | resource |
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/internet_gateway) | resource |
| [aws_key_pair.key_pair](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/key_pair) | resource |
| [aws_nat_gateway.nat_gw](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/nat_gateway) | resource |
| [aws_network_interface.proxy_interface](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/network_interface) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_a](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_b](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_a](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_b](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/route_table_association) | resource |
| [aws_security_group.eks_ingress_sg](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group) | resource |
| [aws_security_group.eks_lb_sg](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group) | resource |
| [aws_security_group.proxy](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group) | resource |
| [aws_security_group.sandbox_access](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group) | resource |
| [aws_security_group_rule.proxy_egress_ipv4](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.proxy_egress_ipv6](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.proxy_icmp](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.proxy_sandbox_access_tcp](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.proxy_sandbox_access_udp](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.proxy_ssh](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sandbox_access_egress_ipv4](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sandbox_access_egress_ipv6](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sandbox_access_head_tcp](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sandbox_access_head_udp](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sandbox_access_proxy_tcp](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.sandbox_access_proxy_udp](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/security_group_rule) | resource |
| [aws_subnet.private_subnet_a](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_b](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_a](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_b](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/subnet) | resource |
| [aws_vpc.base_net](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/vpc) | resource |
| [aws_vpc_ipv4_cidr_block_association.private_block_association_a](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [aws_vpc_ipv4_cidr_block_association.private_block_association_b](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [aws_vpc_ipv4_cidr_block_association.public_block_association_b](https://registry.terraform.io/providers/aws/5.38.0/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [tls_private_key.admin](https://registry.terraform.io/providers/hashicorp/tls/4.0.5/docs/resources/private_key) | resource |
| [aws_eks_cluster.head](https://registry.terraform.io/providers/aws/5.38.0/docs/data-sources/eks_cluster) | data source |
| [aws_instance.first_node_group_instance](https://registry.terraform.io/providers/aws/5.38.0/docs/data-sources/instance) | data source |
| [aws_instances.node_group_instances](https://registry.terraform.io/providers/aws/5.38.0/docs/data-sources/instances) | data source |
| [aws_security_group.eks_cluster_sg](https://registry.terraform.io/providers/aws/5.38.0/docs/data-sources/security_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone_a"></a> [availability\_zone\_a](#input\_availability\_zone\_a) | Subnet availability zone A | `string` | `"eu-central-1a"` | no |
| <a name="input_availability_zone_b"></a> [availability\_zone\_b](#input\_availability\_zone\_b) | Subnet availability zone B | `string` | `"eu-central-1b"` | no |
| <a name="input_private_subnet_cidr_a"></a> [private\_subnet\_cidr\_a](#input\_private\_subnet\_cidr\_a) | CIDR of private subnet A | `string` | `"192.168.2.0/24"` | no |
| <a name="input_private_subnet_cidr_b"></a> [private\_subnet\_cidr\_b](#input\_private\_subnet\_cidr\_b) | CIDR of private subnet B | `string` | `"192.168.3.0/24"` | no |
| <a name="input_proxy_ami"></a> [proxy\_ami](#input\_proxy\_ami) | Proxy Jump AMI | `string` | `"ami-066902f7df67250f8"` | no |
| <a name="input_proxy_instance_type"></a> [proxy\_instance\_type](#input\_proxy\_instance\_type) | Proxy Jump instance type | `string` | `"t3.micro"` | no |
| <a name="input_public_subnet_cidr_a"></a> [public\_subnet\_cidr\_a](#input\_public\_subnet\_cidr\_a) | CIDR of public subnet A | `string` | `"192.168.0.0/24"` | no |
| <a name="input_public_subnet_cidr_b"></a> [public\_subnet\_cidr\_b](#input\_public\_subnet\_cidr\_b) | CIDR of public subnet B | `string` | `"192.168.1.0/24"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"eu-central-1"` | no |
| <a name="input_use_spot_instance"></a> [use\_spot\_instance](#input\_use\_spot\_instance) | If spot instances should be used instead of on demand | `bool` | `false` | no |
| <a name="input_worker_group"></a> [worker\_group](#input\_worker\_group) | Size of EKS node group | <pre>object({<br/>    min_size     = number<br/>    max_size     = number<br/>    desired_size = number<br/>    }<br/>  )</pre> | <pre>{<br/>  "desired_size": 1,<br/>  "max_size": 2,<br/>  "min_size": 1<br/>}</pre> | no |
| <a name="input_worker_instance_type"></a> [worker\_instance\_type](#input\_worker\_instance\_type) | EKS node group instance type | `string` | `"t3.xlarge"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_cluster_ca_certificate"></a> [eks\_cluster\_ca\_certificate](#output\_eks\_cluster\_ca\_certificate) | Kubernetes API CA certificate |
| <a name="output_eks_cluster_host"></a> [eks\_cluster\_host](#output\_eks\_cluster\_host) | URL of Kubernetes API |
| <a name="output_eks_node_group_security_group"></a> [eks\_node\_group\_security\_group](#output\_eks\_node\_group\_security\_group) | EKS node group security group ID |
| <a name="output_eks_node_group_subnet_ids"></a> [eks\_node\_group\_subnet\_ids](#output\_eks\_node\_group\_subnet\_ids) | Subnet IDs used by the EKS node group |
| <a name="output_proxy_key"></a> [proxy\_key](#output\_proxy\_key) | Base64 encoded Proxy Jump ssh private key |
| <a name="output_proxy_public_ip"></a> [proxy\_public\_ip](#output\_proxy\_public\_ip) | IP address of Proxy Jump host |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | BaseNet VPC ID |
<!-- END_TF_DOCS -->
