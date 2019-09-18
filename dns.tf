# 
resource "digitalocean_record" "do-droplet-dns-a" {
  count  = var.do_nodes
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = digitalocean_droplet.do_droplet.name
  value  = digitalocean_droplet.do_droplet.ipv4_address
}