

resource "aws_vpc" "vpc-project15-exercise6" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags = {
        Name ="vprofile-vpc-project15"
    }
}

# subnets aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
# public subnets

resource "aws_subnet" "public-subnet-1-project15-exercise6" {
    vpc_id = aws_vpc.vpc-project15-exercise6.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    # we have three ZONES in vars.tf
    availability_zone = var.ZONE1
    tags = {
        Name = "vprofile-pub-1-project15"
    }
}

resource "aws_subnet" "public-subnet-2-project15-exercise6" {
    vpc_id = aws_vpc.vpc-project15-exercise6.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    # we have three ZONES in vars.tf
    availability_zone = var.ZONE2
    tags = {
        Name = "vprofile-pub-2-project15"
    }
}

resource "aws_subnet" "public-subnet-3-project15-exercise6" {
    vpc_id = aws_vpc.vpc-project15-exercise6.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true"
    # we have three ZONES in vars.tf
    availability_zone = var.ZONE3
    tags = {
        Name = "vprofile-pub-3-project15"
    }
}

# private subnets

resource "aws_subnet" "private-subnet-1-project15-exercise6" {
    vpc_id = aws_vpc.vpc-project15-exercise6.id
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "true"
    # we have three ZONES in vars.tf
    availability_zone = var.ZONE1
    tags = {
        Name = "vprofile-priv-1-project15"
    }
}

resource "aws_subnet" "private-subnet-2-project15-exercise6" {
    vpc_id = aws_vpc.vpc-project15-exercise6.id
    cidr_block = "10.0.5.0/24"
    map_public_ip_on_launch = "true"
    # we have three ZONES in vars.tf
    availability_zone = var.ZONE2
    tags = {
        Name = "vprofile-priv-2-project15"
    }
}

resource "aws_subnet" "private-subnet-3-project15-exercise6" {
    vpc_id = aws_vpc.vpc-project15-exercise6.id
    cidr_block = "10.0.6.0/24"
    map_public_ip_on_launch = "true"
    # we have three ZONES in vars.tf
    availability_zone = var.ZONE3
    tags = {
        Name = "vprofile-priv-3-project15"
    }
}


# internet gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "internet-gw-project15-excercise6" {
    vpc_id = aws_vpc.vpc-project15-exercise6.id
    tags = {
        Name = "vprofile-internet-gw-project15"
    }
}


# join the internet gw with the subnets via the route table and route table association
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "route-table-project15-exercise6" {
    vpc_id = aws_vpc.vpc-project15-exercise6.id

    route {
        cidr_block = "0.0.0.0/0"
        # the default gw 0.0.0.0 will be the internet gw defined above
        gateway_id = aws_internet_gateway.internet-gw-project15-excercise6.id
    }

    tags = {
        Name = "vprofile-route-table-project15"
    }

}

# need to link the public subnets to the route table above. This then will set the default gw as the internet gw for
# all three public subnets so that they can route traffic out.
# this is done through a route table association
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association
resource "aws_route_table_association" "route-table-association-pub-1-project15-excercise6" {
    subnet_id = aws_subnet.public-subnet-1-project15-exercise6.id
    route_table_id = aws_route_table.route-table-project15-exercise6.id
}

resource "aws_route_table_association" "route-table-association-pub-2-project15-excercise6" {
    subnet_id = aws_subnet.public-subnet-2-project15-exercise6.id
    route_table_id = aws_route_table.route-table-project15-exercise6.id
}

resource "aws_route_table_association" "route-table-association-pub-3-project15-excercise6" {
    subnet_id = aws_subnet.public-subnet-3-project15-exercise6.id
    route_table_id = aws_route_table.route-table-project15-exercise6.id
}

