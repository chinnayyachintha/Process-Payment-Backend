# Output the DynamoDB Table name
output "dynamodb_table_name" {
  value       = aws_dynamodb_table.my_dynamodb_table.name
  description = "The name of the DynamoDB table"
}

# Output the CloudTrail name
output "cloudtrail_name" {
  value       = aws_cloudtrail.dynamodb_audit_trail.name
  description = "The name of the CloudTrail for DynamoDB audit"
}

# Output the CloudWatch Log Group name
output "cloudwatch_log_group_name" {
  value       = aws_cloudwatch_log_group.dynamodb_log_group.name
  description = "The name of the CloudWatch log group for DynamoDB"
}