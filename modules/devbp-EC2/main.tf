
/*
    Create an EC2 instanc
*/
data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"]
}



resource "aws_instance" "gomon_ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  iam_instance_profile   = var.iam_instance_profile

  tags = {
    "Name" : "${var.ec2_name}"
  }
}
