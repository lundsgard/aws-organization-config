import boto3

client = boto3.client('config')
organization_aggregator_name = 'OrganizationAggregator'

# resource_counts = client.get_discovered_resource_counts()
# comp = client.describe_compliance_by_config_rule()

paginator = client.get_paginator('describe_aggregate_compliance_by_config_rules')
response_iterator = paginator.paginate(ConfigurationAggregatorName=organization_aggregator_name)
# comps = client.describe_aggregate_compliance_by_config_rules(ConfigurationAggregatorName=organization_aggregator_name)

for iterator in response_iterator:
    for comp in iterator['AggregateComplianceByConfigRules']:
        config_rule_name = comp['ConfigRuleName']
        compliance = comp['Compliance']['ComplianceType']
        account_id = comp['AccountId']
        region = comp['AwsRegion']
        print(f'{account_id} ({region}): {compliance} - {config_rule_name}')

print('DONE')
