variable "aws_region" {
  description = "AWS region where remote backend infrastructure will be created"
  type        = string
}

variable "s3_bucket_suffix" {
  description = "Suffix used for the Terraform state bucket name"
  type        = string
  default     = "terraform-states"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name used for Terraform state locking"
  type        = string
  default     = "terraform-lock"
}
