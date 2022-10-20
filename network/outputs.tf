output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
}

output "pub-sub1-id" {
  value = aws_subnet.public-sub-1.id
}

output "pub-sub2-id" {
  value = aws_subnet.public-sub-2.id
}

output "priv-sub1-id" {
  value = aws_subnet.private-sub-1.id
}

output "priv-sub2-id" {
  value = aws_subnet.private-sub-2.id
}

