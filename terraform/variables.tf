variable "do_token" {
  description = "DigitalOcean Personal Access Token"
}

variable "ssh_key_path" {
  default     = "/root/.ssh/id_rsa_do.pub"
  description = "Path to the SSH public key"
}
