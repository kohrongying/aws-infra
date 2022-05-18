locals {
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${path_relative_from_include}/modules/basic/dynamo-db"
}

inputs = {
  name           = "db-${local.project_vars.locals.name}-${local.env_vars.locals.name}-events"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "Id"
  range_key      = "EventId"
  attributes = [
    { name = "Id", type = "S" },
    { name = "EventId", type = "S" },
    { name = "EventTimestamp", type = "S" },
    { name = "CreatedTimestamp", type = "S" }
  ]
}