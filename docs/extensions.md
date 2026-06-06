# Extensions in VS Code Web

Extensions are installed from inside the browser VS Code UI:

1. Open `vscodeserver url` on the iPad.
2. Open the Extensions sidebar.
3. Search extension.
4. Press Install.

The extension installs on the Mac-side VS Code/VS Code Server profile, not on the iPad. The iPad is just the browser interface.

## What works

Usually good:

- Markdown helpers
- language support
- Git-related extensions
- many JS/TS/Python/web-dev extensions
- server-side extensions
- web-compatible extensions

May not work:

- extensions that require a native desktop UI
- extensions that depend on unsupported local OS hooks
- extensions that only support desktop VS Code, not Web/Remote

If VS Code shows a special `Install in Remote` / `Install in Web` style choice, choose the option that installs it for the remote/server/web environment.

## Where are they stored?

Conceptually: on the Mac, under VS Code / VS Code Server user data and extension directories.

Do not treat the iPad as the storage location. If you reinstall/change iPad browser, the Mac-side server/extensions are still the real environment.

## If extensions act weird

First try:

```bash
vscodeserver restart
```

If the VS Code web server cache seems broken, rebuild the serve-web cache separately; do not delete project files.
