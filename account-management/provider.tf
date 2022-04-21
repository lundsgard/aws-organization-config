provider "aws" {
  # version = ">2.0"
  profile = "default"
  region  = "eu-west-1"
  assume_role {
    role_arn = "arn:aws:iam::yyyyyyyyyyyy:role/...-deploy-role"
  }
}