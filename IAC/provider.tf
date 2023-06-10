provider "aws" {
  region  = var.region
  profile = var.profile
}

terraform {
    required_providers {
      aws  = "~> 3.71.0"
    }
    required_version = ">= 1.1.2, < 2.0.0"
    backend "s3" {
        bucket  = "terraform-s3-bucket-stone" # crie manualmente para evitar problema ovo-galinha
        key     = "state/terraform.tfstate" # "path/to/my/key" # crie manualmente para evitar problema ovo-galinha
        region  = "us-east-1"
        profile = "default"
    }
}