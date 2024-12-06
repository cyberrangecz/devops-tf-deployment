resource "aws_network_interface" "proxy_interface" {
  security_groups = [
    "${aws_security_group.proxy.id}"
  ]
  subnet_id = aws_subnet.public_subnet_a.id
}

resource "aws_instance" "proxy" {
  ami           = var.proxy_ami
  instance_type = var.proxy_instance_type
  key_name      = aws_key_pair.key_pair.key_name
  tags = {
    Name = "Proxy Jump"
  }
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.proxy_interface.id
  }

  dynamic "instance_market_options" {
    for_each = var.use_spot_instance ? [1] : []
    content {
      market_type = "spot"

      spot_options {
        spot_instance_type = "one-time"
      }
    }
  }
}
