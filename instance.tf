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

  #copy nginx file
  provisioner "file" {
    source      = "nginx_files/lb/default"
    destination = "/tmp/default"
  }

  #use the remote_exec provisioner to run commands on the remote instance
  #install nginx and copy nginx file
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && sudo apt-get install nginx -y",
      "sudo cp /tmp/default /etc/nginx/sites-available",
    ]
  }

  #configure how the provisioner connects to the remote instance
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("~/Documents/personal/lat_aws")}"
  }
}

#add a static IP address to the LB instance
/*resource "aws_eip" "lb" {
  instance = "${aws_instance.LB.id}"
}*/

###############################################################################
###############################################################################
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
  #copy default site file
  provisioner "file" {
    source      = "nginx_files/server1/default"
    destination = "/tmp/default"
  }
  #copy index.html file
  provisioner "file" {
    source      = "nginx_files/server1/index.html"
    destination = "/tmp/index.html"
  }
  #use the remote_exec provisioner to run commands on the remote instance
  #install nginx
  #copy files from tmp to correct locations
  #assign correct permissions to folders
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && sudo apt-get install nginx -y",
      "sudo cp /tmp/default /etc/nginx/sites-available && sudo cp /tmp/index.html /var/www/html",
      "sudo chown -R www-data:www-data /var/www/html && sudo chmod -R 777 /var/www/html",
    ]
  }
  #configure how the provisioner connects to the remote instance
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("~/Documents/personal/lat_aws")}"
  }
}

#add a static IP address to the server1 instance
/*resource "aws_eip" "server1" {
  instance = "${aws_instance.server1.id}"
}*/

###############################################################################
###############################################################################
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
  #copy default site file
  provisioner "file" {
    source      = "nginx_files/server2/default"
    destination = "/tmp/default"
  }
  #copy index.html file
  provisioner "file" {
    source      = "nginx_files/server2/index.html"
    destination = "/tmp/index.html"
  }
  #use the remote_exec provisioner to run commands on the remote instance
  #install nginx
  #copy files from tmp to correct locations
  #assign correct permissions to folders
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update && sudo apt-get install nginx -y",
      "sudo cp /tmp/default /etc/nginx/sites-available && sudo cp /tmp/index.html /var/www/html",
      "sudo chown -R www-data:www-data /var/www/html && sudo chmod -R 777 /var/www/html",
    ]
  }
  #configure how the provisioner connects to the remote instance
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("~/Documents/personal/lat_aws")}"
  }
}

#add a static IP address to the server2 instance
/*resource "aws_eip" "server2" {
  instance = "${aws_instance.server2.id}"
}*/

