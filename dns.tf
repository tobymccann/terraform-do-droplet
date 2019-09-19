# Create a new domain record
resource "digitalocean_domain" "default" {
  name       = var.domain_name
}

resource "digitalocean_record" "do-droplet-dns-a" {
  count  = var.do_nodes
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = "${element(digitalocean_droplet.do_droplet.*.name, count.index)}"
  value  = "${element(digitalocean_droplet.do_droplet.*.ipv4_address, count.index)}"
}