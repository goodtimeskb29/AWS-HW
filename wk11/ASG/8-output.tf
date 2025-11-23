output "ip_address" {
  value = aws_instance.latinas.public_ip
}

output "website_url" {
  value = "http://${aws_instance.latinas.public_dns}"
}