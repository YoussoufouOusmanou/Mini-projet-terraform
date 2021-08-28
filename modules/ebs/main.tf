resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myebs.id
  instance_id = var.ins_id

}

resource "aws_ebs_volume" "myebs" {
  availability_zone = "us-east-1b"
  size              = var.ebs_size
  tags = var.tag_ebs
}
