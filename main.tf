module "tomcat" {
source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  name = var.name_input

  ami                    = var.my_ami
  instance_type          = "t2.micro"
  key_name               = var.key

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "Hannah_security" {
  name        = "Hannah_security"
  description = "security group using terraform"

ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Hannah_security"
  }
}  
