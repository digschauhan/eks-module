output "private_ip" {
    value = aws_instance.app_server.private_ip
}

output "private_dns" {
    value = aws_instance.app_server.private_dns
}