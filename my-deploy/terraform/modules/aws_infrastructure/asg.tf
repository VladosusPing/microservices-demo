resource "aws_autoscaling_group" "eks_asg" {
  vpc_zone_identifier = [
    aws_subnet.prod-public-subnet-us-east-1a.id,
    aws_subnet.prod-public-subnet-us-east-1b.id
  ]

  desired_capacity = 1
  min_size         = 1
  max_size         = 2

  launch_template {
    id      = aws_launch_template.eks_workers.id
    version = "$Latest"
  }

  tag {
    key                 = "kubernetes.io/cluster/my-eks-cluster"
    value               = "owned"
    propagate_at_launch = true
  }
}
