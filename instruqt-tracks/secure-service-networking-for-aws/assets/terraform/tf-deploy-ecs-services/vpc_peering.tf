locals {
  vpc_region            = "us-west-2"
  hvn                   = data.terraform_remote_state.hcp.outputs.hcp_hvn
  vpc_id                = data.terraform_remote_state.hcp.outputs.aws_vpc_ecs_id
  vpc_cidr_block        = data.terraform_remote_state.hcp.outputs.ecs_vpc_cidr_block
  private_route_table_ids = data.terraform_remote_state.hcp.outputs.ecs_private_route_table_ids
  private_subnets        = data.terraform_remote_state.hcp.outputs.ecs_private_subnets
  public_route_table_ids = data.terraform_remote_state.hcp.outputs.ecs_public_route_table_ids
  public_subnets        = data.terraform_remote_state.hcp.outputs.ecs_public_subnets
}

module "aws_hcp_consul" {
  source  = "hashicorp/hcp-consul/aws"
  version = "~> 0.6.1"

  hvn                = local.hvn
  vpc_id             = local.vpc_id
  subnet_ids = concat(
    local.private_subnets,
    local.public_subnets,
  )
  route_table_ids = concat(
    local.private_route_table_ids,
    local.public_route_table_ids,
  )
#  security_group_ids = [data.aws_security_group.vpc_default.id]
}

