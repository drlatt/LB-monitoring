# terraform variables

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_subnet_id" {
  default = "subnet-72749c15"
}

variable "amis" {
  type = "map"

  default = {
    us-east-1 = "ami-aa2ea6d0"
    us-west-2 = "ami-0def3275"
    eu-west-1 = "ami-8fd760f6"
  }
}
