terraform {
  required_version = ">= 1.0.0"
  backend "s3" {
    region = "ap-southeast-2"
    bucket = "tkav-jenkins"
    key    = "tkav-jenkins-tfstate-main"
  }

  required_providers {
    aws = {
      source  = "aws"
      version = "3.59.0"
    }
  }

}
