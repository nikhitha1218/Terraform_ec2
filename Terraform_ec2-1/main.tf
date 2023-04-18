resource "aws_instance" "my_instance" {
  ami           = "ami-02eb7a4783e7e9317"  # # Ubuntu 20.04 LTS AMI for ap-south-1
  instance_type = "t2.micro"
  key_name      = "keypair1"
   security_groups = [
    "launch-wizard-1"
  ]

  tags = {
    Name = "EC2 instance"
  }

# Define the user data to install Docker
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y docker.io
    usermod -aG docker ubuntu
    EOF
}