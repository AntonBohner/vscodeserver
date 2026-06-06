# Configuration

The launcher reads this user config:

```text
~/.config/vscodeserver/config
```

Current recommended config:

```bash
DEFAULT_FOLDER="$HOME/dev"
PORT=8001
SESSION="vscode-server"
TAILSCALE_BIN="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
```

Show config and effective values:

```bash
vscodeserver config
```

## Change default folder

Edit:

```text
~/.config/vscodeserver/config
```

Change:

```bash
DEFAULT_FOLDER="$HOME/dev"
```

Recommended: keep `DEFAULT_FOLDER="$HOME/dev"` and move the `~/dev` symlink when the real dev folder moves.

## One-off override

Open a folder once without changing config:

```bash
vscodeserver restart ~/dev/productivity/macosfocus/focus
```

## Environment overrides

For temporary shell-level overrides:

```bash
VSCODE_SERVER_PORT=8010 vscodeserver start
VSCODE_SERVER_FOLDER="$HOME/dev/some-project" vscodeserver start
VSCODE_SERVER_CONFIG="$HOME/path/to/other-config" vscodeserver status
```
