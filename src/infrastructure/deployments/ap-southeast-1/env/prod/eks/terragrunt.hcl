include "root" {
  path = find_in_parent_folders("terragrunt.hcl")
}

terraform {
  source = "../../../../../modules/eks"
}

dependency "vpc" {
  config_path = "../vpc"

  mock_outputs = {
    vpc_id                    = "vpc-abcd1234"
    subnet_ids               = ["subnet-abcd1234", "subnet-bcd1234a"]
    control_plane_subnet_ids = ["subnet-abcd1234", "subnet-bcd1234a"]
  }
  mock_outputs_allowed_terraform_commands = ["validate"]
}

inputs = {
  vpc_id                      = dependency.vpc.outputs.vpc_id
  subnet_ids                  = dependency.vpc.outputs.private_subnets
  control_plane_subnet_ids    = dependency.vpc.outputs.private_subnets
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region     = var.region
}
EOF
}
