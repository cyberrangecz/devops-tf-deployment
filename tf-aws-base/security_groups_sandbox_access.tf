resource "aws_security_group" "sandbox_access" {
  name        = "sandbox-access-sg"
  description = "Security group for sandbox access"
  vpc_id      = aws_vpc.base_net.id
}

resource "aws_security_group_rule" "sandbox_access_egress_ipv4" {
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.sandbox_access.id
  to_port           = 65535
  type              = "egress"
}

resource "aws_security_group_rule" "sandbox_access_egress_ipv6" {
  from_port = 0
  ipv6_cidr_blocks = [
    "::/0"
  ]
  protocol          = "-1"
  security_group_id = aws_security_group.sandbox_access.id
  to_port           = 65535
  type              = "egress"
}

data "aws_security_group" "eks_cluster_sg" {
  vpc_id = aws_vpc.base_net.id

  tags = {
    "aws:eks:cluster-name" = aws_eks_cluster.head.name
  }
}

resource "aws_security_group_rule" "sandbox_access_head_tcp" {
  from_port                = 4822
  protocol                 = "TCP"
  security_group_id        = aws_security_group.sandbox_access.id
  source_security_group_id = data.aws_security_group.eks_cluster_sg.id
  to_port                  = 4822
  type                     = "ingress"
}

resource "aws_security_group_rule" "sandbox_access_head_udp" {
  from_port                = 4822
  protocol                 = "UDP"
  security_group_id        = aws_security_group.sandbox_access.id
  source_security_group_id = data.aws_security_group.eks_cluster_sg.id
  to_port                  = 4822
  type                     = "ingress"
}

resource "aws_security_group_rule" "sandbox_access_proxy_tcp" {
  from_port                = 0
  protocol                 = "TCP"
  security_group_id        = aws_security_group.sandbox_access.id
  source_security_group_id = aws_security_group.proxy.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "sandbox_access_proxy_udp" {
  from_port                = 0
  protocol                 = "UDP"
  security_group_id        = aws_security_group.sandbox_access.id
  source_security_group_id = aws_security_group.proxy.id
  to_port                  = 65535
  type                     = "ingress"
}
