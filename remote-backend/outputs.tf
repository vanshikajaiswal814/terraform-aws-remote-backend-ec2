# let's expose the created resources so we can refer them later
output "s3_bucket_name" {
  description = "Name of the S3 bucket storing Terraform state"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket"
}

output "s3_bucket_region" {
  value       = aws_s3_bucket.terraform_state.region
  description = "The REGION of the S3 bucket"
}

output "dynamodb_table_name" {
  description = "DynamoDB table name used for state locking"
  value       = aws_dynamodb_table.terraform_lock.name
}

