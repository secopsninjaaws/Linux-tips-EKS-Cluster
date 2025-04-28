data "aws_ssm_parameter" "pods_subnets" {
  name = "/eks-vpc/subnets/pod"
}

data "aws_ssm_parameter" "public_subnets" {
  name = "/eks-vpc/subnets/public"
}

data "aws_ssm_parameter" "private_subnets" {
  name = "/eks-vpc/subnets/private"
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/eks-vpc/vpc/id"
}