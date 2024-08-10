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
        instances = ("Raj":"ami-08c40ec9ead489470","Vidit":"ami-08c40ec9ead489470","Rajvanshi":"ami-08c40ec9ead489470","Akhil":"ami-0b0dcb5067f052a63","Nanu":"ami-0b0dcb5067f052a63")
}
resource "aws_instance" "my_instance" {
        for_each = local.instances
        ami = each.value
        instance_type = "t2.micro"
        tags = {
                Name = each.key
  }
}