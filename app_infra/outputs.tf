output "instance_private_ip" {
  description = "public ip of instance created for app"
  value = aws_instance.app_server.private_ip
}