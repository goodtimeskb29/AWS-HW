resource "aws_internet_gateway" "latinas" {
  vpc_id = aws_vpc.latinas.id

  tags = {
    Name = "latinas-igw"
  }
}