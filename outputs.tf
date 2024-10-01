# Outputs from the VPC module
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = module.vpc.private_subnet_id
}

# Outputs from the DynamoDB Module
output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = module.dynamodb.dynamodb_table_name
}

output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = module.dynamodb.dynamodb_table_arn
}

output "cloudtrail_name" {
  description = "The name of the CloudTrail"
  value       = module.dynamodb.cloudtrail_name
}

output "cloudtrail_arn" {
  description = "The ARN of the CloudTrail"
  value       = module.dynamodb.cloudtrail_arn
}

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group for DynamoDB logging"
  value       = module.dynamodb.cloudwatch_log_group_name
}

output "cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group for DynamoDB logging"
  value       = module.dynamodb.cloudwatch_log_group_arn
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket for CloudTrail logs"
  value       = module.dynamodb.s3_bucket_name
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket for CloudTrail logs"
  value       = module.dynamodb.s3_bucket_arn
}