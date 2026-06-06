#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${VSCODESERVER_INSTALL_REPO:-https://github.com/antonboehner/vscodeserver.git}"
INSTALL_DIR="${VSCODESERVER_INSTALL_DIR:-$HOME/.local/src/vscodeserver}"
SCRIPT_PATH="${BASH_SOURCE[0]:-$0}"
SCRIPT_DIR="$(cd "$(dirname "$SCRIPT_PATH")" 2>/dev/null && pwd || true)"

# If this script is executed from a raw curl pipe, it is not inside the repo.
# Clone/update the repo first, then run the checked-out installer.
if [[ ! -f "$SCRIPT_DIR/bin/vscodeserver" ]]; then
  if ! command -v git >/dev/null 2>&1; then
    echo "ERROR: git is required for the one-line installer." >&2
    exit 1
  fi
  mkdir -p "$(dirname "$INSTALL_DIR")"
  if [[ -d "$INSTALL_DIR/.git" ]]; then
    git -C "$INSTALL_DIR" pull --ff-only
  else
    git clone "$REPO_URL" "$INSTALL_DIR"
  fi
  exec "$INSTALL_DIR/install.sh" "$@"
fi

SRC="$SCRIPT_DIR/bin/vscodeserver"
CONFIG_SRC="$SCRIPT_DIR/config/vscodeserver.config.example"
DEST_DIR="$HOME/bin"
DEST="$DEST_DIR/vscodeserver"
LINK_DIR="$HOME/.local/bin"
LINK="$LINK_DIR/vscodeserver"
CONFIG_DIR="$HOME/.config/vscodeserver"
CONFIG_FILE="$CONFIG_DIR/config"
DEV_LINK="$HOME/dev"
DEV_ROOT="${VSCODE_SERVER_DEV_ROOT:-}"

mkdir -p "$DEST_DIR" "$LINK_DIR" "$CONFIG_DIR"
cp "$SRC" "$DEST"
chmod +x "$DEST"
ln -sf "$DEST" "$LINK"

if [[ ! -e "$DEV_LINK" && -n "$DEV_ROOT" && -d "$DEV_ROOT" ]]; then
  ln -s "$DEV_ROOT" "$DEV_LINK"
  echo "Created dev symlink: $DEV_LINK -> $DEV_ROOT"
elif [[ -L "$DEV_LINK" ]]; then
  echo "Dev symlink: $DEV_LINK -> $(readlink "$DEV_LINK")"
elif [[ -e "$DEV_LINK" ]]; then
  echo "Dev path exists and was left untouched: $DEV_LINK"
fi

if [[ ! -f "$CONFIG_FILE" ]]; then
  if [[ -f "$CONFIG_SRC" ]]; then
    cp "$CONFIG_SRC" "$CONFIG_FILE"
  else
    {
      echo '# vscodeserver user config'
      echo 'DEFAULT_FOLDER="$HOME/dev"'
      echo 'PORT=8001'
      echo 'SESSION="vscode-server"'
      echo 'TAILSCALE_BIN="/Applications/Tailscale.app/Contents/MacOS/Tailscale"'
    } > "$CONFIG_FILE"
  fi
  echo "Created config: $CONFIG_FILE"
else
  echo "Config exists:  $CONFIG_FILE"
fi

echo "Installed: $DEST"
echo "Linked:    $LINK -> $DEST"
echo
"$LINK" status
