
resource "tls_private_key" "deploy_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "${var.global["project"]}-Key"
  public_key = "${tls_private_key.deploy_key.public_key_openssh}"
}


resource "aws_instance" "build" {
  ami           = "${var.ec2["ami"]}"
  instance_type = "${var.ec2["instance_type"]}"

  key_name      = "${aws_key_pair.generated_key.key_name}"
  tags = {
    Name = "${var.global["project"]}-BuildServer"
  }
}

resource "aws_instance" "prod" {
  ami           = "${var.ec2["ami"]}"
  instance_type = "${var.ec2["instance_type"]}"

  key_name      = "${aws_key_pair.generated_key.key_name}"
  tags = {
    Name = "${var.global["project"]}-ProdServer"
  }
}


