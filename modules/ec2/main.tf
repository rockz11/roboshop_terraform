resource "aws_security_group" "sg" {
  name  = "${var.component_name}-${var.env}.sg"
  description = "Inbound allow for ${var.component_name}"

  ingress {
	from_port        = 22
	to_port          = 22
	protocol         = "TCP"
	cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
	from_port        = var.app_port
	to_port          = var.app_port
	protocol         = "TCP"
	cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
	from_port        = 0
	to_port          = 0
	protocol         = "-1"
	cidr_blocks      = ["0.0.0.0/0"]

  }
}

resource "aws_instance" "instance" {
  # count deals with the list and for_each deals with the map.
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = ["sg-0b308c7134616a7ce"]
  tags = {
	Name = "${var.component_name}-${var.env}"
  }
}

# Output in child module wont print on screen.
# Output in root module will print on the screen as output.
