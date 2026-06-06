# Security

Default mode:

```text
host:  Mac Tailscale IP only
port:  8001
auth:  no VS Code connection token
```

The important security boundary is this:

```bash
--host <mac-tailscale-ip>
```

not:

```bash
--host 0.0.0.0
```

Binding to the Tailscale IP means normal public internet clients cannot reach the server. Only devices/users with access to the same Tailnet can try to open it.

## Is no token okay?

It can be okay for a private Tailnet made of your own trusted devices.

Why this is practical:

- the server is not public
- it is bound only to Tailscale
- the browser device must already be in the Tailnet
- VS Code token mode can be brittle on some tablet/browser setups

But no token means: any trusted device/user in the Tailnet that can reach this Mac and port can open the editor.

If the Tailnet has untrusted people/devices, do not use no-token mode. Prefer:

- stricter Tailscale ACLs
- VS Code Tunnel with Microsoft/GitHub auth
- a separate auth proxy
- or revisiting VS Code token mode

## Stop when not needed

When done:

```bash
vscodeserver stop
```
