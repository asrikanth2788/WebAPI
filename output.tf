output "vpc_id" {
  description = "The VPCs AWS resource ID"
  value = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value = aws_vpc.vpc.cidr_block
}

output "subnet_cidr_blocks" {
  description = "The CIDR blocks of all subnets that were created in a map indexed by a unique string identifier based on the subnet type and availability zone"
  value = {
     for name, cidr in var.subnets:
     name => aws_subnet.subnet[name].cidr_block
  }
}

output "subnet_ids" {
  description = "The AWS resource IDs of all subnets that were created in a map indexed by a unique string identifier based on the subnet type and availability zone"
  value = {
       for name, cidr in var.subnets:
       name => aws_subnet.subnet[name].id
  }
}

output "security_group_ids" {
  description = "The AWS resource IDs of all security groups that were created indexed by their supplied map index"
  value = {
    for name in var.security_groups:
    name => aws_security_group.securitygroup[name].id
  }
}


output "publicIP" {
    value = aws_instance.ec2[0].public_ip
}

output "curl" {
    value = "curl http://${aws_instance.ec2[0].public_ip}:8080"
}

output "sample-ec2-login-command" {
  value = "ssh -i <location-of-your-privatekey> ubuntu@<publicip-of-ec2-instance>"
}