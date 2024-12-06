resource "aws_vpc" "base_net" {
  cidr_block = var.public_subnet_cidr_a
  tags = {
    Name = "BaseNet"
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "public_block_association_b" {
  cidr_block = var.public_subnet_cidr_b
  vpc_id     = aws_vpc.base_net.id
}

resource "aws_vpc_ipv4_cidr_block_association" "private_block_association_a" {
  cidr_block = var.private_subnet_cidr_a
  vpc_id     = aws_vpc.base_net.id
}

resource "aws_vpc_ipv4_cidr_block_association" "private_block_association_b" {
  cidr_block = var.private_subnet_cidr_b
  vpc_id     = aws_vpc.base_net.id
}

resource "aws_subnet" "public_subnet_a" {
  availability_zone       = var.availability_zone_a
  cidr_block              = var.public_subnet_cidr_a
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnetA"
  }
  vpc_id = aws_vpc.base_net.id
}

resource "aws_subnet" "public_subnet_b" {
  availability_zone       = var.availability_zone_b
  cidr_block              = var.public_subnet_cidr_b
  map_public_ip_on_launch = true
  tags = {
    Name = "PublicSubnetB"
  }
  vpc_id = aws_vpc.base_net.id
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.public_block_association_b
  ]
}

resource "aws_subnet" "private_subnet_a" {
  availability_zone       = var.availability_zone_a
  cidr_block              = var.private_subnet_cidr_a
  map_public_ip_on_launch = false
  tags = {
    Name = "BaseSubnetA"
  }
  vpc_id = aws_vpc.base_net.id
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.private_block_association_a
  ]
}

resource "aws_subnet" "private_subnet_b" {
  availability_zone       = var.availability_zone_b
  cidr_block              = var.private_subnet_cidr_b
  map_public_ip_on_launch = false
  tags = {
    Name = "BaseSubnetB"
  }
  vpc_id = aws_vpc.base_net.id
  depends_on = [
    aws_vpc_ipv4_cidr_block_association.private_block_association_b
  ]
}

resource "aws_internet_gateway" "internet_gateway" {
  tags = {
    Name = "Base Internet GW"
  }
  vpc_id = aws_vpc.base_net.id
}

resource "aws_route_table" "public" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  vpc_id = aws_vpc.base_net.id
}

resource "aws_route_table_association" "public_a" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_subnet_a.id
}

resource "aws_route_table_association" "public_b" {
  route_table_id = aws_route_table.public.id
  subnet_id      = aws_subnet.public_subnet_b.id
}

resource "aws_eip" "nat_eip" {
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_a.id
  tags = {
    Name = "Base NAT GW"
  }
}

resource "aws_route_table" "private" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  vpc_id = aws_vpc.base_net.id
}

resource "aws_route_table_association" "private_a" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_subnet_a.id
}

resource "aws_route_table_association" "private_b" {
  route_table_id = aws_route_table.private.id
  subnet_id      = aws_subnet.private_subnet_b.id
}
