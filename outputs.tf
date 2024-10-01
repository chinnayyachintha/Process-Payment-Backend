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
  description = "The name of the DynamoDB table."
  value       = aws_dynamodb_table.my_dynamodb_table.name
}

output "cloudtrail_name" {
  description = "The name of the CloudTrail used for DynamoDB events."
  value       = aws_cloudtrail.dynamodb_audit_trail.name
}

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch log group for DynamoDB logs."
  value       = aws_cloudwatch_log_group.dynamodb_log_group.name
}








