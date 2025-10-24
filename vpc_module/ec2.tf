resource "aws_instance" "this"{
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = var.sg_ids
    subnet_id = aws_subnet.public[0].id
    tags= var.tags

    provisioner "local-exec" {
      command = "echo 'Resource created: ${self.private_ip}'"
    }

    provisioner "remote-exec" {
      inline = [
        "sudo dnf install -y nginx",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
    ]
    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
  }
  }
}

