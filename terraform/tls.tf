resource "tls_private_key" "my_ssh_key" {
    algorithm = "RSA"
    rsa_bits = 4096 
}

resource "local_file" "private_ssh_key" {
  filename = "${path.module}/.ssh/my_ssh_key"
  content = tls_private_key.my_ssh_key.private_key_pem
  file_permission = "400"
}

resource "local_file" "public_ssh_key" {
  filename = "${path.module}/.ssh/my_ssh_key.pub"
  content = tls_private_key.my_ssh_key.public_key_pem
  file_permission = "644"
}
