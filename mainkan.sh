#!/bin/bash

# Update package list
sudo apt update

# Install Git
sudo apt install git -y

# Install Node.js and npm
sudo apt install nodejs -y
sudo apt install npm -y
npm install -g npm@10.2.0

# Install Docker
sudo apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Configure npm global packages
mkdir -p ~/global-node-packages
npm config set prefix ~/global-node-packages
echo 'export PATH="${HOME}/global-node-packages/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Install @subsquid/cli
npm install --global @subsquid/cli@latest

# Minta input nama proyek dari pengguna
echo -n "Masukkan Nama Folder Task Proc: "
read project_name

# Minta input URL GitHub dari pengguna
echo -n "Masukkan URL GitHub Task Proc: "
read github_url

# Inisialisasi Squid dengan nama proyek dan URL GitHub yang dimasukkan oleh pengguna
sqd init "$project_name" -t "$github_url"

# Pindah ke direktori proyek yang baru dibuat
cd "$project_name"
