# Raw protocol examples

Shell scripts that talk JSON-RPC to the Coralogix MCP server directly. Useful for verifying reachability and authorization independently of any client, and for understanding the wire protocol.

These use an **API key**, because OAuth needs a browser. See [`../clients/api-key.md`](../clients/api-key.md).

## Setup

```bash
export CORALOGIX_MCP_URL="https://api.eu2.coralogix.com/mgmt/api/v1/mcp"
export CORALOGIX_API_KEY="cxtp_YOUR_KEY_HERE"
```

## Scripts

| Script | What it proves |
|---|---|
| [`initialize.sh`](initialize.sh) | The endpoint is reachable and negotiates the MCP protocol |
| [`list-tools.sh`](list-tools.sh) | Your credential authorizes and resolves a team |
| [`list-skills.sh`](list-skills.sh) | Skills are served as MCP resources |
| [`call-tool.sh`](call-tool.sh) | A tool call round-trips end to end |

Run them in that order. Where they stop tells you which layer is broken — see [Troubleshooting](../../docs/troubleshooting.md).

All scripts accept the URL and key as positional arguments too:

```bash
./list-tools.sh "$CORALOGIX_MCP_URL" "$CORALOGIX_API_KEY"
```

Output is piped through `jq` when it is available, and printed raw otherwise.
