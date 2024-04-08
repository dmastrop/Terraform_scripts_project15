# data "aws_vpc" "vpc-project15-exercise6" {
#   id = var.vpc_id
# }



resource "aws_security_group" "security-group-project15-exercise6" {
    vpc_id = aws_vpc.vpc-project15-exercise6.id
    #vpc_id = data.aws_vpc.vpc-project15-excercise6.id
    name = "vprofile-security-group-project15"
    description = "Security Group for vprofile project15 exercise6 SSH"
    # egress allows all traffic from any source to any source on any protocol
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }

    tags = {
        Name = "allow-ssh-security-group-project15-excercise6"
    }

}
