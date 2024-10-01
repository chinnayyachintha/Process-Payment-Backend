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
  value       = module.dynamodb.dynamodb_table_name
  description = "The name of the DynamoDB table"
}

# Output the CloudTrail name from the DynamoDB module
output "cloudtrail_name" {
  value       = module.dynamodb.cloudtrail_name
  description = "The name of the CloudTrail for DynamoDB audit"
}

# Output the CloudWatch Log Group name from the DynamoDB module
output "cloudwatch_log_group_name" {
  value       = module.dynamodb.cloudwatch_log_group_name
  description = "The name of the CloudWatch log group for DynamoDB"
}