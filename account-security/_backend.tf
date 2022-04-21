terraform {
  backend "s3" {
    bucket         = "..."
    encrypt        = true
    key            = "....tfstate"
    region         = "eu-west-1"
    dynamodb_table = "...-terraform-lock"
    role_arn       = "arn:aws:iam::yyyyyyyyyyyy:role/...-terraform-role"
  }
}