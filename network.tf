module "network" {

  source                = "D:/Aisha/iti/Course30_Terraform/day2/network"
  vpc_cidr              = var.vpc_cidr
  private_subnet_cidr   = var.private_subnet_cidr
  private_subnet_cidr_2 = var.private_subnet_cidr_2
  public_subnet_cidr    = var.public_subnet_cidr
  region_name           = var.region_name

}
