# Sg1 name variable
variable "sg1_name" {
  default = ""
}
# Sg1 description
variable "sg1_description" {
  default = ""
}
# VPC variable
variable "aws_vpc" {
  default = ""
}
# SG common Tag variable
variable "sg_tags" {
  default = ""
}
# Sg1 port variable
variable "sg1_port" {
  default = ""
}
# CIDR block variable
variable "cidr_blocks" {
  default = ""
}
# SG rule type variable
variable "type" {
  default = "ingress"
}
# SG rule protocol type variable
variable "protocol" {
  default = "tcp"

}