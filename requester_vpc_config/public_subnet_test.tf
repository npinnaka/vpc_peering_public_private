resource "aws_security_group" "public_sg" {
  name = "VPC-Public-Security-Group"
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [var.all_traffic]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = [var.all_traffic]
  }
  vpc_id = var.vpc_id
  tags = {
    Name = "VPC-Public-Security-Group"
  }
}

resource "aws_instance" "public_instance" {
  instance_type          = "t2.micro"
  ami                    = var.ami
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = var.key_pair
  tags = {
    name = "VPC-Public-Instance"
  }
}