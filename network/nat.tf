resource "aws_eip" "lb" {
  depends_on = [aws_internet_gateway.igw]
  # vpc        = "true"
  tags = {
    Name = "devops-eip"
  }
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public-sub-1.id

  tags = {
    Name = "devps-nat-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}


