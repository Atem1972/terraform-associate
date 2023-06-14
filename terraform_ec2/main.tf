provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0"
    }
  }
}

// Loading our module : please put in the source attribute your own dir to your module create earlier.
module "vpc" {
  source = "./modules/vpc-ami-id"
  //source = "/home/hermann90/modules/vpc-ami-id"
  region = var.region
}

// Using the output for our module in the main or root code
resource "aws_instance" "my-instance" {
  ami           = module.vpc.ami_id
  subnet_id     = module.vpc.subnet_id
  instance_type = "t3.micro"
  tags = {
    Name = "ec2-custom-module"
  }
}