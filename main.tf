resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "key_pair" {
  public_key = tls_private_key.private_key.public_key_openssh
  key_name   = var.key_name
  tags = {
    Name = "VPC-KeyPair"
  }
}

resource "aws_key_pair" "key_pair_secondary" {
  public_key = tls_private_key.private_key.public_key_openssh
  key_name   = var.key_name
  tags = {
    Name = "VPC-KeyPair"
  }
  provider = aws.secondary
}

resource "local_file" "key" {
  filename = "./narenkp.pem"
  content  = tls_private_key.private_key.private_key_pem
}

resource "aws_vpc" "vpc_request" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC"
  }
}

resource "aws_vpc" "vpc_accept" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "VPC"
  }
  provider = aws.secondary
}


module "requester" {
  source                    = "./requester_vpc_config"
  az                        = "a"
  vpc_id                    = aws_vpc.vpc_request.id
  public_subnet_cidr        = "10.0.0.0/24"
  private_subnet_cidr       = "10.10.1.0/24"
  ami                       = "ami-0ed9277fb7eb570c9"
  key_pair                  = var.key_name
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection.id
}

module "accepter" {
  source                    = "./accepter_vpc_config"
  az                        = "a"
  vpc_id                    = aws_vpc.vpc_accept.id
  public_subnet_cidr        = "10.0.0.0/24"
  private_subnet_cidr       = "10.10.1.0/24"
  ami                       = "ami-00f7e5c52c0f43726"
  key_pair                  = var.key_name
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection.id
  providers = {
    aws = aws.secondary
  }
}

output "r1_public_ip" {
  value = module.requester.public_ip
}

output "r2_private_ip" {
  value = module.accepter.private_ip
}

output "r1_vpc_id" {
  value = aws_vpc.vpc_request.id
}

output "r2_vpc_id" {
  value = aws_vpc.vpc_accept.id
}
#data "aws_caller_identity" "whoami_primary" {}
data "aws_caller_identity" "whoami_secondary" {
  provider = aws.secondary
}
#
# Requester's side of the connection.
resource "aws_vpc_peering_connection" "vpc_peering_connection" {
  vpc_id        = aws_vpc.vpc_request.id
  peer_vpc_id   = aws_vpc.vpc_accept.id
  peer_owner_id = data.aws_caller_identity.whoami_secondary.account_id
  peer_region   = var.secondary_region
  auto_accept   = false

  tags = {
    Name = "VPC-Peering-Requester"
    Side = "Requester"
  }
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "vpc_peering_connection_accepter" {
  provider                  = aws.secondary
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering_connection.id
  auto_accept               = true

  tags = {
    Name = "VPC-Peering-Accepter"
    Side = "Accepter"
  }
}

