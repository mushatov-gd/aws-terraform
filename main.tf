provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "my_amazon_docker" {
  ami = "ami-077e31c4939f6a2f3"
  instance_type = "t2.micro"
  user_data = file("user_data.sh")
  tags = {
    Name = "gd-site-terraform-instance"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "gd-site-terraform-state"
}

terraform {
  backend "s3"{
    bucket = "gd-site-terraform-state"
    key = "terraform.tfstate"
    region = "us-east-2"
  }
}