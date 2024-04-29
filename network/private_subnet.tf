resource "aws_subnet" "private_subnet_aisha" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "${var.region_name}a"

  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_subnet" "private_subnet_aisha2" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.private_subnet_cidr_2
  availability_zone = "${var.region_name}b"

  tags = {
    Name = "Private Subnet 2"
  }
}