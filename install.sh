#!/bin/bash
# Unified Pterodactyl Installer with animated menu

GREEN="\e[92m"
CYAN="\e[96m"
YELLOW="\e[93m"
RESET="\e[0m"

# Simple spinner animation
spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "      \b\b\b\b\b\b"
}

clear
echo -e "${GREEN}=== PTERODACTYL ALL-IN-ONE INSTALLER ===${RESET}"

while true; do
    echo -e "${CYAN}Select an option:${RESET}"
    echo "1) Install Panel"
    echo "2) Install Wings"
    echo "3) Install Cloudflare"
    echo "0) Exit"
    read -p "Enter your choice: " option

    case "$option" in
        1)
            echo -e "${YELLOW}Installing Panel...${RESET}"
            bash install-panel.sh &
            spinner $!
            echo -e "${GREEN}Panel installation complete!${RESET}"
            ;;
        2)
            echo -e "${YELLOW}Installing Wings...${RESET}"
            bash install-wings.sh &
            spinner $!
            echo -e "${GREEN}Wings installation complete!${RESET}"
            ;;
        3)
            echo -e "${YELLOW}Installing Cloudflare...${RESET}"
            bash install-cloudflare.sh &
            spinner $!
            echo -e "${GREEN}Cloudflare setup complete!${RESET}"
            ;;
        0)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option!"
            ;;
    esac
    echo ""
done
