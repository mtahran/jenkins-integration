variable "jenkins_server_ip" {
  description = "CIDR of the office"
  type        = list(string)
  default = [ "18.234.241.223/32" ]
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