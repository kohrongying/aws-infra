locals {
  env_vars     = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${path_relative_from_include()}//modules/basic/iam-user"
}

dependency "ddb_event_logs" {
  config_path = "../ddb/event-logs"
  mock_outputs = {
    arn = "arn:aws:dynamodb:us-west-2:123456789012:table/GameScores/index/TopScoreDateTimeIndex"
  }
}

dependency "ddb_events" {
  config_path = "../ddb/events"
  mock_outputs = {
    arn = "arn:aws:dynamodb:us-west-2:123456789012:table/GameScores/index/TopScoreDateTimeIndex"
  }
}

dependency "ddb_users" {
  config_path = "../ddb/users"
  mock_outputs = {
    arn = "arn:aws:dynamodb:us-west-2:123456789012:table/GameScores/index/TopScoreDateTimeIndex"
  }
}

inputs = {
  name = "${local.project_vars.locals.name}-${local.env_vars.locals.name}-ddb"
  policy_statement = [
    {
      Action = [
        "dynamodb:GetItem",
        "dynamodb:BatchGetItem",
        "dynamodb:Query",
        "dynamodb:PutItem",
        "dynamodb:UpdateItem",
        "dynamodb:DeleteItem",
        "dynamodb:BatchWriteItem",
        "dynamodb:Scan"
      ]
      Effect = "Allow"
      Resource = [
        dependency.ddb_event_logs.outputs.arn,
        dependency.ddb_events.outputs.arn,
        dependency.ddb_users.outputs.arn,
      ]
    },
  ]
}