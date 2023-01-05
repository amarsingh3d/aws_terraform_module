provider "aws" {
  region = "us-east-1"

}

data "aws_vpc" "this" {
  default = true

}

################################################################################
# Module Security Group
################################################################################
module "sg1" {
  source         = "../modules/SG_Groups"
  sg_name        = var.sg1_name
  sg_description = var.sg1_description
  aws_vpc        = data.aws_vpc.this.id
  tags           = var.tags
  types          = var.type
  ports          = var.port
  protocols      = var.protocol


}
