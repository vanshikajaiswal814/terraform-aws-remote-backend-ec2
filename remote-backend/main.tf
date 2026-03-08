provider "aws" {
  region = var.aws_region
}

# Get the current AWS account ID
data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

# Create S3 bucket for storing terraform state files
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${local.account_id}-${var.s3_bucket_suffix}"

  tags = {
    Name = "Terraform Remote State"
}
}

# Enable S3 versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Create DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
}
  tags = {
    Name = "Terraform State Lock Table"
}
}
