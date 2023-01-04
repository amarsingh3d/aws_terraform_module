variable "http-port" {
  type    = string
  default = "80"
}


variable "ssh-port" {
  type    = string
  default = "22"
}

variable "https-port" {
  type    = string
  default = "443"

}

variable "vpc_id" {
  type = string

  
}

variable "name" {
  type = string

  
}

variable "description" {
  type = string
  
  
}

variable "cidr_blocks" {
  type = list(string)
  default = [ "0.0.0.0/0" ]
  
}

variable "security_groups" {
  type = string
  default = "self"
 
  
}

variable "ports" {
  description = "Ports to whitelist in SG"
  
}