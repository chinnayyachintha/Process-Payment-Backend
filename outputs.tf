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

# Outputs from the QLDB module
output "qldb_ledger_name" {
  description = "The name of the QLDB ledger."
  value       = module.qldb.ledger_name # Ensure this matches the output defined in the QLDB module
}

output "qldb_log_group_name" {
  description = "The name of the CloudWatch log group for QLDB auditing."
  value       = module.qldb.qldb_log_group_name # Ensure this matches the output defined in the QLDB module
}

output "cloudtrail_arn" {
  description = "The ARN of the CloudTrail trail."
  value       = module.qldb.cloudtrail_arn # Ensure this matches the output defined in the QLDB module
}

output "cloudtrail_s3_bucket_name" {
  description = "The S3 bucket for storing CloudTrail logs."
  value       = module.qldb.cloudtrail_s3_bucket_name # Ensure this matches the output defined in the QLDB module
}

output "cloudwatch_log_group_name" {
  description = "The CloudWatch log group name."
  value       = module.qldb.cloudwatch_log_group_name # Ensure this matches the output defined in the QLDB module
}
