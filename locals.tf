locals {

github_username = "hkhan1993"
allowed_repos = [
    "aws-cicd-pipeline-bootstrap:*",
    "repo:${local.github_username}/*"
  ]

github_oidc_sub_claims = [
    for repo in local.allowed_repos : "repo:${local.github_username}/${repo}"
  ]

}