locals {
  github_username = "hkhan1993"

  # Allows ANY repository under your account on any branch, PR, or environment
  github_oidc_sub_claims = [
    "repo:${local.github_username}/*"
  ]
}