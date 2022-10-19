terraform {
  backend "s3" {
    bucket         = "terraform2-abdelrahman-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform2"
  }
}
