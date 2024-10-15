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

resource "aws_route_table_association" "Tf-ASA" {

  subnet_id      = aws_subnet.Tf-public-subnet.id
  route_table_id = aws_route_table.Tf-RT.id

}
