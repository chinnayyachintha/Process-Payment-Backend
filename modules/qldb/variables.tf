variable "ledger_name" {
  description = "Name of the QLDB ledger"
  type        = string
}

variable "permissions_mode" {
  description = "The permissions mode for the QLDB ledger. Must be either ALLOW_ALL or STANDARD."
  type        = string
}

variable "qldb_log_group_name" {
  description = "Name of the CloudWatch Log Group for QLDB audit logs"
  type        = string
}

variable "cloudtrail_s3_bucket_name" {
  description = "The S3 bucket name to store CloudTrail logs."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
}
