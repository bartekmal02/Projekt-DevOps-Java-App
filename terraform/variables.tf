variable "aws_region" {
  description = "Region AWS dla zasobów"
  type        = string
  default     = "eu-central-1"
}

variable "ami_id" {
  description = "Identyfikator obrazu systemu (AMI)"
  type        = string
  default     = "ami-0faab6bdbac9486fb" # Ubuntu 24.04 LTS
}

variable "instance_type" {
  description = "Typ instancji EC2"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Nazwa klucza SSH zarejestrowanego w AWS"
  type        = string
}

variable "project_name" {
  description = "Nazwa projektu wykorzystywana w tagach i nazewnictwie"
  type        = string
  default     = "DevOps-Java-App"
}

variable "public_key" {
  type = string
}