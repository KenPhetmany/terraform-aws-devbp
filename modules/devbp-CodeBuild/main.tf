
resource "aws_codebuild_project" "gomon_dev_codebuild" {
  name         = var.cb_name
  service_role = var.iam_role_arn
  source_version = var.source_version

  source {
    type = var.source_type
    location = var.source_location
  }

  environment {
    compute_type = var.env_compute_type
    image = var.env_image
    type = var.env_type
  }

  artifacts {
    type = var.artifact_type
  }

    logs_config {
    cloudwatch_logs {
      group_name  = var.cw_group_name
      stream_name = var.cw_stream_name
    }
  }

}