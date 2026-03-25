# Definicja serwera EC2
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  
  # Powiązanie z Twoją NOWĄ podsiecią (z pliku vpc.tf)
  subnet_id     = aws_subnet.main_subnet.id
  
  # Powiązanie z Twoją grupą bezpieczeństwa
  vpc_security_group_ids = [aws_security_group.main_sg.id]

  # Wymuszenie publicznego adresu IP
  associate_public_ip_address = true

  tags = {
    Name = var.project_name
  }
}