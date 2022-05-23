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

variable "read_capacity" {
  type = number
  default = 0
}

variable "write_capacity" {
  type = number
  default = 0
}

variable "hash_key" {}

variable "range_key" {}

variable "attributes" {
  type = list(object({
    name = string
    type = string
  }))
}

variable "tags" {
  type    = object({})
  default = {}
}