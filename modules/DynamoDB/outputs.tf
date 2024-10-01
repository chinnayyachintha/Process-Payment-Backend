output "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  value       = aws_dynamodb_table.my_dynamodb_table.name
}

output "dynamodb_table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = aws_dynamodb_table.my_dynamodb_table.arn
}

output "cloudtrail_name" {
  description = "The name of the CloudTrail"
  value       = aws_cloudtrail.dynamodb_audit_trail.name
}

output "cloudtrail_arn" {
  description = "The ARN of the CloudTrail"
  value       = aws_cloudtrail.dynamodb_audit_trail.arn
}

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch Log Group for DynamoDB logging"
  value       = aws_cloudwatch_log_group.dynamodb_log_group.name
}

output "cloudwatch_log_group_arn" {
  description = "The ARN of the CloudWatch Log Group for DynamoDB logging"
  value       = aws_cloudwatch_log_group.dynamodb_log_group.arn
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket for CloudTrail logs"
  value       = aws_s3_bucket.dynamodb_audit_logs.bucket
}

output "s3_bucket_arn" {
  description = "The ARN of the S3 bucket for CloudTrail logs"
  value       = aws_s3_bucket.dynamodb_audit_logs.arn
}
