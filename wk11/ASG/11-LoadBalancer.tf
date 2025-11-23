resource "aws_lb" "latinas-LB" {
  name               = "latinas-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.latinas-LB.id]
  subnets = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id,
    aws_subnet.public_c.id

  ]
  enable_deletion_protection = false

  tags = {
    name = "latinas-LB"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.latinas-LB.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.latinas-TG.arn

  }
}


