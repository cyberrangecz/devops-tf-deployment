resource "aws_security_group" "proxy" {
  name        = "base-proxy-sg"
  description = "Security group of Proxy Jump"
  vpc_id      = aws_vpc.base_net.id
}

resource "aws_security_group_rule" "proxy_egress_ipv4" {
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.proxy.id
  to_port           = 65535
  type              = "egress"
}

resource "aws_security_group_rule" "proxy_egress_ipv6" {
  from_port = 0
  ipv6_cidr_blocks = [
    "::/0"
  ]
  protocol          = "-1"
  security_group_id = aws_security_group.proxy.id
  to_port           = 65535
  type              = "egress"
}

resource "aws_security_group_rule" "proxy_icmp" {
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  from_port         = -1
  protocol          = "ICMP"
  security_group_id = aws_security_group.proxy.id
  to_port           = -1
  type              = "ingress"
}

resource "aws_security_group_rule" "proxy_sandbox_access_tcp" {
  from_port                = 0
  protocol                 = "TCP"
  security_group_id        = aws_security_group.proxy.id
  source_security_group_id = aws_security_group.sandbox_access.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "proxy_sandbox_access_udp" {
  from_port                = 0
  protocol                 = "UDP"
  security_group_id        = aws_security_group.proxy.id
  source_security_group_id = aws_security_group.sandbox_access.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "proxy_ssh" {
  cidr_blocks = [
    "0.0.0.0/0"
  ]
  from_port         = 22
  protocol          = "TCP"
  security_group_id = aws_security_group.proxy.id
  to_port           = 22
  type              = "ingress"
}
