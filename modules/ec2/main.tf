data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "myec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instancetype
  key_name      = "devops-ousmanou"

  tags            = var.tag_prenom
  security_groups = ["${var.sec_group}"]
  root_block_device {
    delete_on_termination = true
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start",
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./devops-ousmanou.pem")
      host        = self.public_ip
    }
  }
}

output "aws_instance" {
  value = aws_instance.myec2.id
}

