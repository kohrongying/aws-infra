variable "domain_name" {
  type = string
}

variable "records" {
  type = list(object({
    name    = string
    type    = string
    ttl     = string
    records = list(string)
  }))
}