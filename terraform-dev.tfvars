# Specify the AWS region
aws_region = "ca-central-1"

# CIDR block for the VPC
vpc_cidr_block = "10.0.0.0/16"

# CIDR block for the public subnet
public_subnet_cidr = "10.0.1.0/24"

# CIDR block for the private subnet
private_subnet_cidr = "10.0.2.0/24"

# Availability zone for the subnets
availability_zone = "ca-central-1a"

# Name of the QLDB ledger
ledger_name = "my-qlbd-ledger"

# Permissions mode for QLDB (ALLOW_ALL or STANDARD)
permissions_mode = "ALLOW_ALL"

# Name of the CloudWatch Log Group for QLDB audit logs
qldb_log_group_name = "qldb-audit-logs"

# S3 bucket to store CloudTrail logs for QLDB
cloudtrail_s3_bucket_name = "my-qldb-audit-logs"

# Tag values for AWS resources
tags = {
  Environment = "Development"
  Project     = "Payment Gateway"
  Owner       = "Anudeep"
}
