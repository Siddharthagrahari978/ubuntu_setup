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
    zoxide ubuntu-restricted-extras

echo "[Base] Adding Flathub..."

flatpak remote-add --if-not-exists flathub \
    https://flathub.org/repo/flathub.flatpakrepo

echo "[Base] Installing/Updating Chrome..."

if command -v google-chrome >/dev/null 2>&1; then
    installed_version=$(dpkg -s google-chrome-stable | grep '^Version:' | awk '{print $2}')
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    deb_version=$(dpkg-deb -f google-chrome-stable_current_amd64.deb Version)
    if dpkg --compare-versions "$deb_version" gt "$installed_version"; then
        sudo apt install -y ./google-chrome-stable_current_amd64.deb
        echo "[Base] Chrome updated to $deb_version"
    else
        echo "[Base] Chrome is up to date"
    fi
    rm google-chrome-stable_current_amd64.deb
else
    wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
fi

echo "[Base] Installing/Updating OnlyOffice..."

if dpkg -l | grep -q "^ii.*onlyoffice-desktopeditors"; then
    installed_version=$(dpkg -s onlyoffice-desktopeditors | grep '^Version:' | awk '{print $2}')
    wget -q https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
    deb_version=$(dpkg-deb -f onlyoffice-desktopeditors_amd64.deb Version)
    if dpkg --compare-versions "$deb_version" gt "$installed_version"; then
        sudo apt install -y ./onlyoffice-desktopeditors_amd64.deb
        echo "[Base] OnlyOffice updated to $deb_version"
    else
        echo "[Base] OnlyOffice is up to date"
    fi
    rm onlyoffice-desktopeditors_amd64.deb
else
    wget -q https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
    sudo apt install -y ./onlyoffice-desktopeditors_amd64.deb
    rm onlyoffice-desktopeditors_amd64.deb
fi
