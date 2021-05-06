resource "aws_key_pair" "my_key_pair" {
  key_name   = "gaelAlixKey"
  public_key = tls_private_key.my_ssh_key.public_key_openssh
}

resource "aws_instance" "server_1" {
  ami           = data.aws_ami.ubuntu_bionic.id
  instance_type = data.aws_ec2_instance_type_offering.t2_nano.id
  key_name      = aws_key_pair.my_key_pair.key_name

  tags = {
    Name  = "Server-1 Gael & Alix"
  }
}

resource "aws_instance" "server_2" {
  ami           = data.aws_ami.ubuntu_bionic.id
  instance_type = data.aws_ec2_instance_type_offering.t2_nano.id
  key_name      = aws_key_pair.my_key_pair.key_name

  tags = {
    Name  = "Server-2 Gael & Alix"
  }
}

# sert à prouver notre identité, nous on a la clé privée, amazon a la clé publique, utilise le protocle SSH
# ec2 = elastic cloud computing
