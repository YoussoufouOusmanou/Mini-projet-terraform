variable "ebs_size" {
  type        = number
  description = "set aws size "
  default     = 1

}

variable "ins_id" {
  type = string
  description = "set aws instance"
  default = ""
}

variable "tag_ebs" {
  description = "set tag name"
  default = {
    Name = "ebs-Ousmanou"
  }
}
variable "zone" {
  description = "set zone"
  default = ""
}
