resource "aws_eks_cluster" "head" {
  name     = "head"
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.public_subnet_a.id,
      aws_subnet.public_subnet_b.id,
      aws_subnet.private_subnet_a.id,
      aws_subnet.private_subnet_b.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_service_policy
  ]
}

resource "aws_eks_node_group" "workers" {
  cluster_name    = aws_eks_cluster.head.name
  node_group_name = "workers"
  node_role_arn   = aws_iam_role.workers.arn

  subnet_ids = [
    aws_subnet.private_subnet_a.id,
    aws_subnet.private_subnet_b.id
  ]

  capacity_type  = var.use_spot_instance ? "SPOT" : "ON_DEMAND"
  instance_types = [var.worker_instance_type]

  scaling_config {
    desired_size = var.worker_group.desired_size
    max_size     = var.worker_group.max_size
    min_size     = var.worker_group.min_size
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_ec2_policy
  ]
}
