variable "aws_region" {
  description = "Region"
  type        = string
  default     = "us-east-1"
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

variable "accesskey" {
  description = "access_key for the AWS"
  type        = string
}

variable "secretkey" {
  description = "secret_key for the AWS"
  type        = string
}