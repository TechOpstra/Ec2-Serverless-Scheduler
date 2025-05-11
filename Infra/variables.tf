variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_name" {
  description = "The name of the EC2 instance."
  type        = string
  default     = "my-ec2-instance"
}

variable "instance_type" {
  description = "The type of the EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "start_lambda_filename" {
  description = "The local filename of the start Lambda function code."
  type        = string
  default     = "./function/start-ec2-instance.zip"
}

variable "stop_lambda_filename" {
  description = "The local filename of the stop Lambda function code."
  type        = string
  default     = "./function/stop-ec2-instance.zip"
}
