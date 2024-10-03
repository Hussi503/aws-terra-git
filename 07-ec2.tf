# Create an EC2 Instance
resource "aws_instance" "Tf_Server" {
  ami                         = "ami-0866a3c8686eaeeba" # Replace with a valid Amazon Linux 2 AMI ID
  instance_type               = "t2.micro"
  key_name                    = "my-key-pair"
  subnet_id                   = aws_subnet.Tf-public-subnet.id
  vpc_security_group_ids      = [aws_security_group.Tf_SG.id]
  associate_public_ip_address = true

  tags = {
    Name  = "Tf-Server"
    env   = "dev"
    owner = "vihaan"
  }

}
