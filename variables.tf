variable "aws_region" {
  description = "Region"
  type        = string
  default     = "ap-south-1"
}

variable "ami" {
  description = "AMI ID of the amazon EC2 instance"
  type        = string
  # default     = "ami-06f621d90fa29f6d0" configured it in terraform variable
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