resource "aws_security_group" "security_group_lb-BerguellaMohammed" {
  name   = "SG-LB"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "ingress-LB-BerguellaMohammed" {
  security_group_id = aws_security_group.security_group_lb-BerguellaMohammed.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "egress-LB-BerguellaMohammed" {
  security_group_id            = aws_security_group.security_group_lb-BerguellaMohammed.id
  referenced_security_group_id = aws_security_group.security_group_lt-BerguellaMohammed.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

resource "aws_security_group" "security_group_ssh-BerguellaMohammed" {
  name   = "SG-SSH"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "ingress-SSH-BerguellaMohammed" {
  security_group_id = aws_security_group.security_group_ssh-BerguellaMohammed.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_security_group" "security_group_lt-BerguellaMohammed" {
  name   = "SG-LT"
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "ingress-LT-BerguellaMohammed" {
  security_group_id            = aws_security_group.security_group_lt-BerguellaMohammed.id
  referenced_security_group_id = aws_security_group.security_group_lb-BerguellaMohammed.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
}

resource "aws_vpc_security_group_ingress_rule" "ingress-LT-SSH-BerguellaMohammed" {
  security_group_id = aws_security_group.security_group_lt-BerguellaMohammed.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "egress-LT-BerguellaMohammed" {
  security_group_id = aws_security_group.security_group_lt-BerguellaMohammed.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}