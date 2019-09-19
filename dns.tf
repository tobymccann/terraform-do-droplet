resource "digitalocean_record" "do-droplet-dns-a" {
  count  = var.do_nodes
  domain = var.domain_name
  type   = "A"
  name   = "${element(digitalocean_droplet.do_droplet.*.name, count.index)}"
  value  = "${element(digitalocean_droplet.do_droplet.*.ipv4_address, count.index)}"
}