output "cd_name" { value = aws_codedeploy_app.gomon_codedeploy.name}
output "cd_dg_name" { value = aws_codedeploy_deployment_group.gomon_codedeploy_deployment_group.deployment_group_name }