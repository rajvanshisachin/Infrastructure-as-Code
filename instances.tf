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
instances = ("Raj":"ami-08c40ec9ead489470","Vidit":"ami-08c40ec9ead489470","Rajvanshi":"0b0dcb5067f052a63","Gupta":"0b0dcb5067f052a63","Akhil":"0b0dcb5067f052a63")
}
resource "aws_instance" "my_instance" {
        for_each = local_instances 
        ami = each.key
        instance_type = "t2.micro"
        tags = {
                Name = each.value
}
}

output "ec2_public_ip" {
        value = aws_instance.my_instance[*].public_ip
}
