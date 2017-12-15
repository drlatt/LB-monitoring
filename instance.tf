# instance properties

resource "aws_instance" "test1" {
  ami           = "${lookup(var.amis, var.aws_region)}"
  instance_type = "t2.micro"
  subnet_id     = "${var.aws_subnet_id}"

  # use the local-exec provisioner to run commands locally
  /*  provisioner "local-exec" {
    command = "echo ${aws_instance.test1.public_ip} > ip_address.txt"
  } */
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.test1.id}"
}

# output variables such as IP address
output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
