provider "aws" {
  alias = "us-east-1"  
  region = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"  
  region = "us-east-2"
}


resource "aws_instance" "web1" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  provider = aws.us-east-1
  tags = {
    Name = "east-1"
  }
}



resource "aws_instance" "web2" {
  ami           = "ami-024e6efaf93d85776"
  instance_type = "t2.micro"
  provider = aws.us-east-2
  tags = {
    Name = "east-2"
  }
}