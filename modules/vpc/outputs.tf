output "aws_vpc" {
  value = aws_vpc.this.id
}

output "region" {
  value = var.region
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}