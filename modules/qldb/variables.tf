variable "ledger_name" {
  description = "Name of the QLDB ledger"
  type        = string
}

variable "qldb_log_group_name" {
  description = "Name of the CloudWatch Log Group for QLDB audit logs"
  type        = string
}
