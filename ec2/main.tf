################################################################################
# Retrive use1 subnet id filtered by subnet name
################################################################################
data "aws_subnet" "this" {
  filter {
    name   = "tag:Name"
    values = ["use1-public"]
  }
}

data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = ["opdev"]
  }

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
  source      = "../modules/SG"
  name        = "elb-web-sg"
  description = "SG for web Loadbalancer"
  vpc_id      = data.aws_vpc.this.id
  ports       = [80, 443]
  cidr_blocks = ["192.168.1.32/32", "0.0.0.0/0"]


}

################################################################################
# Module AWS EC2 Security Group
################################################################################
module "ec2_web_sg" {
  source          = "../modules/SG"
  name            = "ec2-web-sg"
  description     = "SG for Web Servers"
  vpc_id          = data.aws_vpc.this.id
  ports           = [22, 80, 443]
  security_groups = module.elb_web_sg.sgid


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
  subnet_id              = data.aws_subnet.this.id
  vpc_security_group_ids = [module.ec2_web_sg.sgid]
  tags = merge(
    var.tags,
    {
      Name     = "web-w${count.index}"
      Customer = "Zoetis"

    },
  )

}
