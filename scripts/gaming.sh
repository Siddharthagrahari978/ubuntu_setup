#!/usr/bin/env bash
set -e

echo "[Gaming] Installing Steam..."
sudo dpkg --add-architecture i386

sudo apt update

sudo apt install -y \
    libc6:i386 \
    libgl1:i386 \
    libgl1-mesa-dri:i386 \
    steam \
    gamemode \
    mangohud

echo "[Gaming] Installing Heroic..."

flatpak install -y flathub com.heroicgameslauncher.hgl

echo ""
echo "Gaming setup complete."
echo "Enable Proton in Steam settings."
