resource "aws_eks_node_group" "spot" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project_name}-node-group-spot"
  node_role_arn   = aws_iam_role.nodes.arn
  instance_types  = var.node_instance_sizes
  subnet_ids      = split(",", data.aws_ssm_parameter.pods_subnets.value)
  scaling_config {
    desired_size = lookup(var.auto_scaling, "desired")
    max_size     = lookup(var.auto_scaling, "max")
    min_size     = lookup(var.auto_scaling, "min")
  }
  capacity_type = "SPOT"

  labels = {
    "capacity/os"   = "AMAZON_LINUX"
    "capacity/arch" = "x86_64"
    "capacity/type" = "SPOT"
  }

  tags = {
    "kubernetes.io/cluster/${var.project_name}" = "owned"
  }

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }



  depends_on = [aws_eks_access_entry.main, aws_iam_role_policy_attachment.cloudwatch-nodes, aws_iam_role_policy_attachment.cni-nodes, aws_iam_role_policy_attachment.worker-nodes]
}