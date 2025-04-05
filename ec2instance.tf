terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
      source = "hashicorp/ec2-instance"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}

resource "ec2-instance" "test" {

    ami ="ami-0c02fb55956c7d316"
    instance_type ="t2.micro"
}