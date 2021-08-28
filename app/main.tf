provider "aws" {
  region     = "us-east-1"
  access_key = "MY_ACCESS"
  secret_key = "MY_SECRET"
}

terraform {
  backend "s3" {
    bucket     = "terraform-backend-ousmanou"
    key        = "ousmanou-prod.tfstate"
    region     = "us-east-1"
    access_key = "MY_ACCESS"
    secret_key = "MY_SECRET"
  }
}
data "aws_availability_zones" "available" {
  state = "available"
}

module "sg_group" {
  source = "../modules/sec_group"
  #sg_name = "sg_ousmanou"
}

module "ip_publique" {
  source = "../modules/ip_publique"
  inst   = module.ec2.aws_instance
  tag_ip = {
    Name = "IP_pub-Ousmanou"
  }
}

module "ec2" {
  source = "../modules/ec2"
  tag_prenom = {
    Name = "ec2-ousmanou"
  }
  instancetype = "t2.micro"
  sec_group    = module.sg_group.sg_name
}
module "ebs" {
  source = "../modules/ebs"
  ins_id = module.ec2.aws_instance
  #zone = data.aws_availability_zones.available.id
  ebs_size = 1
  tag_ebs = {
    Name = "ebs-Ousmanou"
  }
}
