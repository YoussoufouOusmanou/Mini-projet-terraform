variable "instancetype" {
  type        = string
  description = "set aws instance type"
  default     = "t2.nano"
}

variable "tag_prenom" {
  type        = map(any)
  description = "set aws tag"
  default = {
    Name = "Ousmanou"
  }
}

variable "sec_group" {
  description = "set sec group name"
  default     = "sec_g"
}
