output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet."
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "The ID of the private subnet."
  value       = module.vpc.private_subnet_id
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance."
  value       = module.ec2_instance.instance_id
}

output "start_lambda_arn" {
  description = "The ARN of the start Lambda function."
  value       = module.start_lambda.lambda_arn
}

output "stop_lambda_arn" {
  description = "The ARN of the stop Lambda function."
  value       = module.stop_lambda.lambda_arn
}
