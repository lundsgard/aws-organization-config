variable "region" {
  type    = string
  default = "eu-west-1"
}

variable "security_account_id" {
  type = string
}

variable "config_delivery_channel_s3_bucket" {
  type = string
}

variable "organizational_units" {
  description = "OUs to deploy Config recorders"
  type        = list(string)
  default = [
    "ou-xxxx-yyyyyyyy", # OU #1
    "ou-yyyy-zzzzzzzz", # OU #2
  ]
}