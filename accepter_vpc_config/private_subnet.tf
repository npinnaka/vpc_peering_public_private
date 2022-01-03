resource "aws_subnet" "private_subnet" {
  cidr_block              = var.private_subnet_cidr
  vpc_id                  = var.vpc_id
  map_public_ip_on_launch = false
  availability_zone       = "${local.region}${var.az}"
  tags = {
    Name = "VPC-Public-Subnet"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = var.vpc_id
  tags = {
    Name = "VPC-Private-Subnet"
  }
  route {
    cidr_block                = var.public_subnet_cidr
    vpc_peering_connection_id = var.vpc_peering_connection_id
  }
}

resource "aws_route_table_association" "private_route_table_mapping" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet.id
}