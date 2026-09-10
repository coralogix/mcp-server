# Headers and versioning

Three request headers shape what the server exposes. All are optional; the defaults are what most users want.

| Header | Values | Default | Effect |
|---|---|---|---|
| `Authorization` | `Bearer <api-key>` | *(none — OAuth)* | Authenticates with a personal API key instead of OAuth. See [Authentication](authentication.md). |
| `mcp-version` | `v1`, `v2` | `v2` | Selects the tool surface. |
| `x-allow-costly-use` | `true` | *(unset)* | Exposes the Olly agent tools and skill. |

Headers apply per request, so the tool list a client sees is a function of the headers it sends. Changing a header changes `tools/list` on the next call — no reconnection needed.

## `mcp-version` — tool surface version

The server serves two tool surfaces from one endpoint.

**`v2` (default)** — the current surface: 57 tools, plus skills. Consolidated tools with stable names: `query_dataprime` covers logs, spans and datasets; `query_promql_instant` and `query_promql_range` cover metrics.

**`v1` (deprecated)** — 12 legacy tools kept for integrations built before the v2 consolidation. Separate `get_logs_v1` / `get_traces_v1` tools instead of a single `query_dataprime`, `metrics__*_v1` naming, and **no skills** — the v1 surface disables resources entirely, so a v1 client loses all 18 skills.

```json
{
  "mcpServers": {
    "coralogix": {
      "url": "https://api.eu2.coralogix.com/mgmt/api/v1/mcp",
      "headers": { "mcp-version": "v1" }
    }
  }
}
```

Do not pin `v1` for new work. It exists so existing integrations do not break, and it will be removed. An unrecognized value falls back to `v2`.

The two surfaces are disjoint: a `v2` request does not see v1 tools and vice versa. Full listings for both are in the [tool catalog](tools.md).

## `x-allow-costly-use` — Olly agent tools

Olly is Coralogix's natural-language observability agent. Reaching it through MCP means one tool call fans out into a full agent run — many queries, model inference, and quota consumption on your Coralogix account. Because the cost is materially different from a single read, it is withheld unless you ask for it:

```json
{
  "mcpServers": {
    "coralogix": {
      "url": "https://api.eu2.coralogix.com/mgmt/api/v1/mcp",
      "headers": { "x-allow-costly-use": "true" }
    }
  }
}
```

With the header set to exactly `true` (case-insensitive), six tools and one skill appear:

| | |
|---|---|
| `olly_ask` | Ask Olly a natural-language question |
| `olly_list_chats`, `olly_get_chat`, `olly_get_interaction` | Read Olly conversation history |
| `olly_list_artifacts`, `olly_get_artifact` | Read artifacts Olly produced |
| `skill://olly/SKILL.md` | How and when to delegate to Olly |

Any other value — or the header omitted — hides all of them. They will not appear in `tools/list` and cannot be called.

**When it is worth it.** Prefer the direct tools for anything you can express as a query: they are cheaper, faster, and the result is auditable. Reach for `olly_ask` when the question is genuinely open-ended and you want Coralogix's own agent to plan the investigation.

## Combining headers

Headers compose. An API-key client that wants Olly and the current surface sends all three:

```json
{
  "mcpServers": {
    "coralogix": {
      "url": "https://api.eu2.coralogix.com/mgmt/api/v1/mcp",
      "headers": {
        "Authorization": "Bearer cxtp_YOUR_KEY_HERE",
        "x-allow-costly-use": "true",
        "mcp-version": "v2"
      }
    }
  }
}
```

Note that `mcp-version: v1` and `x-allow-costly-use: true` together give you the Olly *tools* but not the Olly *skill*, since v1 serves no resources.
