# bootstrap/main.tf

provider "aws" {
  region = "eu-central-1" # Region Frankfurt
}

# Tworzenie unikalnego Bucketa S3 na stan Terraforma
resource "aws_s3_bucket" "terraform_state" {
  # Nazwa bucketu
  bucket = "barmal-devops-project-state" 

  # Zabezpieczenie przed przypadkowym usunięciem infrastruktury
  lifecycle {
    prevent_destroy = true
  }
}

# Włączenie wersjonowania - pozwala wrócić do poprzedniego stanu w razie błędu
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Blokada publicznego dostępu dla bezpieczeństwa danych infrastruktury
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}