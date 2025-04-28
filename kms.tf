resource "aws_kms_key" "main" {
  description = "${var.project_name}-key"
}

resource "aws_kms_alias" "aws_kms_alias" {
  name          = "alias/${var.project_name}-kms-key"
  target_key_id = aws_kms_key.main.id
}