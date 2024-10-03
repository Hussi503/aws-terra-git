# Create Route Table for Public Subnet
resource "aws_route_table" "Tf-RT" {
  vpc_id = aws_vpc.Tf-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Tf-IGW.id
  }

  tags = {
    Name = "Tf-RT"
  }
}
