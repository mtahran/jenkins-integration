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


resource "aws_instance" "app_server" {
    ami           = "ami-02a89066c48741345"  #us-east-2, Amazon Linux
    instance_type = "t2.micro"
    key_name               = var.key_name
    subnet_id              = values(data.aws_subnet.subnet_id)[0].id
    vpc_security_group_ids = [aws_security_group.sg_app_server.id]
    tags = {
      Name = "app_server"
  }
}

resource "aws_security_group" "sg_app_server" {
  name        = var.sg_name
  description = "Allow ssh and http inbound traffic"
  vpc_id      = data.aws_vpc.default_vpc.id
  tags = merge(
    local.common_tags,
    {
      Name = "sg_app_server"
    }
  )
}

resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.jenkins_server_ip
  security_group_id = aws_security_group.sg_app_server.id
}

resource "aws_security_group_rule" "ingress_ssh" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.http_cidr_block
  security_group_id = aws_security_group.sg_app_server.id
}

resource "aws_security_group_rule" "ingress_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.jenkins_server_ip
  security_group_id = aws_security_group.sg_app_server.id
}


resource "aws_security_group_rule" "egree_allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_app_server.id
}