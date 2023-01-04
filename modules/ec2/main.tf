
################################################################################
# Instance
################################################################################

resource "aws_instance" "this" {
  instance_type           = var.instance_type
  ami                     = lookup(var.ami, "us-east-1")
  availability_zone      = var.availability_zone
  subnet_id               = var.subnet_id
  #count = var.instance_count
  disable_api_termination = true
  key_name = var.key_name
  vpc_security_group_ids  = var.vpc_security_group_ids
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type

  }
  tags = var.tags


}

