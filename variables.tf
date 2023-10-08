variable "aws_region" {
  description = "Region"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID of the amazon EC2 instance"
  type        = string
  default     = "ami-067d1e60475437da2" #configured it in terraform variable
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
  default = "AKIARD6HXBYEDQ4TI3LN"
}

variable "secretkey" {
  description = "secret_key for the AWS"
  type        = string
}

variable "id_rsa_pub" {
  description = "id_rsa_pub for the AWS"
  type        = string
}
