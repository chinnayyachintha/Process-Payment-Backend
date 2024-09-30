variable "aws_region" {
  type        = string
  description = "The AWS region to deploy resources in"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the subnets"
  type        = string
}

variable "ledger_name" {
  description = "Name of the QLDB ledger"
  type        = string
}

variable "permissions_mode" {
  description = "The permissions mode for the QLDB ledger. Must be either ALLOW_ALL or STANDARD."
  type        = string
}

variable "cloudtrail_s3_bucket_name" {
  description = "The S3 bucket name to store CloudTrail logs."
  type        = string
}

variable "qldb_log_group_name" {
  description = "Name of the CloudWatch Log Group for QLDB audit logs"
  type        = string
}
