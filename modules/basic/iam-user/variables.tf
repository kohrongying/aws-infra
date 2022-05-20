variable "name" {}

variable "policy_statement" {
  type = list(object({
    Action   = list(string)
    Effect   = string
    Resource = list(string)
  }))
}