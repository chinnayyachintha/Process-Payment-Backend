output "vpc_id" {
  value = module.vpc.vpc_id
}

output "qldb_ledger_name" {
  value = module.qldb.qldb_ledger_name
}
