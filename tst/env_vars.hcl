# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT ENVIRONMENT VARIABLES CONFIGURATION
# ---------------------------------------------------------------------------------------------------------------------
locals {
  environment = "tst"
  owner       = "hth"
}

inputs = {
  vpc_name       = "${local.environment}-${local.owner}"
  env_name       = "${local.environment}-${local.owner}"
  stage          = local.environment
  vpc_id         = "vpc-00ce126781fb698bf"
  public-subnet  = [
    "subnet-0a82700bd9714bccf", # tst-hth-public-subnet-0
    "subnet-0bc4ca546fdf88311", # tst-hth-public-subnet-1
    "subnet-0ed43f2e7f53b982c"  # tst-hth-public-subnet-2
  ] 
}
