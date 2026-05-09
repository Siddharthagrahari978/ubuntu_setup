#!/usr/bin/env bash
set -e

echo "[Base] Updating system..."

sudo apt update && sudo apt upgrade -y

sudo apt install -y \
    curl wget git vim nano unzip zip p7zip-full \
    build-essential software-properties-common \
    apt-transport-https ca-certificates gnupg \
    ffmpeg vlc transmission \
    flameshot timeshift gparted \
    flatpak gnome-software-plugin-flatpak \
    python3 python3-pip python3-venv \
    htop btop fastfetch fzf ripgrep bat fd-find \
    zoxide neofetch ubuntu-restricted-extras

echo "[Base] Adding Flathub..."

flatpak remote-add --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo

echo "[Base] Installing Chrome..."

wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

echo "[Base] Installing OnlyOffice..."

wget -q https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
sudo apt install -y ./onlyoffice-desktopeditors_amd64.deb
rm onlyoffice-desktopeditors_amd64.deb
