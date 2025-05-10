variable "event_name" {
  description = "The name of the CloudWatch event."
  type        = string
}

variable "schedule_expression" {
  description = "The schedule expression for the CloudWatch event."
  type        = string
}

variable "lambda_arn" {
  description = "The ARN of the Lambda function to trigger."
  type        = string
}
