locals {
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
  config_vars  = read_terragrunt_config(find_in_parent_folders("config.hcl"))
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${path_relative_from_include()}//modules/basic/dynamo-db"
}

inputs = {
  name         = "ddb-${local.project_vars.locals.name}-${local.env_vars.locals.name}-event-logs"
  billing_mode = local.config_vars.locals.billing_mode
  hash_key     = "EventId"
  range_key    = "Id"
  attributes = [
    { name = "EventId", type = "S" },
    { name = "Id", type = "S" }
  ]
}