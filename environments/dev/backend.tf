# here we are configuring remote backend in creating infrastructure
terraform {
  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "482624377735-terraform-states"
    key            = "ec2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}
