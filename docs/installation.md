# Installation

Run from the repository:

```bash
./install.sh
```

This installs:

```text
~/bin/vscodeserver
~/.local/bin/vscodeserver -> ~/bin/vscodeserver
~/.config/vscodeserver/config
```

If you want the installer to create `~/dev` as a symlink, pass the target explicitly:

```bash
VSCODE_SERVER_DEV_ROOT=/Volumes/Projects/dev ./install.sh
```

If `~/dev` already exists, the installer leaves it untouched.

## VS Code command

The script needs the `code` CLI. In VS Code:

```text
Command Palette -> Shell Command: Install 'code' command in PATH
```

## Tailscale

The script tries:

```text
/Applications/Tailscale.app/Contents/MacOS/Tailscale
```

then falls back to `tailscale` on PATH.

Override in `~/.config/vscodeserver/config` if needed.
