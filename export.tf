resource "local_file" "key_pem" {
  filename = "/root/export/aws-private.pem"
  content = "${tls_private_key.deploy_key.private_key_pem}"
  file_permission = "0600"
}

resource "local_file" "hosts" {
  filename = "/root/export/hosts"
  content = "[build]\n${aws_instance.build.public_ip} ${var.export["host_options"]}\n\n[prod]\n${aws_instance.prod.public_ip} ${var.export["host_options"]}\n"
  file_permission = "0644"
}

resource "local_file" "prod" {
  filename = "/root/export/prod"
  content = "${aws_instance.prod.public_ip}"
  file_permission = "0644"
}

