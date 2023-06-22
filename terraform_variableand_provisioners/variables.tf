variable "region" {
  type    = string
  default = "us-east-1"
}

variable "typeinstances" {
  type        = string
  default     = "t2.micro"
  description = "type of the instances"
}