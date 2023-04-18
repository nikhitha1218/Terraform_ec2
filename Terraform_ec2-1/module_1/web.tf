provider "aws" {
  region = var.my_region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  count = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.ssh_keyname
  security_groups = [
    "launch-wizard-1"
  ]

  tags = {
    Name = "Web-${count.index}"
  }
}