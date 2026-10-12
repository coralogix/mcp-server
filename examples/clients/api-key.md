# API key authentication

OAuth is the recommended flow and needs no configuration. Use an API key when the client has no browser — CI, a container, a shared agent runner.

## Create the key

In Coralogix, generate a **personal API key** from your account settings. The key inherits the permissions of the user who created it.

**Create it under a user scoped to what the agent should reach.** If the agent should only read telemetry, do not hand it a key that can delete dashboards or close cases.

## Configure

Send the key as a bearer token. For clients using the `mcpServers` shape (Cursor, Claude Desktop, Windsurf):

```json
{
  "mcpServers": {
    "coralogix": {
      "url": "https://api.eu2.coralogix.com/mgmt/api/v1/mcp",
      "headers": {
        "Authorization": "Bearer cxtp_YOUR_KEY_HERE"
      }
    }
  }
}
```

VS Code:

```json
{
  "servers": {
    "coralogix": {
      "type": "http",
      "url": "https://api.eu2.coralogix.com/mgmt/api/v1/mcp",
      "headers": {
        "Authorization": "Bearer cxtp_YOUR_KEY_HERE"
      }
    }
  }
}
```

Claude Code:

```bash
claude mcp add --transport http \
  --header "Authorization: Bearer $CORALOGIX_API_KEY" \
  coralogix https://api.eu2.coralogix.com/mgmt/api/v1/mcp
```

## Handling the secret

- **Never commit the key.** These config files land in project directories that are usually version-controlled. Read from the environment where the client supports it, and add the config file to `.gitignore` where it does not.
- **Rotate on your normal API credential schedule.** Revocation is immediate — the server validates by live introspection, not local expiry.
- **One key per consumer.** Separate keys for CI and for a developer's laptop mean you can revoke one without breaking the other.

See [Authentication](../../docs/authentication.md) for how permissions and team scope are resolved.
