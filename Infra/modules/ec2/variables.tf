variable "instance_name" {
  description = "The name of the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of the EC2 instance."
  type        = string
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the EC2 instance in."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the EC2 instance will be launched."
  type        = string
}