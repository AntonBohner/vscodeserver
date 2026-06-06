# Project paths and `~/dev`

Use a stable symlink as the project entrypoint:

```text
~/dev
```

Example:

```text
~/dev -> /Volumes/Projects/dev
```

If projects move to another disk later, update only the symlink.

```bash
test -d /Volumes/Projects/dev
rm ~/dev
ln -s /Volumes/Projects/dev ~/dev
```

Why this is useful:

- scripts keep using `~/dev`
- VS Code default folder stays stable
- shell habits stay stable
- fewer hardcoded physical paths everywhere

Use paths like:

```bash
cd ~/dev
vscodeserver restart ~/dev/my-project
```

instead of long physical paths.
