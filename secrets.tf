resource "aws_secretsmanager_secret" "devops_secret" {
  name                    = "devops_secret"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "version_devops_secret" {
  secret_id     = aws_secretsmanager_secret.devops_secret.id
  secret_string = tls_private_key.devops-key.private_key_pem
}
