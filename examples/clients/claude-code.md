# Claude Code

## Add the server

```bash
claude mcp add --transport http coralogix https://api.eu2.coralogix.com/mgmt/api/v1/mcp
```

Scope it to your user rather than a single project with `--scope user`:

```bash
claude mcp add --scope user --transport http coralogix https://api.eu2.coralogix.com/mgmt/api/v1/mcp
```

## Authenticate

Run `/mcp` inside Claude Code and select the `coralogix` server to start the OAuth flow. A browser opens; approve, and the token is stored.

## Verify

```bash
claude mcp list
```

Then in a session, `/mcp` shows the server as connected along with its tool count.

## With Olly enabled

```bash
claude mcp add --transport http \
  --header "x-allow-costly-use: true" \
  coralogix https://api.eu2.coralogix.com/mgmt/api/v1/mcp
```

## With an API key

```bash
claude mcp add --transport http \
  --header "Authorization: Bearer $CORALOGIX_API_KEY" \
  coralogix https://api.eu2.coralogix.com/mgmt/api/v1/mcp
```

## Remove

```bash
claude mcp remove coralogix
```
