provider "aws" {
  region = var.region

}
################################################################################
# Module AWS VPC
################################################################################
module "prod_vpc" {
  region                       = var.region
  source                       = "../modules/vpc"
  vpc_name                     = var.prod_vpc_name
  cidr_block                   = var.cidr_block
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr

}