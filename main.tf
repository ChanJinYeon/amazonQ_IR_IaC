terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source       = "./modules/terraform-aws-VPC"
  project_name = "amazonQ_IR"

  availability_zone = slice(data.aws_availability_zones.available.names, 0, 3)
}