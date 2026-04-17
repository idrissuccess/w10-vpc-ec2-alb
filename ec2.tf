resource "aws_instance" "server1" {
  ami           = "ami-0c1e21d82fe9c9336"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private1.id

  vpc_security_group_ids = [aws_security_group.sg_web.id] # ✅ FIXED

  user_data = file("setup.sh")

  tags = {
    Name = "web1"
  }
}

resource "aws_instance" "server2" {
  ami           = "ami-0c1e21d82fe9c9336"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private2.id

  vpc_security_group_ids = [aws_security_group.sg_web.id] # ✅ FIXED

  user_data = file("setup.sh")

  tags = {
    Name = "web2"
  }
}