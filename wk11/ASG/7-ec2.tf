resource "aws_instance" "latinas" {
  ami                         = "ami-06d455b8b50b0de4d"
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  # key_name = 
  vpc_security_group_ids = [aws_security_group.latinas.id]
  subnet_id              = aws_subnet.public_a.id

  user_data = file("user_data.sh")

  tags = {
    Name = "latinas"
  }
}