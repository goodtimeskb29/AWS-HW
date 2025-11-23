resource "aws_eip" "latinas-nat" {
  domain = "vpc"

  tags = {
    Name = "latinas-eip-for-latinas-nat"
  }

  depends_on = [aws_internet_gateway.latinas] # explict dependency 
}

resource "aws_nat_gateway" "latinas" {
  allocation_id = aws_eip.latinas-nat.id # implict dependency for eip
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "latinas-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.latinas]
}