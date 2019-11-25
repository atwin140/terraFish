provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "ad_allow_ssh" {
  name        = "ad_allow_ssh"
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
  }
  tags = {
    "Created By" = "Andrew Darley"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0c322300a1dd5dc79"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.terraform-20191121222237976000000002.name}"]
  tags = {
    Name = "Terraformtest"
    "Created By" = "Andrew Darley"
  }
}