terraform {
  backend "s3" {
    bucket         = "terraform-s3-bucket-26.04.2024"
    dynamodb_table = "terraform_dynamodb_table"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
  }
}

