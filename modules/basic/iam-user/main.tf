resource "aws_iam_user" "this" {
  name = "user-${var.name}"
}

resource "aws_iam_policy" "this" {
  name        = "policy-${var.name}"
  description = "Policy for user-${var.name}"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = var.policy_statement
  })
}

resource "aws_iam_user_policy_attachment" "this" {
  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.this.arn
}