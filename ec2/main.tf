terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "ALinux_ohio" {
    ami           = "ami-02a89066c48741345"  #us-east-2, Amazon Linux
    instance_type = "t2.micro"
    key_name      = "macbook@400048mbp"
    tags = {
      Name = "ALinux_ohio_jenkins"
  }
}