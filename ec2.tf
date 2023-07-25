#IAM Role
resource "aws_iam_role" "cg-banking-WAF-Role" {
  name               = "cg-banking-WAF-Role-${var.cgid}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags = {
    Name                 = "cg-banking-WAF-Role-${var.cgid}"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "ec2.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-banking-WAF-Role"
    yor_trace            = "97f36e1c-5a20-4585-8abf-63e293bc3676"
  }
}

#IAM Role Policy Attachment
resource "aws_iam_role_policy_attachment" "cg-banking-WAF-Role-policy-attachment-s3" {
  role       = "${aws_iam_role.cg-banking-WAF-Role.name}"
  policy_arn = "${data.aws_iam_policy.s3-full-access.arn}"
}

#IAM Instance Profile
resource "aws_iam_instance_profile" "cg-ec2-instance-profile" {
  name = "cg-ec2-instance-profile-${var.cgid}"
  role = "${aws_iam_role.cg-banking-WAF-Role.name}"
  tags = {
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "ec2.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-ec2-instance-profile"
    yor_trace            = "ab8a7883-ccf4-40fb-a09b-08cf08f3f856"
  }
}

#Security Groups
resource "aws_security_group" "cg-ec2-ssh-security-group" {
  name        = "cg-ec2-ssh-${var.cgid}"
  description = "panw ${var.cgid} Security Group for EC2 Instance over SSH"
  vpc_id      = "${aws_vpc.cg-vpc.id}"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cg_whitelist]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  tags = {
    Name                 = "cg-ec2-ssh-${var.cgid}"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "ec2.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-ec2-ssh-security-group"
    yor_trace            = "e2535cb7-8230-4ee1-8fde-5abf546f15be"
  }
}
resource "aws_security_group" "cg-ec2-http-security-group" {
  name        = "cg-ec2-http-${var.cgid}"
  description = "panw ${var.cgid} Security Group for EC2 Instance over HTTP"
  vpc_id      = "${aws_vpc.cg-vpc.id}"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cg_whitelist]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  tags = {
    Name                 = "cg-ec2-http-${var.cgid}"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "ec2.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-ec2-http-security-group"
    yor_trace            = "a9452081-8f33-49f4-aad0-770118120b7a"
  }
}
#AWS Key Pair
resource "aws_key_pair" "cg-ec2-key-pair" {
  key_name   = "cg-ec2-key-pair-${var.cgid}"
  public_key = "${file(var.ssh-public-key-for-ec2)}"
  tags = {
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "ec2.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-ec2-key-pair"
    yor_trace            = "95759a4a-3f09-40e5-8a3d-20c94be4e30d"
  }
}
#EC2 Instance
resource "aws_instance" "ec2-vulnerable-proxy-server" {
  ami                         = "ami-0a313d6098716f372"
  instance_type               = "t2.micro"
  iam_instance_profile        = "${aws_iam_instance_profile.cg-ec2-instance-profile.name}"
  subnet_id                   = "${aws_subnet.cg-public-subnet-1.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = [
    "${aws_security_group.cg-ec2-ssh-security-group.id}",
    "${aws_security_group.cg-ec2-http-security-group.id}"
  ]
  key_name = "${aws_key_pair.cg-ec2-key-pair.key_name}"
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }
  provisioner "file" {
    source      = "../assets/proxy.com"
    destination = "/home/ubuntu/proxy.com"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file(var.ssh-private-key-for-ec2)}"
      host        = self.public_ip
    }
  }
  user_data = <<-EOF
        #!/bin/bash
        apt-get update
        apt-get install -y nginx
        ufw allow 'Nginx HTTP'
        cp /home/ubuntu/proxy.com /etc/nginx/sites-enabled/proxy.com
        rm /etc/nginx/sites-enabled/default
        systemctl restart nginx
        EOF
  volume_tags = {
    Name     = "panw ${var.cgid} EC2 Instance Root Device"
    Stack    = "${var.stack-name}"
    Scenario = "${var.scenario-name}"
  }
  tags = {
    Name                 = "ec2-vulnerable-proxy-server-${var.cgid}"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "ec2.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "ec2-vulnerable-proxy-server"
    yor_trace            = "f1f7fbe0-40b5-49d2-aa6c-72d629ff2790"
  }
}