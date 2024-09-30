output "ledger_name" {
  description = "The name of the QLDB ledger."
  value       = aws_qldb_ledger.my_ledger.name
}

output "qldb_log_group_name" {
  description = "The name of the CloudWatch log group for QLDB auditing."
  value       = aws_cloudwatch_log_group.qldb_log_group.name
}

output "cloudtrail_arn" {
  description = "The ARN of the CloudTrail trail."
  value       = aws_cloudtrail.qldb_audit_trail.arn
}

output "cloudtrail_s3_bucket_name" {
  description = "The S3 bucket for storing CloudTrail logs."
  value       = aws_s3_bucket.qldb_audit_logs.bucket
}

output "cloudwatch_log_group_name" {
  description = "The CloudWatch log group name."
  value       = aws_cloudwatch_log_group.qldb_log_group.name
}
