#!/usr/bin/env bash
set -e

echo "[AI] Installing Ollama..."

if ! command -v ollama >/dev/null 2>&1; then
    curl -fsSL https://ollama.com/install.sh | sh
else
    echo "[AI] Ollama is already installed"
fi

echo "[AI] Starting Ollama..."

sudo systemctl enable ollama
sudo systemctl start ollama

echo "[AI] Pulling starter model..."

ollama pull llama3.2:3b

echo "[AI] Installing Open WebUI..."

if ! docker ps -a --format 'table {{.Names}}' | grep -q open-webui; then
    sudo docker run -d \
      --name open-webui \
      -p 3000:8080 \
      --add-host=host.docker.internal:host-gateway \
      -v open-webui:/app/backend/data \
      --restart unless-stopped \
      ghcr.io/open-webui/open-webui:main
else
    echo "[AI] Open WebUI container already exists"
fi

echo ""
echo "Open WebUI available at:"
echo "http://localhost:3000"
