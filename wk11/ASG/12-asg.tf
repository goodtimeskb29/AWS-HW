resource "aws_autoscaling_group" "latinas-ASG" {
  name = "latinas-ASG"
  vpc_zone_identifier = [aws_subnet.private_a.id,
                         aws_subnet.private_b.id,
                         aws_subnet.private_c.id]
  max_size                  = 6
  min_size                  = 3
  health_check_type         = "ELB"
  health_check_grace_period = "300"
  target_group_arns         = [aws_lb_target_group.latinas-TG.arn]
  force_delete              = true

  launch_template {
    id      = aws_launch_template.latinas-LT.id
    version = "$Latest"
  }

  tag {
    key                 = "latinas-ASG"
    value               = "web-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "latinas-CPU" {
    name = "latinas-cpu-policy"
    autoscaling_group_name = aws_autoscaling_group.latinas-ASG.id
    estimated_instance_warmup = 60
    policy_type = "TargetTrackingScaling"


    target_tracking_configuration {
      predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
      }

      target_value = 40.0
    }  
}

resource "aws_autoscaling_attachment" "latinas-ASA" {
  autoscaling_group_name = aws_autoscaling_group.latinas-ASG.id
  lb_target_group_arn    = aws_lb_target_group.latinas-TG.arn
}