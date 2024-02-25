resource "aws_lb" "Load_Balancer-BerguellaMohammed" {
  name               = "LB-BerguellaMohammed"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group_lb-BerguellaMohammed.id]
  subnets            = ["subnet-0e3b5a73eb879dbe8", "subnet-00c1a909f003623cf"]

}

resource "aws_lb_target_group" "target_group-BerguellaMohammed" {

  name     = "LB-TG-BerguellaMohammed"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

}

resource "aws_lb_listener" "listener-BerguellaMohammed" {
  load_balancer_arn = aws_lb.Load_Balancer-BerguellaMohammed.arn
  port              = 80

  default_action {
    target_group_arn = aws_lb_target_group.target_group-BerguellaMohammed.arn
    type             = "forward"
  }

}