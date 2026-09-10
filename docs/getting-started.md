# Getting started

## Before you begin

You need:

- A Coralogix account, and the [region](regions.md) it lives in.
- An MCP-capable client. See [`examples/clients/`](../examples/clients/) for tested configurations.

You do **not** need to install or run anything. The server is hosted by Coralogix.

## 1. Connect

Substitute your region for `eu2` in the examples below.

### Claude Code

```bash
claude mcp add --transport http coralogix https://api.eu2.coralogix.com/mgmt/api/v1/mcp
```

### Cursor

Create or edit `.cursor/mcp.json` in your project (or `~/.cursor/mcp.json` for all projects):

```json
{
  "mcpServers": {
    "coralogix": {
      "url": "https://api.eu2.coralogix.com/mgmt/api/v1/mcp"
    }
  }
}
```

### Codex

```bash
codex mcp add coralogix --url "https://api.eu2.coralogix.com/mgmt/api/v1/mcp"
```

Other clients — VS Code, Claude Desktop, Windsurf, Zed, and raw HTTP — are covered in [`examples/clients/`](../examples/clients/).

## 2. Authenticate

On the first request the client opens a browser for OAuth 2.1 login. Approve the authorization and the client stores the resulting token. Nothing else to configure.

To use a personal API key instead, see [Authentication](authentication.md).

## 3. Verify

Ask your assistant to list what it can do, or check the tool list directly:

```bash
./examples/curl/list-tools.sh https://api.eu2.coralogix.com/mgmt/api/v1/mcp "$CORALOGIX_API_KEY"
```

You should see roughly 57 tools. If you see none, or an authentication error, go to [Troubleshooting](troubleshooting.md).

## 4. Run a first query

Start with something narrow and read-only:

> *"Using Coralogix, list the 10 most frequent error messages in the last 15 minutes and tell me which service they come from."*

The model will typically load the `dataprime` and `logs` skills, discover fields, then run a `query_dataprime` call. Widen the time range once you know the shape of your data.

More worked examples: [`examples/prompts/`](../examples/prompts/).

## What to know going in

- **Time ranges default narrow.** Query tools default to a 15-minute window. Ask for an explicit range when you want more.
- **Most tools are read-only.** Dashboards, saved views and cases have `manage_*` tools that mutate state and are annotated `destructiveHint: true` — your client should ask before calling them. See the [tool catalog](tools.md).
- **Olly is opt-in.** The Olly agent tools are hidden unless you send `x-allow-costly-use: true`. See [Headers and versioning](headers-and-versioning.md).
- **Skills load on demand.** The server ships 18 [skills](skills.md) that teach the model DataPrime, PromQL and Coralogix investigation workflows. The model pulls them in as needed; you do not configure them.
