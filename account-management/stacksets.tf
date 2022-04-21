resource "aws_cloudformation_stack_set" "config_recorder" {
  name             = "management-stackset-config-recorder"
  permission_model = "SERVICE_MANAGED"
  auto_deployment {
    enabled                          = true
    retain_stacks_on_account_removal = false
  }

  parameters = {
    DeliveryChannelS3Bucket = var.config_delivery_channel_s3_bucket
  }

  template_body = file("cloudformation/config-recorder.yml")
}

resource "aws_cloudformation_stack_set_instance" "config_recorder_instances" {
  deployment_targets {
    organizational_unit_ids = var.organizational_units
  }

  region         = var.region
  stack_set_name = aws_cloudformation_stack_set.config_recorder.name
}
