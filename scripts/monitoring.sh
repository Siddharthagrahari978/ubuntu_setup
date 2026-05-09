#!/usr/bin/env bash
set -e

echo "[Monitoring] Installing monitoring tools..."

sudo apt install -y \
    lm-sensors \
    nvtop \
    glances \
    cockpit

sudo systemctl enable cockpit.socket
sudo systemctl start cockpit.socket

echo "[Monitoring] Installing Tailscale..."

if ! command -v tailscale >/dev/null 2>&1; then
    curl -fsSL https://tailscale.com/install.sh | sh

    sudo systemctl enable tailscaled
    sudo systemctl start tailscaled
else
    echo "[Monitoring] Tailscale is already installed"
fi

echo ""
echo "Cockpit Web UI:"
echo "https://localhost:9090"
echo ""
echo "To connect Tailscale:"
echo "sudo tailscale up"
