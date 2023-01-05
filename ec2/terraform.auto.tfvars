web_sg_port = [
  {
    port = "22"
    cidr = "123.25.23.2/32"
    des  = "SSH access from office IP"
  },
  {
    port = "3306"
    cidr = "123.25.23.2/32"
    des  = "mysql access from office IP"
  },
  {
    port = "80"
    cidr = "123.25.23.2/32"
    des  = "http access from office IP"
  },
  {
    port = "443"
    cidr = "123.25.23.2/32"
    des  = "https access from office IP"
  }
]

elb_sg_port = [
  
  
  {
    port = "80"
    cidr = "123.25.23.2/32"
    des  = "http access from office IP"
  },
  {
    port = "443"
    cidr = "123.25.23.2/32"
    des  = "https access from office IP"
  }
]