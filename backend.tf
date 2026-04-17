terraform {
  backend "s3" {
    bucket       = "wwwihbjyhteu"
    key          = "week10/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # Local lockfile instead of DynamoDB
  }
}