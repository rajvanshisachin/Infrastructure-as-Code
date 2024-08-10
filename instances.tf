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
locals {
instance_names = toset(["Raj","Vidit","Rajvanshi","Gupta","Akhil"])
}
resource "aws_instance" "my_instance" {
       #count = 5
        for_each = local_instances 
        ami = "ami-08c40ec9ead489470"
        instance_type = "t2.micro"
        tags = {
               #Name = "Batches"
                Name = each.key
}
}

output "ec2_public_ip" {
        value = aws_instance.my_instance[*].public_ip
}
