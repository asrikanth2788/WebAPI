resource "aws_key_pair" "sshkey" {
  key_name   = "${var.stack}-key"
  public_key = file(var.ssh_key)
}

resource "aws_instance" "ec2" {
  count = var.instances
  ami           = data.aws_ami.packer_image.id
  instance_type = var.vm_size
  subnet_id = aws_subnet.subnet["app"].id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.securitygroup["app"].id]
  key_name = aws_key_pair.sshkey.key_name
  user_data = file(var.userdata)
  tags = {
    Name = "${var.stack}-server"
  }
}


data "aws_ami" "packer_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["pythonapp-ami-packer"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.account]
}