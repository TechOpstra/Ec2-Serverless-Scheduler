
module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}

module "ec2_instance" {
  source          = "./modules/ec2"
  instance_name   = var.instance_name
  instance_type   = var.instance_type
  ami             = var.ami
  subnet_id       = module.vpc.public_subnet_id
  vpc_id          = module.vpc.vpc_id
}

module "start_lambda" {
  source          = "./modules/lambda"
  function_name   = "start-ec2-instance"
  handler         = "start-ec2-instance.lambda_handler"
  runtime         = "python3.9"
  filename        = "./function/start-ec2-instance.zip"
  environment_vars = {
    INSTANCE_ID = module.ec2_instance.instance_id
  }
}

module "stop_lambda" {
  source          = "./modules/lambda"
  function_name   = "stop-ec2-instance"
  handler         = "stop-ec2-instance.lambda_handler"
  runtime         = "python3.9"
  filename        = "./function/stop-ec2-instance.zip"
  environment_vars = {
    INSTANCE_ID = module.ec2_instance.instance_id
  }
}

module "start_event" {
  source          = "./modules/cloudwatch"
  event_name      = "start-ec2-instance-event"
  schedule_expression = "cron(00 8 ? JAN-DEC MON-FRI 2025)" 
  lambda_arn      = module.start_lambda.lambda_arn
}

module "stop_event" {
  source          = "./modules/cloudwatch"
  event_name      = "stop-ec2-instance-event"
  schedule_expression = "cron(00 17 ? JAN-DEC MON-FRI 2025)" 
  lambda_arn      = module.stop_lambda.lambda_arn
}
