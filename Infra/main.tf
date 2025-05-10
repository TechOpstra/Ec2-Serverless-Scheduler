
module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}

module "ec2_instance" {
  source          = "./modules/ec2"
  instance_name   = "my-ec2-instance"
  instance_type   = "t2.micro"
  ami             = "ami-0abcdef1234567890" # Replace with your desired AMI ID
  key_name        = "my-key-pair" # Replace with your key pair name
  subnet_id       = module.vpc.public_subnet_id
  vpc_id          = module.vpc.vpc_id
}

module "start_lambda" {
  source          = "./modules/lambda"
  function_name   = "start-ec2-instance"
  handler         = "start-ec2-instance.lambda_handler"
  runtime         = "python3.8"
  filename        = "start-ec2-instance.zip"
  environment_vars = {
    INSTANCE_ID = module.ec2_instance.instance_id
  }
}

module "stop_lambda" {
  source          = "./modules/lambda"
  function_name   = "stop-ec2-instance"
  handler         = "stop-ec2-instance.lambda_handler"
  runtime         = "python3.8"
  filename        = "stop-ec2-instance.zip"
  environment_vars = {
    INSTANCE_ID = module.ec2_instance.instance_id
  }
}

module "start_event" {
  source          = "./modules/cloudwatch"
  event_name      = "start-ec2-instance-event"
  schedule_expression = "cron(0 3 ? * MON-FRI *)" # 8:00 AM IST
  lambda_arn      = module.start_lambda.lambda_arn
}

module "stop_event" {
  source          = "./modules/cloudwatch"
  event_name      = "stop-ec2-instance-event"
  schedule_expression = "cron(30 11 ? * MON-FRI *)" # 5:00 PM IST
  lambda_arn      = module.stop_lambda.lambda_arn
}
