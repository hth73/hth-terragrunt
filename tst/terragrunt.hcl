# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT ENVIRONMENT CONFIGURATION
# ---------------------------------------------------------------------------------------------------------------------
locals {
  # Automatically load global region variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region_vars.hcl"))

  # Extract the variables we need for easy access
  aws_region = local.region_vars.locals.aws_region
  aws_azs    = local.region_vars.locals.aws_azs
}

# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT ENVIRONMENT PARAMETERS
# ---------------------------------------------------------------------------------------------------------------------
inputs = merge(
  local.region_vars.locals,
)
