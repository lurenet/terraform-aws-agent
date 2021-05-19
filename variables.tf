#region: eu-central-1
#instance_type: t2.small
#ami: ami-0767046d1677be5a0  # Ubuntu 20.04 LTS
#subnet_id: subnet-0e325064 # zone-a
#project_name: dve13
#app_code_user: "ubuntu" # remote user
#hoststring: "ansible_ssh_user=ubuntu ansible_ssh_private_key_file=aws-private.pem ansible_ssh_extra_args='-o StrictHostKeyChecking=no'"
#hostpath: "hosts"


variable "global" {
  type    = map
  default = {
    "project" = "DevOps-Sertification"
    "region"  = "eu-central-1"
    "zone"  = "a"
  }
}

variable "ec2" {
  type    = map
  default = {
    "ami"           = "ami-0767046d1677be5a0"  # Ubuntu 20.04 LTS
    "instance_type" = "t2.medium"
    "subnet_id"     = "subnet-0e325064" # zone-a
  }
}


#variable "artifact" {
#  type    = map
#  default = {
#    "name"    = "boxfuse"
#    "version" = "latest"
#    "project_url"  = "https://github.com/lurenet/dve-14-terraform_vs_gcp.git"
#    "project_name" = "dve-14-terraform_vs_gcp"
#  }
#}
