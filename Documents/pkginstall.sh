#!/bin/bash

# Ensure user wants to proceed
read -p "This will install packages from pkglist.txt. Continue? [y/N] " -n 1 -r
echo    # move to new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# Update system
sudo pacman -Syu

# Install packages from pkglist.txt
xargs -a pkglist.txt sudo pacman -S --needed --noconfirm

# Optional: Install AUR helper if needed (e.g., yay)
if ! command -v yay &> /dev/null; then
    echo "Installing yay (AUR helper)..."
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si --noconfirm && cd .. && rm -rf yay
fi

# Install AUR packages if file exists
if [ -f aur-pkglist.txt ]; then
    xargs -a aur-pkglist.txt yay -S --needed --noconfirm
fi
