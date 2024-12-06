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
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
	Name = "${var.component_name}-${var.env}"
    target = "catalogue-dev"
  }
  provisioner "local-exec" {
	command = <<EOL
cd/home/ec2-user/roboshop-ansible
ansible-playbook -i ${self.private}, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e app_name=${var.component_name} -e env=${var.env} roboshop.yml
  }
}



