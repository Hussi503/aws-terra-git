
resource "aws_route_table_association" "Tf-ASA" {

  subnet_id      = aws_subnet.Tf-public-subnet.id
  route_table_id = aws_route_table.Tf-RT.id

}
