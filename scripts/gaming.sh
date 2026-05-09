#!/usr/bin/env bash
set -e

echo "[Gaming] Installing Steam..."

sudo apt install -y steam-installer gamemode mangohud

echo "[Gaming] Installing Heroic..."

flatpak install -y flathub com.heroicgameslauncher.hgl

echo ""
echo "Gaming setup complete."
echo "Enable Proton in Steam settings."
