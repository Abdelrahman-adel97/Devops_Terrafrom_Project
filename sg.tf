resource "aws_security_group" "devops-sg" {
  description = "security group for bastion ec2"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }

  tags = {
    Name      = "iti_sg_ssh"
    createdBy = "terraform : Abdelrahman"
  }
}


resource "aws_security_group" "devops-sg2" {
  description = "security group for Application ec2"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }
  ingress {
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
    from_port   = 3000
    to_port     = 3000
  }

  tags = {
    Name      = "iti_sg_ssh_port3000"
    createdBy = "terraform : Abdelrahman"
  }
}
