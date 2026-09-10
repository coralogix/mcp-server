# Codex

## Add the server

```bash
codex mcp add coralogix --url "https://api.eu2.coralogix.com/mgmt/api/v1/mcp"
```

OAuth runs on first use.

## Verify

```bash
codex mcp list
```

## With an API key or extra headers

If your Codex version supports header flags:

```bash
codex mcp add coralogix \
  --url "https://api.eu2.coralogix.com/mgmt/api/v1/mcp" \
  --header "Authorization: Bearer $CORALOGIX_API_KEY"
```

Otherwise configure the server in `~/.codex/config.toml`:

```toml
[mcp_servers.coralogix]
url = "https://api.eu2.coralogix.com/mgmt/api/v1/mcp"

[mcp_servers.coralogix.headers]
"x-allow-costly-use" = "true"
```

## Remove

```bash
codex mcp remove coralogix
```
