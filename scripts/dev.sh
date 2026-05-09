#!/usr/bin/env bash
set -e

echo "[Dev] Installing VS Code..."

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | \
  gpg --dearmor > packages.microsoft.gpg

sudo install -D -o root -g root -m 644 packages.microsoft.gpg \
  /etc/apt/keyrings/packages.microsoft.gpg

echo \
"deb [arch=amd64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] \
https://packages.microsoft.com/repos/code stable main" | \
sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update
sudo apt install -y code docker.io docker-compose-v2

sudo usermod -aG docker $USER

echo "[Dev] Installing Starship..."

curl -sS https://starship.rs/install.sh | sh -s -- -y

if ! grep -q "starship init bash" ~/.bashrc; then
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
fi

echo "[Dev] Installing Warp..."

wget -qO- https://releases.warp.dev/linux/keys/warp.asc | \
  gpg --dearmor | sudo tee /usr/share/keyrings/warp.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/warp.gpg] https://releases.warp.dev/linux/deb stable main" | \
  sudo tee /etc/apt/sources.list.d/warp.list

sudo apt update
sudo apt install -y warp-terminal
