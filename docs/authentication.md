# Authentication

The Coralogix MCP server supports two credentials. Both resolve to a Coralogix user, and **the MCP session inherits exactly that user's permissions and team scope** — MCP grants no access the user does not already have in the UI or API.

## OAuth 2.1 with OIDC (recommended)

The default. No configuration:

```json
{
  "mcpServers": {
    "coralogix": {
      "url": "https://api.eu2.coralogix.com/mgmt/api/v1/mcp"
    }
  }
}
```

On the first request the client discovers the authorization server, opens a browser, and you log in to Coralogix and approve. The client stores the resulting token and refreshes it automatically.

The server implements the MCP authorization spec: it publishes OAuth metadata for discovery, accepts Dynamic Client Registration, and validates tokens by introspection against Coralogix identity on every request — a revoked token stops working immediately rather than at expiry.

Use OAuth when you can. It ties activity to a real human identity, needs no secret in a config file, and the token is short-lived.

## API key

For headless contexts — CI, a shared agent runner, a client without a browser — send a personal Coralogix API key as a bearer token:

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

Create the key in Coralogix under your account settings. Notes:

- The key carries the permissions of the user who created it. Create it under a user scoped to what the agent should reach.
- Prefer a **dedicated, read-only** key for agent use. If the agent should not create dashboards or close cases, do not give it a key that can.
- Never commit a key. Read it from the environment where your client supports that, and rotate it on the same schedule as your other API credentials.

## Permissions

Tool calls are authorized per request against the caller's Coralogix permissions. A tool that appears in `tools/list` can still fail at call time with a permission error if the account lacks access to that specific product or dataset — the tool surface is not a permission grant.

Team and tenancy scope is resolved from the credential, not from anything the client sends. There is no way to ask the MCP server for another team's data by changing a parameter.

## Troubleshooting

Authentication failures and what they mean are listed in [Troubleshooting](troubleshooting.md).
