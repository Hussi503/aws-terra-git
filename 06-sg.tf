
# Create Security Group
resource "aws_security_group" "Tf_SG" {
  name        = "web-sg"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = aws_vpc.Tf-VPC.id

  # Inbound Rules
  ingress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Change to restrict IPs
  }



  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allows all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Tf_SG"
  }
}
