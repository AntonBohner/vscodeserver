# tmux quick reference for vscodeserver

You usually do not need raw tmux commands. Use:

```bash
vscodeserver start
vscodeserver attach
vscodeserver stop
```

Inside tmux:

```text
Ctrl+b then d   detach and leave server running
Ctrl+C          stop the VS Code server in that tmux pane
```

If you ever get lost:

```bash
vscodeserver status
vscodeserver stop
```

Direct tmux commands:

```bash
tmux list-sessions
tmux attach -t vscode-server
tmux kill-session -t vscode-server
```
