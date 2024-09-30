# QLDB Ledger
resource "aws_qldb_ledger" "my_ledger" {
  name              = var.ledger_name
  permissions_mode  = var.permissions_mode

  tags = merge(
    {
      Name = var.ledger_name
    },
    var.tags
  )

}

# CloudWatch Log Group for QLDB-related logging
resource "aws_cloudwatch_log_group" "qldb_log_group" {
  name = var.qldb_log_group_name

  tags = merge(
    {
      Name = var.qldb_log_group_name
    },
    var.tags
  )
  
}

# CloudTrail for auditing QLDB events
resource "aws_cloudtrail" "qldb_audit_trail" {
  name                          = "${var.ledger_name}-trail"
  s3_bucket_name                = aws_s3_bucket.qldb_audit_logs.bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  cloud_watch_logs_group_arn    = aws_cloudwatch_log_group.qldb_log_group.arn
  cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail_role.arn
}

# S3 Bucket to store CloudTrail logs
resource "aws_s3_bucket" "qldb_audit_logs" {
  bucket = "${var.ledger_name}-audit-logs"
}

# IAM Role for CloudTrail to write to CloudWatch Logs
resource "aws_iam_role" "cloudtrail_role" {
  name = "${var.ledger_name}-cloudtrail-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy for CloudTrail to publish logs to CloudWatch
resource "aws_iam_role_policy_attachment" "cloudtrail_policy_attachment" {
  role       = aws_iam_role.cloudtrail_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCloudTrailLoggingPolicy"
}
