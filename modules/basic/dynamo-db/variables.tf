variable "environment" {
  type = object({
    name = string
  })
}

variable "project" {
  type = object({
    name = string
  })
}

variable "name" {}

variable "billing_mode" {}

variable "read_capacity" {}

variable "write_capacity" {}

variable "hash_key" {}

variable "range_key" {}

variable "attributes" {
  type = list(object({
    name = string
    type = string
  }))
}

variable "tags" {
  type = object({})
  default = {}
}