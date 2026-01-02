#!/usr/bin/env bash
set -e

echo "🌊 Installing Maui – Type the Rhythm"

sudo apt update
sudo apt install -y python3 python3-gi gir1.2-gtk-4.0 gir1.2-adw-1

git clone https://github.com/maui039/maui.git ~/.local/share/maui || true

echo "✅ Maui installed"
echo "Run with: python3 ~/.local/share/maui/app.py"
