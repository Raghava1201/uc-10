resource "aws_instance" "focalboard" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.focalboard_sg.id]

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    curl -fsSL https://get.docker.com -o install-docker.sh
    sh install-docker.sh
    usermod -aG docker ubuntu
    docker run -d -p 80:8000 mattermost/focalboard:latest
  EOF

  tags = {
    Name = "focalboard"
  }
}

resource "aws_security_group" "focalboard_sg" {
  name        = "focalboard_sg"
  description = "Allow HTTP and SSH"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
