resource "aws_iam_group" "gomon_iam_group" {
    name = var.iam_group
}

resource "aws_iam_policy" "gomon_iam_policy" {
  name = var.iam_policy
  policy = file(var.iam_policy_file)
}

resource "aws_iam_group_policy_attachment" "gomon_iam_policy_attachment" {
    group = aws_iam_group.gomon_iam_group.name
    policy_arn = aws_iam_policy.gomon_iam_policy.arn
  
}

