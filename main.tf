# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }

# backend "s3" {
#   bucket = "tfsssaws"
#   region = "us-east-1"
# }
# }

# Configure the AWS Provider
provider "aws" {
  region = var.region_name
}

# Create VPC
resource "aws_vpc" "Tf-VPC" {
  cidr_block           = var.vpc-cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name    = "Tf-VPC"
    Service = "Terraform"
  }
}

# Create Subnets
resource "aws_subnet" "Tf-public-subnet" {
  vpc_id                  = aws_vpc.Tf-VPC.id
  cidr_block              = var.subnet-cidr-block
  availability_zone       = var.subnet-az
  map_public_ip_on_launch = true

  tags = {
    Name = "Tf-public-subnet"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "Tf-IGW" {
  vpc_id = aws_vpc.Tf-VPC.id

  tags = {
    Name = var.igw-tag
  }
}

# Create Route Table for Public Subnet
resource "aws_route_table" "Tf-RT" {
  vpc_id = aws_vpc.Tf-VPC.id

  route {
    cidr_block = var.rt-cidr
    gateway_id = aws_internet_gateway.Tf-IGW.id
  }

  tags = {
    Name = var.rt-tag
  }
}

resource "aws_route_table_association" "Tf-ASA" {

  subnet_id      = aws_subnet.Tf-public-subnet.id
  route_table_id = aws_route_table.Tf-RT.id

}


# Create Security Group
resource "aws_security_group" "Tf_SG" {
  name        = var.sg-name
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = aws_vpc.Tf-VPC.id

  # Inbound Rules
  ingress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg-ingress-cidr # Change to restrict IPs
  }



  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allows all outbound traffic
    cidr_blocks = var.sg-egress-cidr
  }

  tags = {
    Name = "var.sg-tag"
  }
}

# Create an EC2 Instance
resource "aws_instance" "Tf_Server" {
  ami                         = var.ec2-ami # Replace with a valid Amazon Linux 2 AMI ID
  availability_zone           = var.ec2-az
  instance_type               = var.ec2-ins-type
  key_name                    = var.ec2-key-pair
  subnet_id                   = aws_subnet.Tf-public-subnet.id
  vpc_security_group_ids      = [aws_security_group.Tf_SG.id]
  associate_public_ip_address = true

  tags = {
    Name  = var.ec2-tag
    env   = "dev"
    owner = "vihaan"
  }

}







