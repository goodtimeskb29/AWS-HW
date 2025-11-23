resource "aws_launch_template" "latinas-LT" {
  name        = "latinas-LT"
  description = "Laucnch template for latinas server"

  image_id                             = "ami-06d455b8b50b0de4d"
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "t3.micro"

  key_name = "latinas-LT"

  vpc_security_group_ids = ["sg-0bf3a509e17ba020c"]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "latinas-LT"
    }
  }

  user_data = filebase64("${path.module}/user_data.sh")

  lifecycle {
    create_before_destroy = true
  }
}





