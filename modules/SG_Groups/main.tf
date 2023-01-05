################################################################################
# Security Group
################################################################################
resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.aws_vpc
  tags        = var.tags


}


################################################################################
# Security Group Ingress Rule
################################################################################
resource "aws_security_group_rule" "ingress" {
  for_each    = { for rule, val in var.ports : rule => val }
  description = each.value.des
  type        = var.types
  from_port   = each.value.port
  to_port     = each.value.port
  protocol    = var.protocols
  cidr_blocks = [each.value.cidr]


  security_group_id = aws_security_group.this.id
}

################################################################################
# Security Group Egress Rule
################################################################################
resource "aws_security_group_rule" "egress" {
  description = "all outbound traffic"
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = -1
  cidr_blocks = ["0.0.0.0/0"]


  security_group_id = aws_security_group.this.id
}