resource "aws_codedeploy_app" "gomon_codedeploy" {
  name = var.cd_name
}

resource "aws_codedeploy_deployment_group" "gomon_codedeploy_deployment_group" {
  app_name              = aws_codedeploy_app.gomon_codedeploy.name
  deployment_group_name = var.cd_dg_name
  service_role_arn      = var.iam_arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = var.ec2_target
    }
  }

}
