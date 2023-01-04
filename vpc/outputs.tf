output "vpc_id" {
  value = module.prod_vpc.vpcid

}

output "public_subnet_az1_id" {
  value = module.prod_vpc.public_subnet_az1_id

}

output "public_subnet_az2_id" {
  value = module.prod_vpc.public_subnet_az2_id

}

output "private_app_subnet_az1_id" {
  value = module.prod_vpc.private_app_subnet_az1_id

}


output "private_app_subnet_az2_id" {
  value = module.prod_vpc.private_app_subnet_az2_id

}


output "private_data_subnet_az1_id" {
  value = module.prod_vpc.private_data_subnet_az1_id

}

output "private_data_subnet_az2_id" {
  value = module.prod_vpc.private_data_subnet_az2_id

}