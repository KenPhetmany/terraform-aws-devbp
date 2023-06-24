
/*
    Create an EC2 instance alongside securitygroup for accesibility 
*/

resource "aws_instance" "gomon_ec2" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_id]

  tags = {
    "Name" : "${var.ec2_name}"
  }
}
