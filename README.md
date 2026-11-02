# Coralogix MCP Server

Query and investigate your Coralogix observability data — logs, spans, metrics, RUM, alerts, cases, dashboards and service catalog — from any [Model Context Protocol](https://modelcontextprotocol.io) client.

The server is **fully hosted and remote**. There is nothing to install, build, or run.

```
https://api.<region>.coralogix.com/mgmt/api/v1/mcp
```

> **About this repository.** This is the public home for Coralogix MCP *documentation, connection examples, and registry metadata*. The server implementation is maintained privately by Coralogix; this repo carries no server source code. See [Contributing](CONTRIBUTING.md).

---

## Quick start

Pick your client, substitute your [region](docs/regions.md), and connect. OAuth runs in the browser on first use — no API key needed.

**Claude Code**

```bash
claude mcp add --transport http coralogix https://api.eu2.coralogix.com/mgmt/api/v1/mcp
```

**Cursor** — `.cursor/mcp.json`

```json
{
  "mcpServers": {
    "coralogix": {
      "url": "https://api.eu2.coralogix.com/mgmt/api/v1/mcp"
    }
  }
}
```

**Codex**

```bash
codex mcp add coralogix --url "https://api.eu2.coralogix.com/mgmt/api/v1/mcp"
```

Full, copy-pasteable configurations for these and other clients are in [`examples/clients/`](examples/clients/).

Then ask your assistant:

> *"Show me the most frequent errors for service `payments-api` in the last hour."*
> *"Why did this alert fire? Walk me through the case timeline."*
> *"What's the p99 latency for checkout over the past 24 hours?"*

More in [`examples/prompts/`](examples/prompts/).

---

## What it can do

**71 tools** across 21 capability domains — 65 by default, plus the six Olly agent tools when `x-allow-costly-use` is set — and **20 skills** that teach the model Coralogix query languages and investigation workflows on demand.

| Domain | What it covers |
|---|---|
| **Logs, Spans & Datasets** | Query logs, spans and named datasets with DataPrime |
| **Metrics** | PromQL instant and range queries, metric and label discovery |
| **Alerts & Cases** | Alert definitions, alert events, case triage and lifecycle |
| **Service Catalog** | RED metrics — error rate, latency percentiles, throughput, saturation |
| **Service Map** | Service-to-service dependency graph |
| **Infrastructure** | Resource inventory, health history, raw resource data |
| **RUM** | Real user monitoring — Web Vitals, frontend errors, sessions |
| **Dashboards** | List, search, create, replace and delete dashboards and folders |
| **Saved Views** | Manage saved log views and view folders |
| **Data Usage** | Billable ingestion volumes, quota attribution, usage trends |
| **AI Center** | Observe and evaluate GenAI applications, guardrails, model pricing |
| **Field Discovery** | Semantic search across log and span fields |
| **Schemas** | Dataset schemas and available fields |
| **DataPrime Language** | Command and function reference, construct guidance |
| **Documentation** | Search and fetch Coralogix docs |
| **Utilities** | Current UTC time, for grounding relative time ranges |
| **Olly Agent** | Coralogix's natural-language observability agent (opt-in) |

Tools declare MCP annotations (`readOnlyHint`, `destructiveHint`, `openWorldHint`) so clients know what needs approval. Most are read-only; the `manage_*` tools that mutate state are flagged destructive.

- **Full per-tool reference** → [`docs/tools.md`](docs/tools.md)
- **Machine-readable manifest** → [`resources/tools.json`](resources/tools.json)
- **Skills reference** → [`docs/skills.md`](docs/skills.md)

---

## Documentation

| | |
|---|---|
| [Getting started](docs/getting-started.md) | Connect, verify, and run a first query |
| [Regions](docs/regions.md) | Endpoint URL for every Coralogix region |
| [Authentication](docs/authentication.md) | OAuth 2.1 and API key, permissions, tenancy |
| [Tool catalog](docs/tools.md) | All 71 current tools, and the 12 deprecated ones, with annotations |
| [Skills](docs/skills.md) | The 20 progressive-disclosure skills |
| [Headers and versioning](docs/headers-and-versioning.md) | `mcp-version`, `x-allow-costly-use` |
| [Troubleshooting](docs/troubleshooting.md) | Common failures and what they mean |
| [Registry publishing](docs/registry-publishing.md) | How `server.json` is published and verified |

Agents: start at [`llms.txt`](llms.txt).

---

## Registry

Registry metadata lives in [`server.json`](server.json), following the [official MCP registry schema](https://github.com/modelcontextprotocol/registry).

| | |
|---|---|
| Registry name | `com.coralogix/mcp-server` |
| Transport | `streamable-http` |
| Server version | `2.0.0` |
| Authentication | OAuth 2.1 (OIDC) or bearer API key |

---

## Support

- **Product documentation** — [coralogix.com/docs/user-guides/mcp-server/setup](https://coralogix.com/docs/user-guides/mcp-server/setup/)
- **Bugs and feature requests in this documentation** — open a GitHub issue
- **Server, account, or data issues** — contact Coralogix support through your usual channel
- **Privacy** — [Coralogix Privacy Policy](https://coralogix.com/privacy-policy)
