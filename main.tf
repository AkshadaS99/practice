terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.74.0"
    }
 }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO+hH81N7t/sQTYfBbcGqnVzil3RQ0BsD6iR/Gyybwoe Dell@DESKTOP-MDQ9LEM"
}
resource "aws_instance" "this" {
  ami = "ami-063d43db0594b521b"
  
  key_name = aws_key_pair.deployer.key_name
  instance_type = "t2.medium"
    tags = {
    Name = "test-spot"
  }
}