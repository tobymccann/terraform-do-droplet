variable "pvt_key" {}
variable "ssh_id" {}
variable "ssh_user" {}

variable "do_droplet_name" {}
variable "domain_name" {}
variable "project" {}
variable "customer_id" {}
variable "do_tag_env" {}
variable "do_tag_role" {}
variable "do_region" {}
variable "do_nodes" {}

variable "do_droplet_size" {
  description = "Map of Droplet sizes"
  type = map(string)
  type = "map"
  default = {}
}

data "digitalocean_image" "ubuntu" {
  slug = "ubuntu-18-04-x64"
}

variable "ubuntu" {
  description = "Default LTS"
  default     = "ubuntu-18-04-x64"
}
