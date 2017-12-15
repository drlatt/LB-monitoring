# instance properties

#monitoring server and loadbalancer
resource "aws_instance" "LB" {
  ami             = "${lookup(var.amis, var.aws_region)}"
  instance_type   = "t2.micro"
  subnet_id       = "${var.aws_subnet_id}"
  key_name        = "${var.key_name}"
  security_groups = "${var.sec_group}"
}

#server1
resource "aws_instance" "server1" {
  ami             = "${lookup(var.amis, var.aws_region)}"
  instance_type   = "t2.micro"
  subnet_id       = "${var.aws_subnet_id}"
  key_name        = "${var.key_name}"
  security_groups = "${var.sec_group}"

  #availability_zone = "eu-west-1a"
}

#server2
resource "aws_instance" "server2" {
  ami             = "${lookup(var.amis, var.aws_region)}"
  instance_type   = "t2.micro"
  subnet_id       = "${var.aws_subnet_id}"
  key_name        = "${var.key_name}"
  security_groups = "${var.sec_group}"

  #availability_zone = "eu-west-1b"
}
