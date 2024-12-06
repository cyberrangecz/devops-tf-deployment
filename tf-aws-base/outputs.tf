output "proxy_public_ip" {
  value       = aws_instance.proxy.public_ip
  description = "IP address of Proxy Jump host"
}

output "proxy_key" {
  value       = base64encode(nonsensitive(tls_private_key.admin.private_key_pem))
  description = "Base64 encoded Proxy Jump ssh private key"
}

data "aws_eks_cluster" "head" {
  name = aws_eks_cluster.head.name
}

output "eks_cluster_host" {
  value       = data.aws_eks_cluster.head.endpoint
  description = "URL of Kubernetes API"
}

output "eks_cluster_ca_certificate" {
  value       = data.aws_eks_cluster.head.certificate_authority[0].data
  description = "Kubernetes API CA certificate"
}

data "aws_instances" "node_group_instances" {
  filter {
    name   = "tag:eks:nodegroup-name"
    values = [aws_eks_node_group.workers.node_group_name]
  }

  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}

data "aws_instance" "first_node_group_instance" {
  instance_id = data.aws_instances.node_group_instances.ids[0]
}

output "eks_node_group_security_group" {
  value       = tolist(data.aws_instance.first_node_group_instance.vpc_security_group_ids)[0]
  description = "EKS node group security group ID"
}

output "vpc_id" {
  value       = aws_subnet.private_subnet_a.vpc_id
  description = "BaseNet VPC ID"
}

output "eks_node_group_subnet_ids" {
  value       = [aws_subnet.private_subnet_a.id, aws_subnet.private_subnet_b.id]
  description = "Subnet IDs used by the EKS node group"
}
