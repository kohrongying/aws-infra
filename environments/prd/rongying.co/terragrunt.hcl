locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "${path_relative_from_include()}//modules/basic/route53"
}

inputs = {
  domain_name = "rongying.co"
  records     = [
    {
      name    = "gatsby-newspaper.rongying.co"
      type    = "CNAME"
      ttl     = "3600"
      records = ["gatsby-minimal-blog-starter.netlify.app"]
    },
    {
      name    = "www.rongying.co"
      type    = "CNAME"
      ttl     = "3600"
      records = ["rongying.netlify.app"]
    },
    {
      name    = "blog.rongying.co"
      type    = "CNAME"
      ttl     = "3600"
      records = ["blog-rongying.netlify.app"]
    },
    {
      name    = "eleventy.rongying.co"
      type    = "CNAME"
      ttl     = "3600"
      records = ["eleventy-blog-starter.netlify.app"]
    },
    {
      name    = "todayilearn.rongying.co"
      type    = "CNAME"
      ttl     = "3600"
      records = ["todayrylearn.netlify.app"]
    },
    {
      name    = "rongying.co"
      type    = "A"
      ttl     = "3600"
      records = ["75.2.60.5"]
    }
  ]
}