terraform {
  backend "s3" {
    bucket = "payment-gateway-4567" # Manuualy created 
    key    = "terraform.tfstate"
    region = "ca-central-1"
  }
}