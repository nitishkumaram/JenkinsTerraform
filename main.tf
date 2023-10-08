# Create SSH key by using below command
# ssh-keygen -t rsa
# Enter file in which to save the key (/Users/nitishkumar/.ssh/id_rsa): ./id_rsa

resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

output "key_name" {
  value = aws_key_pair.key-tf.key_name
}

# EC2 Instance to host Jenkins
resource "aws_instance" "JenkinsEc2" {
  ami                    = var.ami
  instance_type          = var.instancetype
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = [aws_security_group.vpc_web.id]
  tags = {
    "Name" = "JenkinsEC2"
  }

  # User Data
  user_data = file("${path.module}/jenkins.sh")
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
