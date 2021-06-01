provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_amazon_docker" {
  ami = "ami-0d5eff06f840b45e9"
  instance_type = "t2.micro"
  user_data = file("user_data.sh")
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-mushatov"
}

terraform {
  backend "s3"{
    bucket = "terraform-state-mushatov"
    key = "terraform-state"
    region = "us-east-1"
  }
}