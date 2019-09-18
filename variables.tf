variable "pvt_key" {}
variable "ssh_id" {}
variable "ssh_user" {}

variable "domain_name" {}
variable "project" {}
variable "customer_id" {}
variable "do_tag_env" {}
variable "do_tag_role" {}
variable "do_region" {}
variable "do_nodes" {}

variable "do_droplet_size" {
  type = map(string)
  default = {
    "small" = "512mb"
    "5usd"  = "s-1vcpu-1gb"
    "10usd" = "s-1vcpu-2gb"
    "15usd" = "s-2vcpu-2gb"
    "20usd" = "s-2vcpu-4gb"
  }
}

data "digitalocean_image" "ubuntu" {
  slug = "ubuntu-18-04-x64"
}

variable "ubuntu" {
  description = "Default LTS"
  default     = "ubuntu-18-04-x64"
}
