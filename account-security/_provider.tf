provider "aws" {
  # version = ">2.0"
  profile = "default"
  region  = "eu-west-1"
  assume_role {
    role_arn = "arn:aws:iam::zzzzzzzzzzzz:role/...-deploy-role"
  }
}

provider "aws" {
  # version = ">2.0"
  alias  = "eu-west-1"
  region = "eu-west-1"
  assume_role {
    role_arn = "arn:aws:iam::zzzzzzzzzzzz:role/...-deploy-role"
  }
}

provider "aws" {
  # version = ">2.0"
  alias  = "us-east-1"
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:iam::zzzzzzzzzzzz:role/...-deploy-role"
  }
}