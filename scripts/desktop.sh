#!/usr/bin/env bash
set -e

echo "[Desktop] Installing GNOME tools..."

sudo apt install -y \
    gnome-tweaks \
    gnome-shell-extension-manager \
    gnome-shell-extensions \
    kdeconnect

echo "[Desktop] Installing fonts..."

sudo apt install -y \
    fonts-firacode \
    fonts-cascadia-code \
    fonts-noto \
    fonts-noto-color-emoji

echo "[Desktop] Installing LocalSend + Spotify..."

flatpak install -y flathub org.localsend.localsend
flatpak install -y flathub com.spotify.Client

echo "[Desktop] Recommended Extensions:"
echo "- Dash to Dock"
echo "- AppIndicator"
echo "- Clipboard Indicator"
echo "- Caffeine"
