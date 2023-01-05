variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(any)
  default = {
    CostCenter = "Hosting"
    Automation = "Terraform"

  }

}

variable "project1_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDERT8JttlolL0H4AwAnOaOvebDim0hq5GiCM3cF8/37t4EDgmtXeYibf9jGZNy26pLwXmA56VL0cX4QzLAFAcQx0kSyQzfvJOK724Nx2PhWI3q/ZwzTjXoqulVuu0HwpbswpGaztJIRxXpfQvcBzF6QG1PYQeMbd/FmqYTb3z3xswHam/jj1duRbE8uKZuwphmFDwegbILa02zzqhYLs5WhiPjLmbWF9hmPhRWNnvokKes8ME4pI30d2tsOjKSM311ieF7B/hMdTBr+yh5UEqxP8uAGXkwAklRSab5tDnqtbf17jINJG6qz3kXZYHVedpP8aTcDqha6ACBNHZLofVNGfQsRFxIkf0XajMAabWVUnpt/n1KBfF7L2Tnty3//9p5A4n6zeO4bLWsK5utitOZ5+T1qfKQo2cBDmZkfdYFpoSc5yDQo3Yr31W93tDsAK01hVQbsOuOeu5Wr7QfZ8zTG+/g8anBJHWgR5qHpETxxU00usNCuhyO9G/h1c8QPi8= root@INHL1250"

}

variable "instance_count" {
  type    = number
  default = 1

}


variable "ami" {
  type = map(any)
  default = {
    us-east-1 = "use1-ami"
    us-west-2 = "usw2-ami"
  }
}

variable "volume_size" {
  description = "Volume size in GB"
  type        = number
  default     = 50

}

variable "volume_type" {
  description = "Details about volume"
  type        = string
  default     = "gp3"

}

variable "web_sg_port" {
  default = ""  
}

variable "elb_sg_port" {
  default = ""
  
}
