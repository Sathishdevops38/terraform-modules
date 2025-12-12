data "aws_ami" "ami_2023" {
  most_recent = true
  owners      = ["self"] # The owner alias for official Amazon AMIs

  filter {
    name   = "name"
    values = ["devops-practice"] # Filter for AL2023 AMIs, adjust for arm64 if needed
  }

  filter {
    name   = "architecture"
    values = ["x86_64"] # Specify the desired architecture
  }
}


