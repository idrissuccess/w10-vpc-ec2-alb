# VPC
resource "aws_vpc" "vp1" {
  cidr_block       = "172.120.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Elb-Vpc"
    env  = "dev"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gtwl" {
  vpc_id = aws_vpc.vp1.id
}

# PUBLIC SUBNETS
resource "aws_subnet" "public1" {
  availability_zone       = "us-east-1a"
  cidr_block              = "172.120.1.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vp1.id

  tags = {
    Name = "public-1a"
  }
}

resource "aws_subnet" "public2" {
  availability_zone       = "us-east-1b"
  cidr_block              = "172.120.2.0/24"
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.vp1.id

  tags = {
    Name = "public-1b"
  }
}

# PRIVATE SUBNETS
resource "aws_subnet" "private1" {
  availability_zone = "us-east-1a"
  cidr_block        = "172.120.3.0/24"
  vpc_id            = aws_vpc.vp1.id

  tags = {
    Name = "private-1a"
  }
}

resource "aws_subnet" "private2" {
  availability_zone = "us-east-1b"
  cidr_block        = "172.120.4.0/24"
  vpc_id            = aws_vpc.vp1.id

  tags = {
    Name = "private-1b"
  }
}

# Elastic IP
resource "aws_eip" "el1" {}

# NAT Gateway
resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.el1.id
  subnet_id     = aws_subnet.public1.id
}

# Public Route Table
resource "aws_route_table" "rtpu1" {
  vpc_id = aws_vpc.vp1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gtwl.id
  }
}

# Private Route Table
resource "aws_route_table" "rtpr1" {
  vpc_id = aws_vpc.vp1.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1.id
  }
}

# Associations
resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.rtpu1.id
}

resource "aws_route_table_association" "rta2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.rtpu1.id
}

resource "aws_route_table_association" "rta3" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.rtpr1.id
}

resource "aws_route_table_association" "rta4" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.rtpr1.id
}