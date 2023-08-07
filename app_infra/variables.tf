# variable "defult_VPC_cidr_block" {
#   description = "CIDR of the jenkins server"
#   type        = list(string)
#   default = data.aws_vpc.default_vpc.cidr_block
# }
variable "http_cidr_block" {
  description = "CIDR of home and office"
  type        = list(string)
  default = [ "98.227.136.153/32","209.122.40.225/32" ]
}
variable "key_name" {
  description = "ssh key of jenkins server"
  type        = string
  default = "ubuntu@jenkins"
}

variable "sg_name" {
  description = "Security Group Name"
  type        = string
  default = "sg_app_server"
}