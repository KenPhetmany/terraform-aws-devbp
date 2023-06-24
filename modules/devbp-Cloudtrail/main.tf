data "aws_caller_identity" "current" {}
resource "aws_s3_bucket_policy" "s3_cloudtrail_policy" {
  bucket = var.s3_bucket_id
  policy = var.iam_role_policy
}
resource "aws_cloudtrail" "gomon_cloudtrail" {
  name           = var.cloudtrail_name
  s3_bucket_name = var.s3_bucket_id
  s3_key_prefix = var.s3_key_prefix
  advanced_event_selector {
    name = "Log codedeploy actions"
    field_selector {
      field  = "eventCategory"
      equals = ["Data"]
    }

    field_selector {
      field  = "resources.type"
      equals = ["AWS::S3::Object"]
    }

        field_selector {
      field  = "eventName"
      equals = ["CreateDeploymentGroup"]
    }


  }
  depends_on = [aws_s3_bucket_policy.s3_cloudtrail_policy]

}

