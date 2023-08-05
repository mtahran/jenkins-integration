data "aws_vpc" "default_vpc" {
  default = true
}

### subnet ids - all
data "aws_subnets" "subnet_ids" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}

### subnet id
data "aws_subnet" "subnet_id" {
  for_each = toset(data.aws_subnets.subnet_ids.ids)
  id       = each.value
}