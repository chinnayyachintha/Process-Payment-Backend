# Fetch the current AWS account details
data "aws_caller_identity" "current" {}

resource "aws_dynamodb_table" "my_dynamodb_table" {
  name         = var.table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  # Define the hash key attribute
  attribute {
    name = var.hash_key
    type = "S"
  }

  # Define the range key dynamically if it exists
  dynamic "attribute" {
    for_each = var.range_key != null ? [var.range_key] : []
    content {
      name = var.range_key
      type = "S"
    }
  }

  # Define the `create_at` attribute
  attribute {
    name = "create_at"
    type = "S"
  }

  # Global Secondary Index (GSI) to index the `create_at` attribute
  global_secondary_index {
    name               = "CreateAtIndex"
    hash_key           = "create_at"
    projection_type    = "ALL"
    write_capacity     = 1
    read_capacity      = 1
  }

  point_in_time_recovery {
    enabled = var.point_in_time_recovery
  }

  server_side_encryption {
    enabled = var.server_side_encryption
  }

  tags = merge(
    {
      Name = var.table_name
    },
    var.tags
  )
}

# CloudWatch Log Group for DynamoDB logging
resource "aws_cloudwatch_log_group" "dynamodb_log_group" {
  name = var.dynamodb_log_group_name

  tags = merge(
    {
      Name = var.dynamodb_log_group_name
    },
    var.tags
  )
}


# S3 Bucket to store CloudTrail logs
resource "aws_s3_bucket" "dynamodb_audit_logs" {
  bucket = "${var.table_name}-audit-logs"
}

# CloudTrail for auditing DynamoDB events
resource "aws_cloudtrail" "dynamodb_audit_trail" {
  name                          = "${var.table_name}-trail"
  s3_bucket_name                = aws_s3_bucket.dynamodb_audit_logs.bucket
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  cloud_watch_logs_group_arn    = aws_cloudwatch_log_group.dynamodb_log_group.arn
  cloud_watch_logs_role_arn     = aws_iam_role.cloudtrail_role.arn
  event_selector {
    read_write_type           = "All"
    include_management_events = true
    data_resource {
      type   = "AWS::DynamoDB::Table"
      values = ["arn:aws:dynamodb:${var.aws_region}:${data.aws_caller_identity.current.account_id}:table/${aws_dynamodb_table.my_dynamodb_table.name}"]
    }
  }
}


# IAM Role for CloudTrail to write to CloudWatch Logs
resource "aws_iam_role" "cloudtrail_role" {
  name = "${var.table_name}-cloudtrail-role"

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
