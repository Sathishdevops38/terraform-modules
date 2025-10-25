module "catalogue" {
  source = "../ec2_module"
  # num_instance = 3
  project_name = "catalogue"
  environment = "dev"
  instance_type = "t3.micro"
  sg_ids = ["sg-0600160900a41e0f2"]
  tags = {
    Terraform = true
    Environment = "dev"
  }
}