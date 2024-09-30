resource "aws_qldb_ledger" "my_ledger" {
  name       = var.ledger_name
  permissions_mode = "ALLOW_ALL"
}

# CloudWatch Log Group for Auditing
resource "aws_cloudwatch_log_group" "qldb_log_group" {
  name = var.qldb_log_group_name
}

resource "aws_qldb_ledger_audit" "my_audit" {
  ledger_name = aws_qldb_ledger.my_ledger.name
  log_group   = aws_cloudwatch_log_group.qldb_log_group.name
}
