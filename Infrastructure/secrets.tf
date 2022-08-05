resource "aws_secretsmanager_secret" "secret_abs" {
  name                    = "secret_abs"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "version" {
  secret_id     = aws_secretsmanager_secret.secret_abs.id
  secret_string = tls_private_key.my_key.private_key_pem
}

output "instance_id" {
  value = aws_instance.application.id
}

output "secretsmanager_secret" {
  value = aws_secretsmanager_secret.secret_abs.id
}

output "secretsmanager_secret_version" {
  value = aws_secretsmanager_secret_version.version.id
}