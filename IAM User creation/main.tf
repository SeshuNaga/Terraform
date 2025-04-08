terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
     
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "example_user" {
  name = "nagaseshu"
  tags = {
    "CreatedBy" = "Terraform"
    "Team"      = "DevOps"
  }
}

resource "aws_iam_access_key" "example_user_key" {
  user = aws_iam_user.example_user.name
}

resource "aws_iam_user_policy_attachment" "ec2_readonly" {
  user       = aws_iam_user.example_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"
}

output "iam_access_key" {
  value     = aws_iam_access_key.example_user_key.id
  sensitive = true
}

output "iam_secret_key" {
  value     = aws_iam_access_key.example_user_key.secret
  sensitive = true
}

