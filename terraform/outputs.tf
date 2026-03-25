output "instance_public_ip" {
  description = "Publiczny adres IP instancji EC2"
  value       = aws_instance.app_server.public_ip
}

output "instance_id" {
  description = "Identyfikator instancji EC2"
  value       = aws_instance.app_server.id
}

output "instance_public_dns" {
  description = "Publiczna nazwa DNS instancji"
  value       = aws_instance.app_server.public_dns
}

output "security_group_id" {
  description = "Identyfikator grupy bezpieczeństwa"
  value       = aws_security_group.main_sg.id
}

output "app_url" {
  description = "Adres URL aplikacji Java"
  value       = "http://${aws_instance.app_server.public_ip}:8080"
}

output "prometheus_url" {
  description = "Adres URL interfejsu Prometheus"
  value       = "http://${aws_instance.app_server.public_ip}:9090"
}

output "grafana_url" {
  description = "Adres URL interfejsu Grafana"
  value       = "http://${aws_instance.app_server.public_ip}:3000"
}