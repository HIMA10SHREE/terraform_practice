terraform {
  backend "s3" {
    bucket = "mybucket-hima"
    key    = "hima/terraform.tfstate"
    region = "us-east-1"
  }
}