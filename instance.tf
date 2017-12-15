# instance properties

#monitoring server and loadbalancer
resource "aws_instance" "LB" {
  ami           = "${lookup(var.amis, var.aws_region)}"
  instance_type = "t2.micro"
  subnet_id     = "${var.aws_subnet_id}"
}

#server1
resource "aws_instance" "server1" {
  ami           = "${lookup(var.amis, var.aws_region)}"
  instance_type = "t2.micro"
  subnet_id     = "${var.aws_subnet_id}"
}

#server2
resource "aws_instance" "server2" {
  ami           = "${lookup(var.amis, var.aws_region)}"
  instance_type = "t2.micro"
  subnet_id     = "${var.aws_subnet_id}"
}
