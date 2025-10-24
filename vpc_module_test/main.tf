module "this" {
  source = "../vpc_module"
  cidr = var.vpc_cidr
  project_name = "roboshop"
  environment = "dev"
  public_subnet_cidrs = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24","10.0.12.0/24"]
  database_subnet_cidrs = ["10.0.21.0/24","10.0.22.0/24"]
  instance_type = "t3.micro"
  sg_ids =   ["sg-0ec420ab4eee98afd"]
  tags = {
    Name = "catalogue"
    Terraform = true
  }
}
