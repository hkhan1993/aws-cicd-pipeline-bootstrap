# 1. Register GitHub as an OpenID Connect Identity Provider in AWS
resource "aws_iam_openid_connect_provider" "github" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]

  # Standard GitHub OIDC Thumbprint (AWS automatically handles validation)
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1", "1c58a21a2c81a762f5b7175e4f257b80a257f862"]
}

resource "aws_iam_role" "github_actions" {
  name               = "github-actions-cicd-pipeline-role"
  assume_role_policy = data.aws_iam_policy_document.github_oidc_trust.json
}

resource "aws_iam_role_policy_attachment" "github_actions_admin" {
  role       = aws_iam_role.github_actions.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}