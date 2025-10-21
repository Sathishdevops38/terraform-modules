output "public_ip" {
  value = aws_instance.this.public_ip
}

output "priavte_ip" {
  value = aws_instance.this.private_ip
}

output "prublic_dns" {
  value = aws_instance.this.public_dns
}