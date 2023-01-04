################################################################################
# Load Balancer
################################################################################

resource "aws_elb" "this" {
  name            = var.elbname
  security_groups = var.elbsg
  subnets         = var.subnets
  listener {
    instance_port     = var.http-port
    instance_protocol = var.instance_protocol
    lb_port           = var.http-lb-port
    lb_protocol       = var.lb_protocol
  }
  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    target              = var.target
    interval            = var.interval
  }
  instances = var.instanceID
}
