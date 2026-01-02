




























































































































































































































































































































#!/usr/bin/env bash
set -e

APP_NAME="Maui"
APP_ID="io.maui.typing"
INSTALL_DIR="$HOME/.local/share/maui"
BIN_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"

echo "🌊 Installing Maui…"

mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$DESKTOP_DIR"

cp -r src/* "$INSTALL_DIR/"

cat > "$BIN_DIR/maui" <<EOF
#!/usr/bin/env bash
python3 "$INSTALL_DIR/app.py"
EOF

chmod +x "$BIN_DIR/maui"

cat > "$DESKTOP_DIR/$APP_ID.desktop" <<EOF
[Desktop Entry]
Name=Maui
Comment=Type the Rhythm
Exec=$BIN_DIR/maui
Icon=utilities-terminal
Terminal=false
Type=Application
Categories=Game;Education;
EOF

update-desktop-database "$DESKTOP_DIR" >/dev/null 2>&1 || true

echo "✅ Maui installed!"
echo "▶ Launch from your menu or run: maui"
#!/usr/bin/env bash
set -e

echo "🌊 Installing Maui – Type the Rhythm"

sudo apt update
sudo apt install -y python3 python3-gi gir1.2-gtk-4.0 gir1.2-adw-1

git clone https://github.com/maui039/maui.git ~/.local/share/maui || true

echo "✅ Maui installed"
echo "Run with: python3 ~/.local/share/maui/app.py"
