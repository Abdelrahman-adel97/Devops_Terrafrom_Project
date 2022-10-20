## public subnets---------------------------------------
resource "aws_subnet" "public-sub-1" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public_subnet-1"
  }
}

resource "aws_subnet" "public-sub-2" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "public_subnet-2"
  }
}


## private subnets----------------------------------------
resource "aws_subnet" "private-sub-1" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "private_subnet-1"
  }
}

resource "aws_subnet" "private-sub-2" {
  vpc_id            = aws_vpc.terraform_vpc.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "${var.region}b"

  tags = {
    Name = "private_subnet-2"
  }
}
