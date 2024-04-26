data "aws_caller_identity" "current" {}


locals {
 account_id = data.aws_caller_identity.current.account_id
}


output "account_id" {
 value = local.account_id
}


resource "random_id" "rando" {
 byte_length = 8
}


resource "aws_s3_bucket" "my-bucket" {
 bucket = "${local.account_id}-my-s3-bucket-${random_id.rando.hex}"


 tags = {
   Name        = "My bucket"
   Environment = "Dev"
 }
}
