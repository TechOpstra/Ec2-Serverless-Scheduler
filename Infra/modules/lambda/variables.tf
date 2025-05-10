variable "function_name" {
  description = "The name of the Lambda function."
  type        = string
}

variable "handler" {
  description = "The function entrypoint in your code."
  type        = string
}

variable "runtime" {
  description = "The runtime environment for the Lambda function."
  type        = string
}

variable "filename" {
  description = "The local filename of the Lambda function code."
  type        = string
}

variable "environment_vars" {
  description = "Environment variables for the Lambda function."
  type        = map(string)
}
