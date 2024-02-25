resource "aws_autoscaling_group" "auto_scale-BerguellaMohammed" {
  availability_zones = ["eu-west-1a"]
  desired_capacity   = 2
  min_size           = 2
  max_size           = 2

  target_group_arns = [aws_lb_target_group.target_group-BerguellaMohammed.arn]
  launch_template {
    id      = aws_launch_template.Launch_Template-BerguellaMohammed.id
    version = "$Latest"
  }

}