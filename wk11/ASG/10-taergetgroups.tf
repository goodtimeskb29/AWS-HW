resource "aws_lb_target_group" "latinas-TG" {
  name        = "latinas-TG"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.latinas.id
  target_type = "instance"

  health_check {
    enabled           = true
    healthy_threshold = "2"
  }

  tags = {
    name = "latinas-TG"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

