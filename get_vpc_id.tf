data "aws_vpc" "default" {
  default = true
}

output "aws_vpc_id" {
  value = data.aws_vpc.default.id
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

output "all_subnet_id" {
	value = data.aws_subnets.all.ids
}
