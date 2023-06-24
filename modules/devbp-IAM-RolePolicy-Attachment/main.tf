resource "aws_iam_role" "iam_role" {
    name = var.iam_role_name
    assume_role_policy = var.assume_role_policy
}

resource "aws_iam_instance_profile" "test_profile" {
  name = var.iam_role_name
  role = "${aws_iam_role.iam_role.name}"
}

resource "aws_iam_role_policy" "iam_role_policy" {
    role = aws_iam_role.iam_role.id
    name = var.role_policy_name
    policy = var.role_policy
  
}