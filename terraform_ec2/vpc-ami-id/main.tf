provider "aws" {
    region  = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my-subnet" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
}

// use SSM public endpoint to get AMI Params
data "aws_ssm_parameter" "data-params" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}