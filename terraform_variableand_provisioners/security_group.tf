# create default vpc if one does not exit
resource "aws_default_vpc" "default_vpc" {
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# create default subnet if one does not exit
resource "aws_default_subnet" "default_az1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags   = {
    Name = "utrains default subnet"
  }
}

# create security group for the ec2 instance
resource "aws_security_group" "webserver_security_group" {
  name        = "sg"
  description = "allow access on ports 80 and 22"
  vpc_id      = aws_default_vpc.default_vpc.id

  # allow access on these port 80 and 22 for Server using Dynamic blocks. Values are all defined in the variables.tf file
 dynamic "ingress" {
    for_each = var.rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "Security group"
  }
}
