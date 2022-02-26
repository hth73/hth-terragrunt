# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT MODULE CONFIGURATION
# ---------------------------------------------------------------------------------------------------------------------
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@gitea.domain.local:8080/hth/hth-terraform.git//${local.env_vars.locals.environment}/${path_relative_to_include()}?ref=master"
}

locals {
  # Automatically load modules variables
  module_vars = read_terragrunt_config("module_vars.hcl")

  # Automatically load environment variables
  env_vars = read_terragrunt_config(find_in_parent_folders("env_vars.hcl"))

  # Automatically global region variables
  region_vars = read_terragrunt_config(find_in_parent_folders("../region_vars.hcl"))
}

inputs = merge(
  local.module_vars.locals,
  local.env_vars.locals,
  local.env_vars.inputs,
  local.region_vars.locals,
  {
    vpc_name          = local.env_vars.inputs.vpc_name
    env_name          = local.env_vars.inputs.env_name
    name              = local.module_vars.locals.name
    billing_tag       = local.module_vars.locals.billing_tag
    shared_vpn_subnet = local.env_vars.inputs.public-subnet
  }
)
