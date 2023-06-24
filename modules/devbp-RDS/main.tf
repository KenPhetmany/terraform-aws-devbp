resource "aws_security_group" "db_sg" {
  name = var.db_sg_name
  vpc_id = var.vpc_id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
   // cidr_blocks = ["0.0.0.0/0"]
    /* Use this code to establish a secure conenction from app sgs to this db */

     security_groups = [var.security_groups]

  }
}

resource "aws_db_subnet_group" "db_subnets" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

}



resource "aws_db_instance" "db" {
  // Db engine to use 
  engine = var.engine
  // Name of the instance 
  identifier = var.identifier
  // Name of the db
  db_name = var.db_name
  // Allocate available storage in gibibytes
  allocated_storage = var.allocated_storage
  // Instance type of the RDS
  instance_class = var.instance_class
  // Set list of VPC security groups to associate with
  vpc_security_group_ids =[ aws_security_group.db_sg.id]
  // Set Subnet name to associate with
  db_subnet_group_name = aws_db_subnet_group.db_subnets.name
  // Set username for db 
  username = var.username
  // Set password for db
  password = var.password
  // Set whether db is public or private
  publicly_accessible = var.publicly_accessible
}


