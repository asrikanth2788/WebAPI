# WebAPI

This repo is to do a demo together with packer, ansible and terraform with AWS

## Overview

This project creates an AWS EC2 Instance that hosts a python web applications on the port 8080.
Once the EC2 is created, browse public IP address of the instance with the port 8080, you will get a resonse from the web application, which is "Hello World"

1. An image with ubuntu base OS will be built
2. WebApp will be created as a systemd service. so that it starts automatically when the machine boots up
3. Ansible is used to install/configure the WebApp service.
4. Terraform will create an EC2 instance (with the image built by packer) along with few network components.

## Assumptions

1. aws_access_key and aws_secret_access_key values are added to the file ~/.aws/credentials
2. export aws_access_key and aws_secret_access_key values. (packer uses env values)
3. packer and terraform installed
4. sample public key is located at this location ~/.ssh/id_rsa_ami.pub. This will be used to create a keypair. You may then login to the created EC2 instances with corresponding private key.
5. you own a source image "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server*". If not, then you will be prompted to subscribe to that image from aws-marketplace

## Usage:

### checkout this git repo
```
1. git clone https://github.com/asrikanth2788/WebAPI.git
2. cd WebAPI
```
### Run packer command to build AMI with 
`3. packer build -var 'owner=your-AWS-accountID-goes-here' packer/template.json`

### create EC2 server along with network components
`4. terraform init; terraform apply -var=account=your-AWS-accountID-goes-here`

# Tests
```
Terraform command will output public IP of the created EC2 instance and a sample curl command to invoke the webapp. You may either use curl or browse the printed url.  

FYI - Terraform will also prints VPC ID, subnetIDs and Security groups that were created.  You may choose to ignore these outputs.
```

# Destroy

## Run the below command to destroy infrastructure created.
`terraform destroy -var=account=your-AWS-accountID-goes-here -auto-approve`



# Improvements. 

### below functionalities can be added in future

1. Add reverse proxy to application.
2. Add Auto scaling group


