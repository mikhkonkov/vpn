output "vpn_server_ip" {
  value = digitalocean_droplet.vpn_server.ipv4_address
}
