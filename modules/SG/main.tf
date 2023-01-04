################################################################################
# Security Groups
################################################################################

resource "aws_security_group" "this" {
  name   = var.name
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
    description = var.description
    from_port   = port.value
    to_port     = port.value
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks

        }
  }
  ingress {
    description     = var.description
    from_port       = var.http-port
    to_port         = var.http-port
    protocol        = "tcp"
    security_groups = [var.security_groups]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}

