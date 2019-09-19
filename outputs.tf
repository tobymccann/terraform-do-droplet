output "do_droplet_public_ip" {
  value = digitalocean_droplet.do_droplet.*.ipv4_address
}

output "do_droplet_private_ip" {
  value = digitalocean_droplet.do_droplet.*.ipv4_address_private
}

output "do_droplet_id" {
  value = digitalocean_droplet.do_droplet.*.id
}

output "do_droplet_urn" {
  value = digitalocean_droplet.do_droplet.*.urn
}