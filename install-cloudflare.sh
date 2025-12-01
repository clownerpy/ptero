#!/bin/bash
# Simple Cloudflare Installer / Setup Script

GREEN="\e[92m"
CYAN="\e[96m"
RESET="\e[0m"

echo -e "${GREEN}=== CLOUDflare INSTALLER ===${RESET}"

# Update system
echo -e "${CYAN}Updating system packages...${RESET}"
sudo apt update -y && sudo apt upgrade -y

# Install dependencies
echo -e "${CYAN}Installing required packages...${RESET}"
sudo apt install -y curl unzip wget sudo

# Install Cloudflare CLI (cloudflared)
echo -e "${CYAN}Installing Cloudflare CLI (cloudflared)...${RESET}"
curl -LO https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
sudo chmod +x cloudflared-linux-amd64
sudo mv cloudflared-linux-amd64 /usr/local/bin/cloudflared

# Optional: Login / configure
echo -e "${CYAN}You can now login with Cloudflare CLI${RESET}"
echo "Run: cloudflared login"

echo -e "${GREEN}Cloudflare setup complete!${RESET}"
echo "Check installation: cloudflared --version"
