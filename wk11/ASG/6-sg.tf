# for web server only 
resource "aws_security_group" "latinas" {
  name        = "latinas"
  description = "Allow HTTP and SSH for web server"
  vpc_id      = aws_vpc.latinas.id

  tags = {
    Name = "latinas-ingress"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.latinas.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.latinas.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.latinas.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

############################ Private SG for Latinas

resource "aws_security_group" "latinas-pvt-sg" {
  name        = "latinas-pvt-sg"
  description = "Allow traffic only from the Public SG"
  vpc_id      = aws_vpc.latinas.id
}


############################ SG for latinas-LB 
resource "aws_security_group" "latinas-LB" {
  name        = "latinas-LB"
  description = "Allow http for latinas-LB"
  vpc_id      = aws_vpc.latinas.id

  tags = {
    Name = "http-for-latinas-LB"
  }
}

resource "aws_vpc_security_group_ingress_rule" "HTTP" {
  security_group_id = aws_security_group.latinas-LB.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "TCP"
  to_port     = 80
}

resource "aws_vpc_security_group_egress_rule" "egress_for_latinas-LB" {
  security_group_id = aws_security_group.latinas-LB.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}