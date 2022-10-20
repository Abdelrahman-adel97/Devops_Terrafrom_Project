resource "aws_instance" "bastion" {
  ami                         = "ami-08c40ec9ead489470"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.devops-sg.id}"]
  key_name                    = aws_key_pair.devops_ssh_key.key_name
  subnet_id                   = module.network.pub-sub1-id
  associate_public_ip_address = "true"

  tags = {
    Name = "bastion_ec2"
  }
  root_block_device {
    delete_on_termination = "true"

  }

}

resource "aws_instance" "application_ec2" {
  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.devops-sg2.id}"]
  key_name               = aws_key_pair.devops_ssh_key.key_name
  subnet_id              = module.network.priv-sub1-id

  tags = {
    Name = "application_ec2"
  }
  root_block_device {
    delete_on_termination = "true"
  }

}
