# Call VPC module
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block    = "var.vpc_cidr_block "
  public_subnet_cidr = "var.public_subnet_cidr"
  private_subnet_cidr = "var.private_subnet_cidr"
  availability_zone  = "var.availability_zone"
}

# Call QLDB module
module "qldb" {
  source = "./modules/qldb"

  ledger_name        = "var.ledger_name"
  qldb_log_group_name = "var.qldb_log_group_name"
}

