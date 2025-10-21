module "catalogue" {
  source = "../ec2_module"
  instance_type = "t3.micro"
  security_groups = ["sg-0600160900a41e0f2"]
  tags = {
    Name = "catalogue"
    Terraform = true
  }
}