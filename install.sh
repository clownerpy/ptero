#!/bin/bash

# Function to print text slowly (for animation)
type_text() {
    local text="$1"
    local delay=${2:-0.02} # default 20ms per character
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo
}

# Function for startup ASCII animation
startup_animation() {
    clear
    lines=(
"███████╗ ██████╗  ██████╗  ██████╗  ██████╗ ███████╗"
"██╔════╝ ██╔══██╗██╔═══██╗██╔═══██╗██╔═══██╗██╔════╝"
"███████╗ ██████╔╝██║   ██║██║   ██║██║   ██║███████╗"
"╚════██║ ██╔══██╗██║   ██║██║   ██║██║   ██║╚════██║"
"███████║ ██║  ██║╚██████╔╝╚██████╔╝╚██████╔╝███████║"
"╚══════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝"
"                       DracoHost"
"                    Pterodactyl Install"
    )

    for line in "${lines[@]}"; do
        type_text "$line" 0.003   # faster per character
    done
    echo
}

# Spinner animation while running commands
rolling_animation() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while kill -0 $pid 2>/dev/null; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

run_with_animation() {
    echo
    echo "Running: $1"
    bash -c "$1" &
    pid=$!
    rolling_animation $pid
    wait $pid
    echo "Done!"
    echo
}

# Start animation
startup_animation

# Main menu
while true; do
    echo "======================="
    echo " DracoHost Pterodactyl"
    echo "======================="
    echo "1) Install Panel"
    echo "2) Install Wing"
    echo "3) Install Cloudflare"
    echo "4) Exit"
    echo -n "Choose an option [1-4]: "
    read choice
    case $choice in
        1)
            run_with_animation "curl -s https://raw.githubusercontent.com/clownerpy/ptero/main/install-panel.sh | bash"
            ;;
        2)
            run_with_animation "curl -s https://raw.githubusercontent.com/clownerpy/ptero/main/install-wing.sh | bash"
            ;;
        3)
            run_with_animation "curl -s https://raw.githubusercontent.com/clownerpy/ptero/main/install-cloudflare.sh | bash"
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option!"
            ;;
    esac
done
