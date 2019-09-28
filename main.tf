resource "digitalocean_droplet" "do_droplet" {
  count              = var.do_nodes
  image              = data.digitalocean_image.ubuntu.image
  name               = var.do_droplet_name
  region             = var.do_region 
  size               = var.do_droplet_size
  ssh_keys           = [var.ssh_id]
  private_networking = true
  backups            = true
  ipv6               = true
  tags               = [var.do_tag_role, var.do_tag_env]
  lifecycle {
    create_before_destroy = true
  }
  connection {
    type        = "ssh"
    private_key = file(var.pvt_key)
    host        = self.ipv4_address
    user        = var.ssh_user
    agent       = true
    timeout     = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo apt-get -y install mosh tmux golang-go",
      "sudo adduser --disabled-password --gecos '' ${var.do_admin_user}",
      "sudo mkdir -p /home/${var.do_admin_user}/.ssh",
   ]
  }
  provisioner "file" {
    source      = var.do_admin_pub_key
    destination = "/home/${var.do_admin_user}/.ssh/authorized_keys"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chown -R ${var.do_admin_user}:${var.do_admin_user} /home/${var.do_admin_user}/.ssh",
      "sudo chmod 700 /home/${var.do_admin_user}/.ssh",
      "sudo chmod 600 /home/${var.do_admin_user}/.ssh/authorized_keys",
      "sudo usermod -aG sudo ${var.do_admin_user}"
   ]
  }
}