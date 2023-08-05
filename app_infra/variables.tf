variable "jenkins_server_ip" {
  description = "CIDR of the jenkins server"
  type        = list(string)
  default = [ "172.31.35.188/32" ]
}
variable "http_cidr_block" {
  description = "CIDR of the jenkins server"
  type        = list(string)
  default = [ "98.227.136.153/32/32","209.122.40.225/32" ]
}
variable "key_name" {
  description = "ssh key of my laptop"
  type        = string
  default = "ubuntu@jenkins"
}

variable "sg_name" {
  description = "Security Group Name"
  type        = string
  default = "sg_app_server"
}