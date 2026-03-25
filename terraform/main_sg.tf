resource "aws_security_group" "main_sg" {
  name   = "main_sg"
  vpc_id = aws_vpc.main_vpc.id # KLUCZOWE: Powiązanie z nową siecią

}