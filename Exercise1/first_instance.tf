provider "aws" {
  region = "us-east-1"
  # access_key = ""
  # secret_key = ""
}

resource "aws_instance" "intro" {
  ami               = "ami-051f8a213df8bc089"
  instance_type     = "t2.micro"
  availability_zone = "us-east-1a"
  key_name          = "keypair-terraform-project15"
  # keypair to the EC2 instance
  vpc_security_group_ids = ["sg-014077e3dfc5d17d2"]
  #security_group_id= "sg-014077e3dfc5d17d2"
  tags = {
    Name    = "terraform-project15-instance"
    Project = "15"
  }
}
