resource "aws_iam_role" "pod_identity" {
  name = "${var.project_name}-pod-identity-rule"
  assume_role_policy = jsonencode({
    Statement = [{
      Sid    = "AllowEksAuthToAssumeRoleForPodIdentity"
      Effect = "Allow"
      Principal = {
        Service = "pods.eks.amazonaws.com"
      },
      Action : [
        "sts:AssumeRole",
        "sts:TagSession"
      ]
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_policy" "pod_identity" {
  name = "${var.project_name}-pod-identity-policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "pod_identity" {
  name       = "${var.project_name}-pod-identity-policy"
  roles      = [aws_iam_role.pod_identity.name]
  policy_arn = aws_iam_policy.pod_identity.arn
}

resource "aws_eks_pod_identity_association" "pod_identity" {
  cluster_name    = aws_eks_cluster.main.name
  namespace       = "default"
  service_account = "service-account-pod-s3"
  role_arn        = aws_iam_role.pod_identity.arn
}