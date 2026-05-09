#!/usr/bin/env bash
set -e

echo "[AI] Installing Ollama..."

curl -fsSL https://ollama.com/install.sh | sh

echo "[AI] Starting Ollama..."

sudo systemctl enable ollama
sudo systemctl start ollama

echo "[AI] Pulling starter model..."

ollama pull llama3.2:3b

echo "[AI] Installing Open WebUI..."

sudo docker run -d \
  --name open-webui \
  -p 3000:8080 \
  --add-host=host.docker.internal:host-gateway \
  -v open-webui:/app/backend/data \
  --restart unless-stopped \
  ghcr.io/open-webui/open-webui:main

echo ""
echo "Open WebUI available at:"
echo "http://localhost:3000"
