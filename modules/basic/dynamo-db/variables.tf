variable "environment" {}

variable "project" {}

variable "name" {}

variable "billing_mode" {}

variable "read_capacity" {}

variable "write_capacity" {}

variable "hash_key" {}

variable "range_key" {}

variable "attributes" {
    type = map(string)
}
