resource "aws_s3_bucket" "gomon_dev_codepipeline_s3" {
  bucket = var.cp_s3_name
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.gomon_dev_codepipeline_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "gomon_dev_codepipeline_s3_acl" {
  bucket     = aws_s3_bucket.gomon_dev_codepipeline_s3.id
  acl        = "private"
  depends_on = [aws_s3_bucket_ownership_controls.example]
}

resource "aws_codepipeline" "gomon_dev_codepipeline" {
  name     = var.cp_name
  role_arn = var.cp_role_arn

  artifact_store {
    location = aws_s3_bucket.gomon_dev_codepipeline_s3.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = var.source_name
      category         = var.source_category
      owner            = var.source_owner
      provider         = var.source_provider
      output_artifacts = ["${var.source_output_artifact}"]
      version          = var.source_version

      configuration = {
        RepositoryName       = var.source_config_repo
        BranchName           = var.source_config_branch_name
        PollForSourceChanges = true
      }

    }
  }
    stage {
    name = "Build"

    action {
      name             = var.build_name
      category         = var.build_category
      owner            = var.build_owner
      provider         = var.build_provider
      input_artifacts  = ["${var.source_output_artifact}"]
      output_artifacts = ["${var.build_output_artifact}"]
      version          = var.build_version

      configuration = {
        ProjectName = var.build_config_project_name
      }
    }
  }




  stage {
    name = "Deploy"

    action {
      name            = var.deploy_name
      category        = var.deploy_category
      owner           = var.deploy_owner
      provider        = var.deploy_provider
      input_artifacts = ["${var.build_output_artifact}"]
      version         = var.deploy_version

      configuration = {
        ApplicationName     = var.deploy_config_cd_name
        DeploymentGroupName = var.deploy_config_cd_dg_name
      }
    }
  }


}

