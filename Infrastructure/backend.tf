terraform {
  backend "s3" {
    bucket         = "mystate"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my_terraform_state"
  }
}