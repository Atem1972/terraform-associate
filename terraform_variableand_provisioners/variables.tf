variable "region" {
  type    = string
  default = "us-east-1"
}

variable "typeinstances" {
  type    = string
  default = "t2.micro"
  description   = "type of the instances"
}

# Declaring variable using complex type : List of Object
variable "rules" {
  type = list(object({
    port        = number
    proto       = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      port        = 80
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}