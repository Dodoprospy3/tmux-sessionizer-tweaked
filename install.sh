#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
BIN_DIR="$HOME/.local/bin"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/tmux-sessionizer"

echo "Installing tmux-sessionizer..."

# Ensure target directories exist
mkdir -p "$BIN_DIR"
mkdir -p "$CONFIG_DIR"

# Symlink executable
ln -sf "$REPO_DIR/tmux-sessionizer" "$BIN_DIR/tmux-sessionizer"
chmod +x "$REPO_DIR/tmux-sessionizer"
echo "-> Linked $BIN_DIR/tmux-sessionizer"

# Copy default config if none exists yet
if [[ ! -f "$CONFIG_DIR/tmux-sessionizer.conf" ]]; then
    cp "$REPO_DIR/tmux-sessionizer.conf" "$CONFIG_DIR/tmux-sessionizer.conf"
    echo "-> Created default config at $CONFIG_DIR/tmux-sessionizer.conf"
fi

echo "Done! Make sure $BIN_DIR is in your PATH."
