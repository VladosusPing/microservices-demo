resource "aws_eks_cluster" "eks_cluster" {
  name     = "prod-eks-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.prod-public-subnet-us-east-1a.id,
      aws_subnet.prod-public-subnet-us-east-1b.id
    ]
    security_group_ids = [
      aws_security_group.prod-eks-sg.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_policy
  ]
}


# Worker nodes launch temlate
resource "aws_launch_template" "eks_workers" {
  name_prefix   = "eks-workers-"
  image_id      = var.amis
  instance_type = var.instance_type
  key_name      = file(var.ssh_pubkey_file)   # Замени на свой SSH-ключ

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [
      aws_security_group.prod-eks-sg.id
    ]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "eks-worker-node"
    }
  }
}

# Add working nodes to master
resource "aws_eks_node_group" "eks_nodes" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_role_arn   = aws_iam_role.eks_role.arn
  subnet_ids      = [
      aws_subnet.prod-public-subnet-us-east-1a.id,
      aws_subnet.prod-public-subnet-us-east-1b.id
    ]

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  instance_types = [
    var.instance_type
  ]

  depends_on = [aws_iam_role_policy_attachment.eks_policy]
}