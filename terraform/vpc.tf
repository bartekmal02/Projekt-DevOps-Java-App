# Tworzenie sieci VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = { Name = "${var.project_name}-vpc" }
}

# Tworzenie podsieci
resource "aws_subnet" "main_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true # Serwer musi dostać publiczne IP dla Ansible
  availability_zone       = "${var.aws_region}a" # Dynamicznie bierze strefę 'a' z Twojego regionu
  tags = { Name = "${var.project_name}-subnet" }
}

# Brama internetowa - wyjście na świat
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id
  tags   = { Name = "${var.project_name}-igw" }
}

resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main_subnet.id
  route_table_id = aws_route_table.main_rt.id
}

# DEFINICJA GRUPY BEZPIECZEŃSTWA (Security Group)
resource "aws_security_group" "main_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow SSH and App traffic"
  vpc_id      = aws_vpc.main_vpc.id

  # Reguła wejściowa: SSH (dla Ansible)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Pozwala na połączenie SSH z dowolnego IP
  }

  # Reguła wejściowa: Aplikacja (np. Java Spring na 8080)
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}