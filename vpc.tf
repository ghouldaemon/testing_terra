resource "aws_vpc" "cg-vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name                 = "panw ${var.cgid} VPC"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "vpc.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-vpc"
    yor_trace            = "21b17ee0-5f9d-4d01-a9ff-bd11426cf7d5"
  }
}
#Internet Gateway
resource "aws_internet_gateway" "cg-internet-gateway" {
  vpc_id = "${aws_vpc.cg-vpc.id}"
  tags = {
    Name                 = "panw ${var.cgid} Internet Gateway"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "vpc.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-internet-gateway"
    yor_trace            = "cb82f0a7-79d2-457b-90b5-cbf998de4438"
  }
}
#Public Subnets
resource "aws_subnet" "cg-public-subnet-1" {
  availability_zone = "${var.region}a"
  cidr_block        = "10.10.10.0/24"
  vpc_id            = "${aws_vpc.cg-vpc.id}"
  tags = {
    Name                 = "panw ${var.cgid} Public Subnet #1"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "vpc.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-public-subnet-1"
    yor_trace            = "b8f31300-5078-43df-ab41-0ec4d42bce67"
  }
}
resource "aws_subnet" "cg-public-subnet-2" {
  availability_zone = "${var.region}b"
  cidr_block        = "10.10.20.0/24"
  vpc_id            = "${aws_vpc.cg-vpc.id}"
  tags = {
    Name                 = "panw ${var.cgid} Public Subnet #2"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "vpc.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-public-subnet-2"
    yor_trace            = "8d865796-c94c-4ede-ba38-1c1ec6dddf95"
  }
}
#Public Subnet Routing Table
resource "aws_route_table" "cg-public-subnet-route-table" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.cg-internet-gateway.id}"
  }
  vpc_id = "${aws_vpc.cg-vpc.id}"
  tags = {
    Name                 = "panw ${var.cgid} Route Table for Public Subnet"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "vpc.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-public-subnet-route-table"
    yor_trace            = "3060fd0b-72c4-4b81-ad6a-caf370b3094c"
  }
}
#Public Subnets Routing Associations
resource "aws_route_table_association" "cg-public-subnet-1-route-association" {
  subnet_id      = "${aws_subnet.cg-public-subnet-1.id}"
  route_table_id = "${aws_route_table.cg-public-subnet-route-table.id}"
}
resource "aws_route_table_association" "cg-public-subnet-2-route-association" {
  subnet_id      = "${aws_subnet.cg-public-subnet-2.id}"
  route_table_id = "${aws_route_table.cg-public-subnet-route-table.id}"
}