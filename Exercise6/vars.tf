variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-051f8a213df8bc089"
    # this is from the first_instance.tf file
    us-east-2 = "ami-0900fe555666598a2"
    # get this sample ami from us-east-2; same operating system and version
  }
}

variable "USER" {
  default = "ec2-user"
  # this is an amazon linux EC2 instance and not ubuntu
}

# use the private and public key from previous exercises
variable PUB_KEY {
    default = "keypair3-terraform-project15.pub"
}

variable PRIV_KEY {
    default = "keypair3-terraform-project15"
}