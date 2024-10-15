# Create Subnets
resource "aws_subnet" "Tf-public-subnet" {
  vpc_id                  = aws_vpc.Tf-VPC.id
  cidr_block              = "10.1.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Tf-public-subnet"
  }
}
