resource "aws_eks_addon" "vpc_cni" {
  cluster_name  = aws_eks_cluster.main.name
  addon_name    = "vpc-cni"
  addon_version = "v1.19.0-eksbuild.1"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [aws_eks_access_entry.main]
}

resource "aws_eks_addon" "kube-proxy" {
  cluster_name  = aws_eks_cluster.main.name
  addon_name    = "kube-proxy"
  addon_version = "v1.31.2-eksbuild.3"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [aws_eks_access_entry.main]
}

resource "aws_eks_addon" "coredns" {
  cluster_name  = aws_eks_cluster.main.name
  addon_name    = "coredns"
  addon_version = "v1.11.4-eksbuild.2"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [aws_eks_access_entry.main]
}

resource "aws_eks_addon" "metrics-server" {
  cluster_name  = aws_eks_cluster.main.name
  addon_name    = "metrics-server"
  addon_version = "v0.7.2-eksbuild.3"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [aws_eks_access_entry.main]
}

resource "aws_eks_addon" "kube-state-metrics" {
  cluster_name  = aws_eks_cluster.main.name
  addon_name    = "kube-state-metrics"
  addon_version = "v2.15.0-eksbuild.3"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [aws_eks_access_entry.main]
}

resource "aws_eks_addon" "cert-manager" {
  cluster_name  = aws_eks_cluster.main.name
  addon_name    = "cert-manager"
  addon_version = "v1.17.1-eksbuild.2"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [aws_eks_access_entry.main]
}

resource "aws_eks_addon" "ebs" {
  cluster_name  = aws_eks_cluster.main.name
  addon_name    = "aws-ebs-csi-driver"
  addon_version = "v1.42.0-eksbuild.1"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [aws_eks_access_entry.main]
}

resource "aws_eks_addon" "eks-pod-identity-agent" {
  cluster_name  = aws_eks_cluster.main.name
  addon_name    = "eks-pod-identity-agent"
  addon_version = "v1.3.4-eksbuild.1"

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "OVERWRITE"

  depends_on = [aws_eks_access_entry.main]
}

