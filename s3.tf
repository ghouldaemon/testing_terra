#Secret S3 Bucket
resource "aws_s3_bucket" "cg-cardholder-data-bucket" {
  bucket        = "cg-cardholder-data-bucket-${var.cgid}"
  acl           = "private"
  force_destroy = true
  tags = {
    Name                 = "cg-cardholder-data-bucket-${var.cgid}"
    Description          = "panw ${var.cgid} S3 Bucket used for storing sensitive cardholder data."
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "s3.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cg-cardholder-data-bucket"
    yor_trace            = "c65b5757-5b4c-4927-a8df-a0b777f80115"
  }
}
resource "aws_s3_bucket_object" "cardholder-data-primary" {
  bucket = "${aws_s3_bucket.cg-cardholder-data-bucket.id}"
  key    = "cardholder_data_primary.csv"
  source = "../assets/cardholder_data_primary.csv"
  tags = {
    Name                 = "cardholder-data-${var.cgid}"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "s3.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cardholder-data-primary"
    yor_trace            = "ef6b53d0-8473-41e9-9006-9443bb030d80"
  }
}
resource "aws_s3_bucket_object" "cardholder-data-secondary" {
  bucket = "${aws_s3_bucket.cg-cardholder-data-bucket.id}"
  key    = "cardholder_data_secondary.csv"
  source = "../assets/cardholder_data_secondary.csv"
  tags = {
    Name                 = "cardholder-data-${var.cgid}"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "s3.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cardholder-data-secondary"
    yor_trace            = "41ee96e1-b300-43aa-a04d-346e654f8cdc"
  }
}
resource "aws_s3_bucket_object" "cardholder-data-corporate" {
  bucket = "${aws_s3_bucket.cg-cardholder-data-bucket.id}"
  key    = "cardholders_corporate.csv"
  source = "../assets/cardholders_corporate.csv"
  tags = {
    Name                 = "cardholder-data-${var.cgid}"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "s3.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "cardholder-data-corporate"
    yor_trace            = "1b88d99a-d6b0-4744-abb2-a7ea4e26edde"
  }
}
resource "aws_s3_bucket_object" "goat" {
  bucket = "${aws_s3_bucket.cg-cardholder-data-bucket.id}"
  key    = "goat.png"
  source = "../assets/goat.png"
  tags = {
    Name                 = "cardholder-data-${var.cgid}"
    Stack                = "${var.stack-name}"
    Scenario             = "${var.scenario-name}"
    git_commit           = "6068483bdcf91a6bc07ba5c1687912f4634a9dd8"
    git_file             = "s3.tf"
    git_last_modified_at = "2023-07-25 16:07:20"
    git_last_modified_by = "networkingcheems@gmail.com"
    git_modifiers        = "networkingcheems"
    git_org              = "ghouldaemon"
    git_repo             = "testing_terra"
    yor_name             = "goat"
    yor_trace            = "91abf22e-563e-4a43-9c45-863fc92d45fb"
  }
}