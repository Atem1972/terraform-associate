terraform {
  cloud {
    workspaces {
      name = "data-sources-vpc"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.45.0"
    }
  }

  required_version = "~> 1.2"
}
