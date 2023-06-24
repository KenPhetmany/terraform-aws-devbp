output "AccountNumber" {
  value = aws_iam_user.gomon_iam_user.arn
  sensitive = false
}


output "Password" {
    value = aws_iam_user_login_profile.gomon_iam_login.password
    sensitive = false
}