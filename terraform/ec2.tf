# 1. Rejestracja klucza przy użyciu zmiennej
resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.public_key 
}

# 2. Definicja serwera
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  key_name      = aws_key_pair.deployer.key_name 
  
  subnet_id                   = aws_subnet.main_subnet.id
  vpc_security_group_ids      = [aws_security_group.main_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = var.project_name
  }
}