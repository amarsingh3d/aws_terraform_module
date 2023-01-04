################################################################################
# Elastic IP Address
################################################################################

resource "aws_eip" "this" {
  vpc = true
  instance = var.instanceID


}

# resource "aws_eip_association" "this" {
#   instance_id   = var.instanceID
#   allocation_id = aws_eip.this.id

# }