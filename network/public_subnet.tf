resource "aws_subnet" "public_subnet_aisha" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  map_public_ip_on_launch = true 
  cidr_block              = var.public_subnet_cidr
  availability_zone = "${var.region_name}a"
  
  tags = {
    Name = "Public Subnet"
  }
}