resource "aws_instance" "name" {
  ami="ami-053b0d53c279acc90"
  instance_type ="t2.micro"
}

resource "aws_s3_bucket" "s3-bucket" {
  bucket = "mybucket-hima"
}