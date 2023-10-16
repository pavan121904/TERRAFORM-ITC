resource "aws_security_group" "alb_sg" {
  name_prefix   = "${var.name_prefix}-alb-sg"
  description   = "Security group for ALB"
  vpc_id        = var.vpc_id

  # Define inbound rules for the ALB, e.g., allow incoming HTTP and HTTPS traffic
}

resource "aws_security_group" "ec2_sg" {
  name_prefix   = "${var.name_prefix}-ec2-sg"
  description   = "Security group for EC2 instances"
  vpc_id        = var.vpc_id

  # Define inbound rules for the EC2 instances, e.g., allow incoming traffic from the ALB
}

resource "aws_lb" "application" {
  name               = "${var.name_prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [aws_security_group.alb_sg.id]

  enable_deletion_protection = false

  enable_http2 = true

  enable_deletion_protection = false

  enable_http2 = true

  enable_deletion_protection = false
}

resource "aws_launch_configuration" "ec2_lc" {
  name_prefix   = "${var.name_prefix}-ec2-lc"
  image_id      = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.ec2_sg.id]

  # User data or other configurations for EC2 instances
}

resource "aws_autoscaling_group" "ec2_asg" {
  name                      = "${var.name_prefix}-ec2-asg"
  availability_zones        = var.subnet_ids
  launch_configuration       = aws_launch_configuration.ec2_lc.name
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  vpc_zone_identifier       = var.subnet_ids
  target_group_arns         = [aws_lb.application.arn]
  health_check_type         = "ELB"
}

resource "aws_lb_target_group" "application" {
  name     = "${var.name_prefix}-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "instance"
}

resource "aws_lb_listener" "application" {
  load_balancer_arn = aws_lb.application.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application.arn
  }
}
