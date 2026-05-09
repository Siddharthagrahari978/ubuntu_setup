
# Ubuntu Power User Setup

Modular Ubuntu setup for:
- Productivity
- Development
- Local AI
- Gaming
- Remote access

## Usage

```bash
chmod +x install.sh
./install.sh
```

## Structure

- install.sh -> master orchestrator
- scripts/base.sh -> core packages and utilities
- scripts/dev.sh -> developer tooling
- scripts/ai.sh -> Ollama + Open WebUI + Tailscale
- scripts/gaming.sh -> gaming stack
- scripts/desktop.sh -> GNOME tweaks and fonts
- scripts/monitoring.sh -> monitoring and remote access
