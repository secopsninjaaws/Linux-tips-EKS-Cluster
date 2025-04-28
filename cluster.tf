resource "aws_eks_cluster" "main" {
  name     = "${var.project_name}-cluster"
  role_arn = aws_iam_role.cluster.arn
  version  = var.kubernetes_version

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }


  enabled_cluster_log_types = [
    "api", "audit", "authenticator", "controllerManager", "scheduler"
  ]


  vpc_config {
    subnet_ids = split(",", data.aws_ssm_parameter.private_subnets.value)
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster
  ]

  encryption_config {
    provider {
      key_arn = aws_kms_key.main.arn
    }
    resources = ["secrets"]
  }

  tags = {
    "kubernetes.io/cluster/${var.project_name}" = "shared"
  }

  zonal_shift_config {
    enabled = true
  }
}
