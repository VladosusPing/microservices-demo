resource "aws_security_group" "prod-eks-sg" {
  name        = "prod-eks-sg"
  description = "Controls access to the ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [var.public_us-east-1a_subnet_cidr, var.public_us-east-1b_subnet_cidr]
  }

  ingress {
    from_port   = 50051
    to_port     = 50051
    protocol    = "tcp"
    cidr_blocks = [var.public_us-east-1a_subnet_cidr, var.public_us-east-1b_subnet_cidr]
  }

  ingress {
    from_port   = 3550
    to_port     = 3550
    protocol    = "tcp"
    cidr_blocks = [var.public_us-east-1a_subnet_cidr, var.public_us-east-1b_subnet_cidr]
  }

  ingress {
    from_port   = 7000
    to_port     = 7000
    protocol    = "tcp"
    cidr_blocks = [var.public_us-east-1a_subnet_cidr, var.public_us-east-1b_subnet_cidr]
  }

  ingress {
    from_port   = 5050
    to_port     = 5050
    protocol    = "tcp"
    cidr_blocks = [var.public_us-east-1a_subnet_cidr, var.public_us-east-1b_subnet_cidr]
  }

  ingress {
    from_port   = 7070
    to_port     = 7070
    protocol    = "tcp"
    cidr_blocks = [var.public_us-east-1a_subnet_cidr, var.public_us-east-1b_subnet_cidr]
  }

  ingress {
    from_port   = 9555
    to_port     = 9555
    protocol    = "tcp"
    cidr_blocks = [var.public_us-east-1a_subnet_cidr, var.public_us-east-1b_subnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "prod-eks-sg"
  }
}
