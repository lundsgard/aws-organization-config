locals {
  # https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html
  rules = [
    # "DB_INSTANCE_BACKUP_ENABLED",
    "CLOUD_TRAIL_ENABLED",
    "ROOT_ACCOUNT_MFA_ENABLED",
    # "VPC_SG_OPEN_ONLY_TO_AUTHORIZED_PORTS",
    # "CLOUD_TRAIL_LOG_FILE_VALIDATION_ENABLED",
    # "RDS_INSTANCE_DELETION_PROTECTION_ENABLED",
    # "S3_BUCKET_PUBLIC_WRITE_PROHIBITED",
  ]
}

resource "aws_config_organization_managed_rule" "eu-west-1" {
  for_each = toset(local.rules)

  provider        = aws.eu-west-1
  name            = lower(each.value)
  rule_identifier = each.value

  excluded_accounts = [var.management_account_id]
}

# resource "aws_config_organization_managed_rule" "us-east-1" {
#   for_each = toset(local.rules)

#   provider        = aws.us-east-1
#   name            = lower(each.value)
#   rule_identifier = each.value

#   excluded_accounts = [var.management_account_id]
# }
