variable "aws_region" {
  description = "Region"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID of the amazon EC2 instance"
  type        = string
  default     = "ami-0b5eea76982371e91"
}

variable "instancetype" {
  description = "Type of the instance"
  type        = string
  default     = "t2.micro"
}

variable "instance_keypair" {
  description = "Key pair for the terraform"
  type        = string
  default     = "terraform-key"
}