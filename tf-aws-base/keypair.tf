resource "tls_private_key" "admin" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "key_pair" {
  key_name   = "aws-base"
  public_key = tls_private_key.admin.public_key_openssh
}
