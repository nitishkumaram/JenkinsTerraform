variable "aws_region" {
  description = "Region"
  type        = string
}

variable "accesskey" {
  description = "access_key for the AWS"
  type        = string
}

variable "secretkey" {
  description = "secret_key for the AWS"
  type        = string
}

variable "keyName" {
  description = "keyName for the AWS"
  type        = string
}

variable "id_rsa_pub" {
  description = "id_rsa_pub for the AWS"
  type        = string
}

variable "ami" {
  description = "AMI ID of the amazon EC2 instance"
  type        = string
}

variable "instancetype" {
  description = "Type of the instance"
  type        = string
}

variable "EC2_Name" {
  description = "EC2_Name for the AWS"
  type        = string
}

variable "securitygroup" {
  description = "securitygroup for the VPC"
  type        = string
}

variable "securitygroup_tags" {
  description = "securitygroup_tags for the VPC"
  type        = string
}
