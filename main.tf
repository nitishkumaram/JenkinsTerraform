# EC2 Instance to host Jenkins
resource "aws_instance" "JenkinsEc2" {
  ami           = var.ami
  instance_type = var.instancetype
  key_name      = var.instance_keypair
  # Commented below as we are using null resorce to install Jenkins.sh file
  # user_data     = file("${path.module}/jenkins.sh")
   vpc_security_group_ids = [aws_security_group.vpc_web.id]
  tags = {
    "Name" = "JenkinsEC2"
  }
}

# Create Security Group - Web Traffic
resource "aws_security_group" "vpc_web" {
  name        = "vpc-web"
  description = "VPC SG WEB"
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Port 8080"
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Port 443"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc-web"
  }
}

# Create null resorce to insatll the Jenkins shell script through provisioner

resource "null_resource" "myprovisioner" {
  
  # ssh into the EC2 instance
  connection {
    type = "ssh"
    user = "ec2-user"
    host = aws_instance.JenkinsEc2.public_ip
    private_key = file("${path.module}/private-key/terraform-key.pem")
  }

  # copy the jenkins.sh file to EC2 instance using file provisioner
  provisioner "file" {
    source = "jenkins.sh"
    destination = "/tmp/jenkins.sh"
  }

  # Set permission and run the jenkins.sh file using remote provisioner
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/jenkins.sh",
      "sh /tmp/jenkins.sh"
    ]
  }

  # Lifecycle dependency
  depends_on = [
    aws_instance.JenkinsEc2
  ]
}
