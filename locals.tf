locals {
  owners      = var.business_divsion
  environment = var.environment
  name        = "${var.business_divsion}-${var.environment}-${random_pet.randy.id}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
  serviceaccount_name = "irsa-demo-sa"
}

resource "random_pet" "randy" {
  length = 1
}
