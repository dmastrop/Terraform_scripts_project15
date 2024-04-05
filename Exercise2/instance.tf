
resource "aws_instance" "exercise2-project15" {
  ami = var.AMIS[var.REGION]
  # this is a mapped variable
  instance_type     = "t2.micro"
  availability_zone = var.ZONE1
  #key_name          = "keypair-terraform-project15"
  key_name          = "keypair2-terraform-project15"
  # keypair to the EC2 instance
  vpc_security_group_ids = ["sg-014077e3dfc5d17d2"]
  #security_group_id= "sg-014077e3dfc5d17d2"
  tags = {
    Name    = "terraform-project15-instance2"
    Project = "15"
  }
}