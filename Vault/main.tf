provider "vault" {
  address = "https://172.31.94.86:8200"
  token = var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}

data "vault_generic_secret" "example" {
  path = "test/My_credentials"
}
#data "vault_kv_secret_v2" "example" {
#  mount = "test"
#  name  = "My_credentials"
#}

resource "local_file" "foo" {
  content = data.vault_generic_secret.example.data["password"]
  filename = "/tmp/secret"
}

#output "json" {
#  value = data.vault_kv_secret_v2.example.data_json
#}