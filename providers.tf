terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
      }
    }

    backend "s3" {
      bucket              = "cicd-pipeline"
      key                 = "oidc-pipeline/terraform.tfstate"
      region              = "us-east-1"
      object_lock_enabled = true
    }
  
  }

provider "aws" {
    region = "us-east-1"
  }