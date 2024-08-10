terraform {
        required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "~> 4.16"
}
}
required_version = ">= 1.2.0"
}

provider "aws" {
        region = "us-east-1"

}

resource "aws_instance" "my_instance" {
        ami = "ami-053b0d53c279acc90"
        instance_type = "t2.micro"
        tags = {
                Name = "Bucket-Instance"
}
}

resource "aws_s3_bucket" "my_s3_bucket" {
        bucket = "terraform-bucket-12345"
        tags = {
                Name = "Bucket-Instance"
                Environment = "Dev"
}
}
resource "aws_dynamodb_table" "my_dynamo_table" {
         name = "dynamo_table"
         billing_mode = "PAY_PER_REQUEST"
         hash_key = "LockID"
         attribute {
         name = "LockID"
         type = "S"
         }
}
output "ec2_public_ip" {
        value = aws_instance.my_instance.public_ip
}
