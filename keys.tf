## RSA private key generation of size 4096 bits
resource "tls_private_key" "rsa-4096-aisha" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

## Download the file locally with the content specified
resource "local_file" "private_key_file" {
  content  = tls_private_key.rsa-4096-aisha.private_key_pem
  filename = "aisha-private-key.pem"
}

## Generate a public key for the private one
resource "aws_key_pair" "public-key-aisha" {
  key_name   = "public-key-aisha"
  public_key = tls_private_key.rsa-4096-aisha.public_key_openssh
}
