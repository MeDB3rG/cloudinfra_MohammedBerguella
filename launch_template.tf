resource "aws_launch_template" "Launch_Template-BerguellaMohammed" {

  image_id      = "ami-012ba92271e91512d"
  instance_type = "t2.micro"
  user_data = base64encode(
    <<-EOT
    #!/bin/bash
    cd /home/ubuntu/app/
    sudo docker compose up --build -d
    EOT
  )

  key_name = aws_key_pair.SSH-BerguellaMohammed.key_name

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [aws_security_group.security_group_lt-BerguellaMohammed.id, var.sg_db, aws_security_group.security_group_lb-BerguellaMohammed.id, aws_security_group.security_group_ssh-BerguellaMohammed.id]
  }

  vpc_security_group_ids = []

  tags = {
    Name = "instance-BerguellaMohammed"
  }

}

resource "aws_key_pair" "SSH-BerguellaMohammed" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjcFTNbjscNCfGxdF5le+wZ6Jp1bRVlVWsgI7aTMOwx6x+bmeKugjUXXsxXvbi2wI3hlSPZChe8YXVcdJ+cl0jyOCqAa94tOspX+fhgkcIrl+PER9b6RA62TgmQAFJgDeyKhPOJwC1+VeNqL1y3emRrv+3dBWj4fMWcztvybJ1N4PI2udY7/4o2pjSy3FxwbE4V7qrul7yhGmZ9HU7M+XoIcMxAWKBsy6bh2cHCHG8t+Dt3j0O/WKm+GD1XWjDCIcID7TXvfW6ku0Qk8oac5XjcGjRDJU3g8cGhxtQICs8Rp428lv3/hFfTcCjLJElR36xJWdyqJANgNZeCf9vJ/wcUUwqCZDlILnoO8/zUh+Pg0KTYEV3pxJda77DLWsTuodzEaO/9TNOySuwnbLitt+c8qcBglfqIHzNuwK92XBlYDj3Kc4yf9thEFZ5P+PQ9psXh8xjBHXCnsg9MzXcpi299mCrlp60y6rBefmRB1EN3waiHCGOsbrOrHYW1y8xcPc= med@BERGUELLA"
}