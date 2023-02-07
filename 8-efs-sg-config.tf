module "efs_services_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = "efs-services-sg"
  description = "Allow access to efs services"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress_cidr_blocks = ["10.0.0.0/16"]
  ingress_rules       = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "NFS"
      cidr_blocks = "10.0.0.0/16"
    },
    {
      rule        = "nfs-2049-udp"
      cidr_blocks = "0.0.0.0/0"
  }]

  egress_rules = ["all-all"]

}

