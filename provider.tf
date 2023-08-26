# Terraform Block
terraform {
  required_version = "~> 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.14.0"
    }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  # profile = "default"
  # access_key = var.accesskey
  # secret_key = var.secretkey
}