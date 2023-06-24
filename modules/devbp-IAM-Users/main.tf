resource "aws_iam_user" "gomon_iam_user" {
  name = var.iam_user
  tags = {
    Descripion = var.iam_user_description
  }
}


resource "aws_iam_group_membership" "team" {
    name = "Group membership"
    users = [ aws_iam_user.gomon_iam_user.name ]
    group = var.iam_group_name
  
}

resource "aws_iam_user_login_profile" "gomon_iam_login" {
    user = aws_iam_user.gomon_iam_user.name
    password_length = 8
    password_reset_required = true
}

