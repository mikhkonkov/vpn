# 🌐 VPN Setup Project

This repository provides a simple guide to set up a secure VPN server using Docker, Terraform, and DigitalOcean. Follow the steps below to automate the deployment and get your VPN running in no time.

---

## 📋 Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Setup Instructions](#setup-instructions)
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)

---

## 📖 Overview

This project automates the deployment of an OpenVPN server on a DigitalOcean droplet using Terraform for infrastructure provisioning and Docker for containerized services. Once deployed, you can securely connect to your VPN using the generated client configuration file.

---

## ✅ Prerequisites

Before you begin, make sure you have the following installed on your local machine:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- A [DigitalOcean](https://www.digitalocean.com/) account with an API token

---

## 🛠️ Setup Instructions

Follow these steps to set up your VPN server:

1. **Generate an SSH key** (if you don't already have one):

```bash
ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa_do
```

2. **Copy the example environment file** and add your DigitalOcean API token:

```bash
cp example.env .env
```

Edit the `.env` file and replace `<DO_TOKEN>` with your actual DigitalOcean API token.

3. **Build the Docker image**:

```bash
docker-compose build
```

4. **Run the infrastructure container**:

```bash
docker-compose run --rm infra sh
```

5. **Initialize Terraform**:

```bash
terraform init
```

6. **Apply the Terraform configuration** to provision resources:

```bash
terraform apply
```

Confirm the changes when prompted.

7. **Retrieve the VPN server's IP address**:

```bash
terraform output vpn_server_ip
```

8. **Wait for a few minutes** to allow the server to fully initialize.

9. **Download the client configuration file**:

```bash
scp -i ~/.ssh/id_rsa_do root@<vpn_server_ip>:/root/client.ovpn ~/Downloads/client.ovpn
```

Replace `<vpn_server_ip>` with the IP address retrieved in step 7.

---

## 🚀 Usage

1. Import the downloaded `client.ovpn` file into your preferred OpenVPN client application (e.g., [OpenVPN Connect](https://openvpn.net/client-connect-vpn-for-windows/)).
2. Connect to your VPN using the imported configuration.
3. Enjoy secure internet access!

---

## 🤝 Contributing

We welcome contributions! To contribute:

1. Fork this repository.
2. Create a new branch for your feature or bug fix:
`git checkout -b feature-name`
3. Commit your changes:
`git commit -m "Add feature description"`
4. Push your branch:
`git push origin feature-name`
5. Open a pull request.

---

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

⭐ If you find this project helpful, please consider giving it a star!