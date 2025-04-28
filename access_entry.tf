resource "aws_eks_access_entry" "main" {
  cluster_name  = aws_eks_cluster.main.id
  principal_arn = aws_iam_role.nodes.arn
  type          = "EC2_LINUX"

  depends_on = [aws_eks_cluster.main]
}