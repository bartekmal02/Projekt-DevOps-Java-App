import {
  to = aws_s3_bucket.terraform_state
  id = "barmal-devops-project-state"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "barmal-devops-project-state"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Dev"
  }
}