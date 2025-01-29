provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "vpn_server" {
  name   = "vpn-server"
  region = "ams3"
  size   = "s-1vcpu-1gb" # (Shared CPU, $4/month)
  image  = "ubuntu-22-04-x64"

  ssh_keys = [digitalocean_ssh_key.key.id]

  user_data = <<-EOT
    #!/bin/bash
    apt-get update && apt-get upgrade -y
    wget -O openvpn.sh https://get.vpnsetup.net/ovpn && sudo bash openvpn.sh --auto
  EOT

  tags = ["vpn"]
}

resource "digitalocean_ssh_key" "key" {
  name       = "terraform-key"
  public_key = file("/root/.ssh/id_rsa_do.pub")
}

