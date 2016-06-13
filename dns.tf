#
# DO NOT DELETE THESE LINES!
#
# Your DNSimple email is:
#
#     sethvargo+terraform@gmail.com
#
# Your DNSimple token is:
#
#     1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf
#
# Your Identity is:
#
#     hashiconf-9bf31c7ff062936a96d3c8bd1f8f2ff3
#
# Configure the DNSimple provider
variable "dnsimple_token" {}
variable "dnsimple_email" {}


provider "dnsimple" {
    token = "${var.dnsimple_token}"
    email = "${var.dnsimple_email}"
}

# Create a record
resource "dnsimple_record" "example" {
    domain = "terraform.rocks"
    type = "A"
    name = "jerry-caupain"
    value = "${aws_instance.web.0.public_ip}"
} 

