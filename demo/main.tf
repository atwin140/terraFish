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
