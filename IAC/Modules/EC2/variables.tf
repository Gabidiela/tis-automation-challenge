variable "project_name" {}
variable "vpc_id" {}
variable "instance_ubuntu" {
  type = object({
    instance_ami     = string # https://cloud-images.ubuntu.com/locator/ec2/
    instance_type    = string
    key_pair_name    = string
    script_file_path  = string
    script_file_name  = string
  })
}

variable "instance_windows" {
  type = object({
    instance_ami     = string # 
    instance_type    = string
    key_pair_name    = string
    script_file_path  = string
    script_file_name  = string
  })
}

variable "subnet_id" {}

variable "volume_settings" {
 type = object({
    volume_size       = number
    volume_type       = string
  })
}