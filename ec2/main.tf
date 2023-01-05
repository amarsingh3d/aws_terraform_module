
data "aws_vpc" "this" {
  default = true

}
################################################################################
# Module AWS_Key_Pair
################################################################################
module "key_pair" {
  source   = "../modules/aws_key_pair"
  key_name = "Project1_key"
  pub_key  = var.project1_key

}


################################################################################
# Module AWS ELB Security Group
################################################################################
module "elb_web_sg" {
  source         = "../modules/SG_Groups"
  sg_name        = "elb_sg"
  sg_description = "sg for Web ELB"
  aws_vpc        = data.aws_vpc.this.id
  tags           = var.tags
  types          = "ingress"
  ports          = var.elb_sg_port
  protocols      = "tcp"


}

################################################################################
# Module AWS EC2 Security Group
################################################################################
module "ec2_web_sg" {
  source         = "../modules/SG_Groups"
  sg_name        = "web_sg"
  sg_description = "SG for Web servers"
  aws_vpc        = data.aws_vpc.this.id
  tags           = var.tags
  types          = "ingress"
  ports          = var.web_sg_port
  protocols      = "tcp"



}

# module "aws_eip" {
#   source = "../modules/EIP"
#   for_each   = toset([for v in var.counts : tostring(v)])
#   instanceID = module.webec2[v.value].instanceID

# }


################################################################################
# Module Instance
################################################################################
module "webec2" {
  source                 = "../modules/ec2"
  instance_type          = "t3.micro"
  ami                    = var.ami
  count                  = 2
  key_name               = module.key_pair.key_name
  volume_size            = var.volume_size
  volume_type            = var.volume_type
  subnet_id              = "subnet-use1"
  vpc_security_group_ids = [module.ec2_web_sg.SG_ID]
  tags = merge(
    var.tags,
    {
      Name     = "web-w${count.index}"
      Customer = "Zoetis"

    },
  )

}
