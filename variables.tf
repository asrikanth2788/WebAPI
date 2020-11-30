variable "vpc_name" {
  description = "The name of the new VPC"
  type = string
  default = "webapp-vpc"
}

variable "vpc_cidr_block" {
  description = "The CIDR block of the new VPC"
  type = string
  default = "10.17.64.0/21"
}

variable "subnets" {
  description = "A map of subnet name(s) and their CIDR blocks that should be added to the VPC"
  type = map(string)
  default = {
    "app" = "10.17.65.0/25"
  }
}

variable "security_groups" {
  description = "An optional set of security groups to be created"
  type = set(string)
  default = ["app"]
}

variable "internet_gateway" {
  description = "A boolean flag which if true will trigger the creation of an Internet Gateway resource in the VPC"
  type = bool
  default = true
}

variable "tags" {
  description = "An optional map of tags that will be added to all created AWS resources"
  type = map(string)
  default = {
    "cost_center" = "1234",
    "project_id" = "recruitment"
  }
}

variable "stack" {
    description = "Name of the Stack"
    default = "webapp"
}

variable "ports" {
    description = "port to add to security group"
    type = set(string)
    default = ["22","8080"]
}


variable "sg_source_cidr" {
    default = ["0.0.0.0/0"]
    description = "source cidr for sg"
    type = list
}

variable "ssh_key" {
    default = "~/.ssh/id_rsa_ami.pub"
    description = "Path to the public key to be used for ssh access to the EC2"
}

variable "instances" {
     default = 1
     description = "No of instances"
}

variable "vm_size" {
    description = "Size of the VM"
    default = "t2.micro"
}

variable "account" {
  description = "AWS account owner ID"
  default = ""
}

variable "userdata" {
  description = "userdata script"
  default = "./userdata/userdata.txt"
}