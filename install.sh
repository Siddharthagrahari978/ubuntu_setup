#!/usr/bin/env bash
set -e

echo "===== Ubuntu Power User Setup ====="

chmod +x scripts/*.sh

./scripts/base.sh
./scripts/dev.sh
./scripts/desktop.sh
./scripts/monitoring.sh
./scripts/ai.sh
./scripts/gaming.sh

echo ""
echo "==================================="
echo " Setup Complete"
echo " Reboot Recommended"
echo "==================================="
