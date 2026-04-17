# ALB Security Group (Public)
resource "aws_security_group" "sg_alb" {
  name        = "alb-sg"
  description = "Allow HTTP from internet"
  vpc_id      = aws_vpc.vp1.id

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
    env  = "Dev"
  }
}

# EC2 Security Group (Private - only ALB can access)
resource "aws_security_group" "sg_web" {
  name        = "web-sg"
  description = "Allow HTTP only from ALB"
  vpc_id      = aws_vpc.vp1.id

  ingress {
    description     = "Allow HTTP from ALB SG"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_alb.id]
  }

  # OPTIONAL: allow SSH (only if you need it)
  ingress {
    description = "Allow SSH (optional)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ⚠️ You can restrict this to your IP for better security
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
    env  = "Dev"
  }
}