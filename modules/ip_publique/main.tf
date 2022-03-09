resource "aws_eip" "lb" {
  instance = var.inst
  vpc      = true
  tags =  var.tag_ip
  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${aws_eip.lb.public_ip}; >> ip_ec2.txt"
  }
}
