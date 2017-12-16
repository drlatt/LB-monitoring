# instance properties

#monitoring server and loadbalancer
resource "aws_instance" "LB" {
  ami             = "${lookup(var.amis, var.aws_region)}"
  instance_type   = "t2.micro"
  subnet_id       = "${var.aws_subnet_id}"
  key_name        = "${var.key_name}"
  security_groups = "${var.sec_group}"

  #assign a name tag to instance
  tags {
    Name = "LB"
  }

  #use the remote_exec provisioner to run commands on the remote resource
  #install nginx
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && sudo apt-get install nginx -y",
    ]
  }

  #configure how the provisioner connects to the resource
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("~/Documents/personal/lat_aws")}"
  }
}

#add a static IP address to the LB instance
resource "aws_eip" "ip" {
  instance = "${aws_instance.LB.id}"
}

#server1
resource "aws_instance" "server1" {
  ami             = "${lookup(var.amis, var.aws_region)}"
  instance_type   = "t2.micro"
  subnet_id       = "${var.aws_subnet_id}"
  key_name        = "${var.key_name}"
  security_groups = "${var.sec_group}"

  #availability_zone = "eu-west-1a"

  #assign a name tag to instance
  tags {
    Name = "server1"
  }
  #use the remote_exec provisioner to run commands on the remote resource
  #install nginx
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && sudo apt-get install nginx -y",
    ]
  }
  #configure how the provisioner connects to the resource
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("~/Documents/personal/lat_aws")}"
  }
}

#server2
resource "aws_instance" "server2" {
  ami             = "${lookup(var.amis, var.aws_region)}"
  instance_type   = "t2.micro"
  subnet_id       = "${var.aws_subnet_id}"
  key_name        = "${var.key_name}"
  security_groups = "${var.sec_group}"

  #availability_zone = "eu-west-1b"

  #assign a name tag to instance
  tags {
    Name = "server2"
  }
  #use the remote_exec provisioner to run commands on the remote resource
  #install nginx
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && sudo apt-get install nginx -y",
    ]
  }
  #configure how the provisioner connects to the resource
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("~/Documents/personal/lat_aws")}"
  }
}
