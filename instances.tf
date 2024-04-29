data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "bastion_server" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.server_type
  security_groups = [aws_security_group.allow_ssh.id]
  subnet_id       = module.network.public_subnet_id
  key_name        = aws_key_pair.public-key-aisha.key_name
  depends_on      = [local_file.private_key_file]



  provisioner "file" {
    source      = var.source_path_file
    destination = var.destination_path_file

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.source_path_file)
      host        = self.public_ip
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /home/ubuntu/.ssh/id_rsa"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.source_path_file)
      host        = self.public_ip
    }
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"
  }

  tags = {
    Name = "Bastion"
  }
}



resource "aws_instance" "private_server" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.server_type
  security_groups = [aws_security_group.allow_ssh_3000.id]
  subnet_id       = module.network.private_subnet_id
  key_name        = aws_key_pair.public-key-aisha.key_name
  depends_on      = [aws_key_pair.public-key-aisha]
  tags = {
    Name = "Private"
  }
}
