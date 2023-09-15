provider "aws" {
  region = "us-east-1"
}


module "module_ec2" {
    source = "./module_ec2"
    ami_value = "ami-053b0d53c279acc90"
    instance_type_value = "t2.micro"
} 