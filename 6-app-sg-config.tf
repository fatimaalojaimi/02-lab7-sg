module "app_services_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = "app-services-sg"
  description = "Allow access to app services"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["all-all"]
  egress_rules = ["all-all"]

}