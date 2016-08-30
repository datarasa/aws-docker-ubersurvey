provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

resource "aws_security_group" "default" {
  name = "ubersurvey_security_group"
  description = "AWS security group for ubersurvey"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    
  egress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

 egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "Ubersurvey"
  }
}

resource "aws_instance" "web" {
    instance_type = "${var.aws_instance_type}"
    ami = "${lookup(var.aws_amis, var.aws_region)}"

    key_name = "${var.aws_key_name}"
    security_groups = [ "${aws_security_group.default.*.name}" ]
    associate_public_ip_address = true

    connection {
        type = "ssh"
        user = "${var.aws_instance_user}"
        key_file = "${var.aws_key_path}"
        timeout = "10m"
        agent = true
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install -y docker",
            "sudo service docker start",
            "sudo docker pull datarasa/ubersurvey",
            "sudo docker run -d -p 8080:80 datarasa/ubersurvey"
        ]
    }

    tags {
        Name = "ubersurvey"
    }
}

