resource "aws_security_group" "eks_ingress_sg" {
  name        = "eks-ingress-sg"
  description = "Security group for EKS Ingress Controller"
  vpc_id      = aws_vpc.base_net.id

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all egress traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "eks_lb_sg" {
  name        = "eks-lb-sg"
  description = "Security group for Load Balancer on port 515"
  vpc_id      = aws_vpc.base_net.id

  tags = {
    Name = "eks-lb-sg"
  }

  ingress {
    description = "Allow public access on port 515"
    from_port   = 515
    to_port     = 515
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all egress traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
