resource "tls_private_key" "keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key" {
  depends_on = [tls_private_key.keypair]
  key_name   = var.key_name
  public_key = tls_private_key.keypair.public_key_openssh

}

resource "local_file" "keyfile" {
  depends_on = [aws_key_pair.key]
  content    = tls_private_key.keypair.private_key_pem
  filename   = "Keys/${var.key_name}.pem"
  provisioner "local-exec" {
    command = "chmod 400 ${var.path}/${var.key_name}.pem"
  }
}