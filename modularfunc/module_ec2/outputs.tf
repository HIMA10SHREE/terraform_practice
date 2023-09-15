output "public-ip-address" {
  value = aws_instance.module-instance.public_ip
}