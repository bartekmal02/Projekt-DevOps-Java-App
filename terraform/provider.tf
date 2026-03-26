terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # KONFIGURACJA PAMIĘCI (STATE) W S3
  # Dzięki temu Terraform "pamięta" infrastrukturę między uruchomieniami
  backend "s3" {
    bucket = "barmal-devops-project-state" 
    key    = "terraform.tfstate"           
    region = "eu-central-1"
  }
}

provider "aws" {
  region = var.aws_region
}