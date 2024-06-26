resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "subnet_group_1"
  subnet_ids = [module.network.private_subnet_id, module.network.private_subnet_id_2]

  tags = {
    Name = "My subnet group"
  }
}

resource "aws_db_instance" "my_rds" {
  allocated_storage                   = 10
  storage_type                        = "gp2"
  engine                              = "mysql"
  engine_version                      = "5.7"
  instance_class                      = "db.t3.micro"
  identifier                          = "mydb"
  username                            = "master"
  password                            = random_password.password.result
  iam_database_authentication_enabled = true

  vpc_security_group_ids = [aws_security_group.allow_ssh_3000.id]

  db_subnet_group_name = aws_db_subnet_group.subnet_group.name

  skip_final_snapshot = true
}