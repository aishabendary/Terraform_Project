resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow all ssh inbound traffic"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "SSH ingress"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "SSH egress"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "allow_ssh_3000" {
  name        = "allow_ssh_3000"
  description = "Allow all ssh and port 3000"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "SSH ingress"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cidr]
  }

  ingress {
    description = "3000 ingress"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [module.network.vpc_cidr]
  }
}


resource "aws_security_group" "redis_sec_group" {
  name        = "redis_sec_group"
  description = "Allow port 6379"
  vpc_id      = module.network.vpc_id

  ingress {
    description = "6379 ingress"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "6379 ingress"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
