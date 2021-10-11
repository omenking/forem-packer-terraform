variable "subnet_id" {}

data "aws_subnet" "selected" {
  id = var.subnet_id
}


variable "rds_postgres_engine_version" {
	type = "string"
	description = "The version of Postgres Engine"
	default = "13.3"
}

variable "rds_instance_type" {
	type = "string"
	description = "The EC2 DB instance type"
	default = "t2.db.micro"
}

variable "rds_identifier" {
	type = "string"
	description = "The Database identifier"
	default = "forem"
}