# Create Internet Gateway
resource "aws_internet_gateway" "Tf-IGW" {
  vpc_id = aws_vpc.Tf-VPC.id

  tags = {
    Name = "Tf-IGW"
  }
}
