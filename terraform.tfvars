region_name       = "us-east-1"
vpc-cidr_block    = "10.0.0.0/16"
subnet-cidr-block = "10.0.1.0/24"
subnet-az         = "us-east-1a"
igw-tag           = "tf-sg"
rt-cidr           = "0.0.0.0/0"
rt-tag            = "terra-rt"
sg-name           = "terra-rt"
sg-ingress-cidr   = ["0.0.0.0/0"]
sg-egress-cidr    = ["0.0.0.0/0"]
sg-tag            = "terra-sg"
ec2-ami           = "ami-0866a3c8686eaeeba"
ec2-ins-type      = "t2.micro"
ec2-key-pair      = "my-key-pair"
ec2-tag           = "tf-ec2"
ec2-az            = "us-east-1a"



