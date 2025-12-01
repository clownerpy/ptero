#!/bin/bash
# Simple Pterodactyl Wings Installer
# Tested on Ubuntu 22.04 / Debian 12

GREEN="\e[92m"
CYAN="\e[96m"
RESET="\e[0m"

echo -e "${GREEN}=== PTERODACTYL WINGS INSTALLER ===${RESET}"
echo -e "${CYAN}Updating system packages...${RESET}"
sudo apt update -y && sudo apt upgrade -y

echo -e "${CYAN}Installing required dependencies...${RESET}"
sudo apt install -y curl tar wget sudo software-properties-common

echo -e "${CYAN}Installing Docker...${RESET}"
sudo apt install -y docker.io
sudo systemctl enable --now docker

echo -e "${CYAN}Downloading Pterodactyl Wings...${RESET}"
cd /usr/local/bin
sudo curl -L -o wings.tar.gz https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64.tar.gz
sudo tar -xzvf wings.tar.gz
sudo chmod +x wings
rm wings.tar.gz

echo -e "${CYAN}Setting up Wings as a systemd service...${RESET}"
sudo bash -c 'cat > /etc/systemd/system/wings.service <<EOL
[Unit]
Description=Pterodactyl Wings Daemon
After=docker.service
Requires=docker.service

[Service]
User=root
WorkingDirectory=/etc/pterodactyl
ExecStart=/usr/local/bin/wings
Restart=on-failure
StartLimitInterval=600
StartLimitBurst=3

[Install]
WantedBy=multi-user.target
EOL'

sudo systemctl daemon-reload
sudo systemctl enable --now wings

echo -e "${GREEN}Wings installation complete!${RESET}"
echo "You can now configure Wings using the Pterodactyl Panel."
