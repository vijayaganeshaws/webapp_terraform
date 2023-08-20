# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider region
provider "aws" {
  region = "eu-west-2"
}

# Configure the alias AWS Provider region
provider "aws" {
  alias  = "southeast"
  region = "ap-southeast-2"
}