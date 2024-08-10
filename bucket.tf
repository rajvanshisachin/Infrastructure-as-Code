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
        ami = "ami-08c40ec9ead489470"
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
output "ec2_public_ip" {
        value = aws_instance.my_instance.public_ip
}
