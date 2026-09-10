# Generic HTTP MCP client

Anything that speaks MCP over streamable HTTP can connect. There is no stdio mode and no local process — the server is remote only.

## Connection parameters

| | |
|---|---|
| Transport | `streamable-http` |
| URL | `https://api.<region>.coralogix.com/mgmt/api/v1/mcp` |
| Method | `POST` for JSON-RPC requests |
| `Content-Type` | `application/json` |
| `Accept` | `application/json, text/event-stream` |
| Auth | OAuth 2.1 (discovery + DCR supported), or `Authorization: Bearer <api-key>` |

The server runs stateless with JSON responses, so a client does not need to hold a session to make a single tool call — though most clients will negotiate one via `initialize`.

## OAuth discovery

The server publishes OAuth authorization server metadata and supports Dynamic Client Registration, so a compliant client can complete the flow with no pre-registered credentials. Point your client at the MCP URL and let it discover.

## Minimum viable sequence

1. `POST` an `initialize` request with your supported protocol version and client info.
2. `POST` an `initialized` notification.
3. `POST` `tools/list` to discover tools, and `resources/list` for skills.
4. `POST` `tools/call` to invoke one.

Working shell examples for each step are in [`../curl/`](../curl/).

## Python SDK sketch

```python
from mcp import ClientSession
from mcp.client.streamable_http import streamablehttp_client

URL = "https://api.eu2.coralogix.com/mgmt/api/v1/mcp"
HEADERS = {"Authorization": f"Bearer {API_KEY}"}

async with streamablehttp_client(URL, headers=HEADERS) as (read, write, _):
    async with ClientSession(read, write) as session:
        await session.initialize()
        tools = await session.list_tools()
        result = await session.call_tool(
            "query_dataprime",
            {"query": "source logs | filter $m.severity == 'ERROR' | count", "limit": 10},
        )
```

## Notes

- Send `x-allow-costly-use: true` to expose the Olly tools, and `mcp-version` to pin a tool surface. See [Headers and versioning](../../docs/headers-and-versioning.md).
- The path is `/mgmt/api/v1/mcp`. A bare `/mcp` does not route.
- A proxy that buffers responses can break streaming. Allowlist the host directly where you can.
