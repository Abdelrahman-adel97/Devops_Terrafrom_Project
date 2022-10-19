resource "tls_private_key" "devops-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "devops_ssh_key" {
  key_name   = var.key_name
  public_key = tls_private_key.devops-key.public_key_openssh
}
