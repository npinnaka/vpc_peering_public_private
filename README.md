<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.70 |
| <a name="requirement_local"></a> [local](#requirement\_local) | 2.1.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.70.0 |
| <a name="provider_aws.secondary"></a> [aws.secondary](#provider\_aws.secondary) | 3.70.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.1.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_accepter"></a> [accepter](#module\_accepter) | ./accepter_vpc_config | n/a |
| <a name="module_requester"></a> [requester](#module\_requester) | ./requester_vpc_config | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_key_pair.key_pair_secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_vpc.vpc_accept](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc.vpc_request](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_peering_connection.vpc_peering_connection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection_accepter.vpc_peering_connection_accepter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |
| [local_file.key](https://registry.terraform.io/providers/hashicorp/local/2.1.0/docs/resources/file) | resource |
| [tls_private_key.private_key](https://registry.terraform.io/providers/hashicorp/tls/3.1.0/docs/resources/private_key) | resource |
| [aws_caller_identity.whoami_secondary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | key name for ec2 kp | `string` | `"narenkp"` | no |
| <a name="input_primary_region"></a> [primary\_region](#input\_primary\_region) | AWS region for provider | `string` | `"us-east-1"` | no |
| <a name="input_secondary_region"></a> [secondary\_region](#input\_secondary\_region) | AWS region for provider | `string` | `"us-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_r1_public_ip"></a> [r1\_public\_ip](#output\_r1\_public\_ip) | n/a |
| <a name="output_r1_vpc_id"></a> [r1\_vpc\_id](#output\_r1\_vpc\_id) | n/a |
| <a name="output_r2_private_ip"></a> [r2\_private\_ip](#output\_r2\_private\_ip) | n/a |
| <a name="output_r2_vpc_id"></a> [r2\_vpc\_id](#output\_r2\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->