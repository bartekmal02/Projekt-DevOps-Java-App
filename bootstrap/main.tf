provider "aws" {
  region = "eu-central-1"
}

import {
  to = aws_s3_bucket.terraform_state
  id = "barmal-devops-project-state"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "barmal-devops-project-state"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}

# 3. Włączenie wersjonowania
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 4. Blokada publicznego dostępu
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}