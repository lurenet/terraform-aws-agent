resource "local_file" "key_pem" {
  filename = "/root/export/aws-private.pem"
  content = "${tls_private_key.deploy_key.private_key_pem}"
  file_permission = "0600"
}

resource "local_file" "hosts" {
  filename = "/root/export/hosts"
  content = "[local]\nlocalhost\n\n[build]\n${aws_instance.build.public_ip}\n\n[prod]\n${aws_instance.prod.public_ip}\n"
  file_permission = "0644"
}
