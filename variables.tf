variable "aws_region" {}

variable "aws_access_key" {
  description = "The AWS access key."
}

variable "aws_secret_key" {
  description = "The AWS secret key."
}

variable "aws_key_name" {}
variable "aws_key_path" {}

variable "aws_instance_type" {}
variable "aws_instance_user" {}

variable "aws_amis" {
    default = {
        us-east-1 = "ami-246ed34c" # north virginia
    }
}

variable "aws_availability_zones" {
    default = {
        "0" = "us-east-1a"
        "1" = "us-east-1b"
        "2" = "us-east-1c"
    }
}
