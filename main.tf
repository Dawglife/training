#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-99a58be2
#
# Your security group ID is:
#
#     sg-8e08dfe6
#
# Your AMI ID is:
#
#     ami-74ee001b
#

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
	default = "eu-central-1"
	}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
	ami	= "ami-74ee001b"
	instance_type	= "t2.micro"
	count = "4"
	subnet_id = "subnet-99a58be2"
	vpc_security_group_ids = ["sg-8e08dfe6"]

	tags {
	  Identity = "hashiconf-9bf31c7ff062936a96d3c8bd1f8f2ff3"
	  Foo = "bar"
	  Zip = "zap"
	}
}
output "public_ip" {
	value = "${join(", ", aws_instance.web.*.public_ip)}"
}

output "public_dns" {
	value = "${join(", ",aws_instance.web.*.public_dns)}"
	}
