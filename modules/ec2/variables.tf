
variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami" {
  type = map(any)
  default = {
    us-east-1 = "use1-ami"
    us-west-2 = "usw2-ami"
  }

}

variable "tags" {
   description = "A mapping of tags to assign to the resource"
  type = map(any)
  default = {}

}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "volume_size" {
  description = "Volume size in GB"
  type = number
  
  
}

variable "volume_type" {
  description = "Details about volume"
  type = string
  
  
}

variable "key_name" {
  type = string
  default = ""
  
}

variable "availability_zone" {
  type = string
  default = ""
  
}

