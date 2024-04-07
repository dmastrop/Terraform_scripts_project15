resource "aws_key_pair" "keypair-terraform-project15" {
  # this title is just the name of the resource not the keyname
  key_name = "keypair3-terraform-project15"
  # this is the keyname that want to attach to this EC2 instance
  public_key = file("keypair3-terraform-project15.pub")
  # this will read from the current directory where this file is and get the public key file contents and assign them to public_key
}

resource "aws_instance" "exercise3-project15" {
  ami = var.AMIS[var.REGION]
  # this is a mapped variable
  instance_type     = "t2.micro"
  availability_zone = var.ZONE1

  #key_name          = "keypair-terraform-project15"
  #key_name          = "keypair2-terraform-project15"
  # keypair to the EC2 instance
  # We can now access this through "keypair3-terraform-project15" above
  # Better to access parameter through the resource
  key_name = aws_key_pair.keypair-terraform-project15.key_name

  vpc_security_group_ids = ["sg-014077e3dfc5d17d2"]
  #security_group_id= "sg-014077e3dfc5d17d2"

  tags = {
    Name    = "terraform-project15-instance3"
    Project = "15"
  }

  # Next provision this instance. Put the shell script in the /tmp directory of the EC2 instance
  provisioner "file" {
    source = "web.sh"
    # this is the shell script in root
    destination = "/tmp/web.sh"
  }

  # remote-exec provisioner to execute the script remotely on the EC2 instance
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }


  # this is the connection details for the provisioners above  
  connection {
    user        = var.USER
    private_key = file("keypair3-terraform-project15")
    # this is from local ccurrent directory where we are executing terraform
    host = self.public_ip
    # it will use the public ip assigned to the instance created by the resource above
  }
}

output "PublicIP" {
  value = aws_instance.exercise3-project15.public_ip
}

output "PrivateIP" {
  value = aws_instance.exercise3-project15.private_ip
}