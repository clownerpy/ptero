#!/bin/bash
# Simple Pterodactyl Panel Installer
# Tested on Ubuntu/Debian

GREEN="\e[92m"
CYAN="\e[96m"
RESET="\e[0m"

echo -e "${GREEN}=== PTERODACTYL PANEL INSTALLER ===${RESET}"
echo -e "${CYAN}Updating system packages...${RESET}"
sudo apt update -y && sudo apt upgrade -y

echo -e "${CYAN}Installing required packages...${RESET}"
sudo apt install -y nginx mariadb-server php-cli php-fpm php-mysql php-xml php-mbstring php-bcmath unzip curl git zip composer

echo -e "${CYAN}Downloading Pterodactyl Panel...${RESET}"
cd /var/www/
sudo git clone https://github.com/pterodactyl/panel.git pterodactyl
cd pterodactyl

echo -e "${CYAN}Installing PHP dependencies...${RESET}"
sudo composer install --no-dev --optimize-autoloader

echo -e "${CYAN}Setting permissions...${RESET}"
sudo chown -R www-data:www-data /var/www/pterodactyl
sudo chmod -R 755 /var/www/pterodactyl

echo -e "${GREEN}Panel installation complete!${RESET}"
echo "You can now configure your webserver and .env file as per Pterodactyl documentation."
