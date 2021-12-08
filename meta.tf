terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    region = var.region
    bucket = var.backend_bucket
    key    = "${var.backend_bucket}-tfstate-main"
  }

  required_providers {
    aws = {
      source  = "aws"
      version = "3.59.0"
    }
  }

}
