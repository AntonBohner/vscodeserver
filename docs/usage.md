# Usage

Start with the configured default folder:

```bash
vscodeserver start
```

Start with a specific folder:

```bash
vscodeserver restart ~/dev/my-project
```

Show status:

```bash
vscodeserver status
```

Print the browser URL only:

```bash
vscodeserver url
# http://100.x.y.z:8001
```

Attach to the tmux session:

```bash
vscodeserver attach
```

Detach from tmux without stopping the server:

```text
Ctrl+b then d
```

Stop cleanly:

```bash
vscodeserver stop
```
