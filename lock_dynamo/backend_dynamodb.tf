# ------------------------------------------------------------------------------
# CREATE THE DYNAMODB TABLE
# ------------------------------------------------------------------------------
resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }

  tags = {
    Name          = var.name
    Environment   = var.environment
    Role          = "TF"
    OwningCluster = "Terraform"
    ContactEmail  = "wheelq@gmail.com"
    TFRepo        = "https://github..."
  }
}