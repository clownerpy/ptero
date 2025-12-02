#!/bin/bash

# Colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
C="\e[36m"
W="\e[37m"
RESET="\e[0m"

clear

# ───────────────────────────────────────────────
#   GRADIENT ANIMATION TITLE
# ───────────────────────────────────────────────
title_lines=(
"██████╗ ████████╗██████╗ ███████╗██████╗  ██████╗ "
"██╔══██╗╚══██╔══╝██╔══██╗██╔════╝██╔══██╗██╔═══██╗"
"██████╔╝   ██║   ██████╔╝█████╗  ██████╔╝██║   ██║"
"██╔══██╗   ██║   ██╔══██╗██╔══╝  ██╔══██╗██║   ██║"
"██║  ██║   ██║   ██║  ██║███████╗██║  ██║╚██████╔╝"
"╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ "
)

colors=($R $Y $G $C $B $M)

echo ""
for i in "${!title_lines[@]}"; do
    echo -e "${colors[$i]}${title_lines[$i]}${RESET}"
    sleep 0.08
done

echo -e "${M}           ✨ Ptero Install Script by Clowner ✨${RESET}"
sleep 1
clear

# ───────────────────────────────────────────────
#   MENU SYSTEM
# ───────────────────────────────────────────────

while true; do
    echo -e "${B}────────────────────────────────────────────${RESET}"
    echo -e "           ${M}PTERO INSTALLER MENU${RESET}"
    echo -e "${B}────────────────────────────────────────────${RESET}"
    echo -e "${G}1)${RESET} Install Panel"
    echo -e "${G}2)${RESET} Install Wings"
    echo -e "${G}3)${RESET} Install Cloudflare Script"
    echo -e "${G}4)${RESET} Install Blueprint"
    echo -e "${G}5)${RESET} Install Nebula Theme"
    echo -e "${R}0)${RESET} Exit"
    echo -e "${B}────────────────────────────────────────────${RESET}"

    echo ""
    read -p "$(echo -e "${Y}Choose an option:${RESET} ")" opt
    clear

    case $opt in
        1)
            echo -e "${C}Running Panel Installer...${RESET}"
            bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/pterodactyl/main/panel1)
            echo -e "${G}✔ Panel Installation Completed!${RESET}"
            ;;
        2)
            echo -e "${C}Running Wings Installer...${RESET}"
            bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/pterodactyl/main/wing-jtg)
            echo -e "${G}✔ Wings Installation Completed!${RESET}"
            ;;
        3)
            echo -e "${C}Installing Cloudflare Script...${RESET}"
            bash <(curl -s https://raw.githubusercontent.com/clownerpy/ptero/main/install-cloudflare.sh)
            echo -e "${G}✔ Cloudflare Script Installed!${RESET}"
            ;;
        4)
            echo -e "${C}Installing Blueprint...${RESET}"
            bash <(curl -s https://raw.githubusercontent.com/hopingboyz/blueprint/main/blueprint-installer.sh)
            echo -e "${G}✔ Blueprint Installed!${RESET}"
            ;;
        5)
            echo -e "${C}Installing Nebula Theme...${RESET}"
            bash <(curl -s https://raw.githubusercontent.com/clownerpy/ptero/main/ptero-nebula)
            echo -e "${G}✔ Nebula Theme Installed!${RESET}"
            ;;
        0)
            echo -e "${R}Exiting installer...${RESET}"
            exit 0
            ;;
        *)
            echo -e "${R}✖ Invalid option! Try again.${RESET}"
            ;;
    esac

    echo ""
    read -p "$(echo -e "${Y}Press ENTER to return to menu...${RESET}")"
    clear
done
