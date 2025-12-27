provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "opslabx"

  lifecycle {
    prevent_destroy = false
  }

}

resource "aws_dynamodb_table" "my_dynamo_table" {
  name         = "opslabx-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}
