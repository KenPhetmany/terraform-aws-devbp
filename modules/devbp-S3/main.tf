resource "aws_s3_bucket" "cloudtrail_bucket" {
    bucket = var.bucket_name
}