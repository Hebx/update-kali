#!/bin/bash
GREEN="\033[1;32m"
GREY="\033[0;37m"
ENDCOLOR="\e[0m"

# === Exit without proceeding if run in WSL ===
if [ -d /mnt/c/ ]; then
    echo -ne $GREY">>> "$ENDCOLOR; echo "Skipping VS Code on WSL"
    exit 0
fi

# Check if typora is installed
if [ $(sudo dpkg-query -W -f='${Status}' code 2>/dev/null | grep -c "ok installed") -eq 0 ]
then
    echo -ne $GREEN">>> "$ENDCOLOR; echo "Installing VS Code"

    cd ~
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
    rm ~/packages.microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    sudo apt install -y apt-transport-https
    sudo apt update -y
    sudo apt install -y code
else 
    echo -ne $GREY">>> "$ENDCOLOR; echo "Package 'code' already installed"
fi
