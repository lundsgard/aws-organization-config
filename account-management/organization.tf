resource "aws_organizations_organization" "org" {
  aws_service_access_principals = [
    "config.amazonaws.com",
    "config-multiaccountsetup.amazonaws.com",
  ]

  enabled_policy_types = [
    "SERVICE_CONTROL_POLICY",
  ]

  feature_set = "ALL"
}

resource "aws_organizations_delegated_administrator" "config" {
  account_id        = var.security_account_id
  service_principal = "config.amazonaws.com"
}

resource "aws_organizations_delegated_administrator" "config-multiaccountsetup" {
  account_id        = var.security_account_id
  service_principal = "config-multiaccountsetup.amazonaws.com"
}