provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  tags = {
    Name = "Terraformtest"
    "Created By" = "Andrew Darley"
  }
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH from Admin System"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["138.68.55.106/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = ["pl-12c4e678"]
  }
  tags = {
    "Created By" = "Andrew Darley"
  }
}
