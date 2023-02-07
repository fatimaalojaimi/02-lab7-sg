# Store the state file in Terraform Cloud for Security Groups
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "fatimaoj-aws-arch"

    workspaces {
      name = "02-lab7-sg"
    }
  }
}

# Restore the VPC and Subnet state files from Terraform Cloud
data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "fatimaoj-aws-arch"

    workspaces = {
      name = "01-lab7-vpc"
    }
  }
}
