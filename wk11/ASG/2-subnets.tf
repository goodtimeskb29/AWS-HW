########################## Public subnets ##########################


resource "aws_subnet" "public_a" {
  vpc_id = aws_vpc.latinas.id
  # step 1: make VPC
  # step 2: get VPC ID
  # step 3: add VPC ID into vpc_id argument in this subnet 
  # which VPC to create subnet in

  cidr_block              = "10.27.1.0/24"
  availability_zone       = "us-west-2a" # specify AZ 
  map_public_ip_on_launch = true         # allow public IPs to be assigned 

  tags = {
    Name = "public-subnet-us-west-2a"
  }
}


resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.latinas.id
  cidr_block              = "10.27.2.0/24"
  availability_zone       = "us-west-2b" # specify AZ 
  map_public_ip_on_launch = true         # allow public IPs to be assigned 

  tags = {
    Name = "public-subnet-us-west-2b"
  }
}


resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.latinas.id
  cidr_block              = "10.27.3.0/24"
  availability_zone       = "us-west-2c" # specify AZ 
  map_public_ip_on_launch = true         # allow public IPs to be assigned 

  tags = {
    Name = "public-subnet-us-west-2c"
  }
}







########################## Private subnets ##########################

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.latinas.id
  cidr_block              = "10.27.11.0/24"
  availability_zone       = "us-west-2a" # specify AZ 
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-us-west-2a"
  }
}


resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.latinas.id
  cidr_block              = "10.27.12.0/24"
  availability_zone       = "us-west-2b" # specify AZ 
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet-us-west-2b"
  }
}


resource "aws_subnet" "private_c" {
  vpc_id                  = aws_vpc.latinas.id
  cidr_block              = "10.27.13.0/24"
  availability_zone       = "us-west-2c" # specify AZ 
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-us-west-2c"
  }
}