# Registry publishing

[`server.json`](../server.json) is the canonical machine-readable description of the Coralogix MCP server. It follows the [official MCP registry schema](https://github.com/modelcontextprotocol/registry) and is what registries, client marketplaces and discovery tools read.

## The metadata

| Field | Value |
|---|---|
| `name` | `com.coralogix/mcp-server` |
| `version` | `2.0.0` (server version, tracks the `v2` tool surface) |
| `repository.url` | `https://github.com/coralogix/mcp-server` |
| `remotes[0].type` | `streamable-http` |
| `remotes[0].url` | `https://api.{region}.coralogix.com/mgmt/api/v1/mcp` |

There is no `packages` array. The server is hosted only — there is no npm, PyPI, or container artifact for a user to run, so `remotes` is the whole story.

The `region` URL variable enumerates all eight public regions as `choices`, so a registry client can present a picker instead of asking the user to hand-assemble a hostname. The three optional `headers` are declared with `isSecret` set correctly, so a client knows to mask the API key and not the other two.

## Namespace verification

The `com.coralogix` namespace is domain-based and requires proving control of `coralogix.com` with a DNS TXT record. This is a deliberate choice over the GitHub-based alternative (`io.github.coralogix/...`): the namespace then matches the host that actually serves the endpoint, `api.<region>.coralogix.com`, which is the strongest available signal that this is a first-party server and not a community wrapper.

**Steps:**

1. Install the registry publisher CLI (`mcp-publisher`) from the [registry repo](https://github.com/modelcontextprotocol/registry).
2. Initiate DNS authentication for the `com.coralogix` namespace. The CLI issues the TXT record name and value to publish.
3. Have whoever administers Coralogix DNS add the TXT record on `coralogix.com`. Coordinate this — it is a change to a production zone.
4. Once the record resolves, complete authentication and publish `server.json`.

**Fallback.** If the DNS change is slow to land, `io.github.coralogix/mcp-server` verifies through GitHub OAuth on the `coralogix` organization and can be published the same day. It is a weaker ownership signal, so treat it as a bridge and migrate to `com.coralogix` when DNS is in place. Publishing under both names is not recommended — duplicate listings split stars and confuse discovery.

## Keeping it current

`server.json` must not drift from the deployed server. When the server changes:

- **Tool added, removed, or renamed** → regenerate [`resources/tools.json`](../resources/tools.json) and [`docs/tools.md`](tools.md), and note it in [`CHANGELOG.md`](../CHANGELOG.md).
- **A new header or a header's semantics change** → update `remotes[0].headers` and [Headers and versioning](headers-and-versioning.md).
- **A new region** → add it to `remotes[0].variables.region.choices`, [`resources/regions.json`](../resources/regions.json), and [Regions](regions.md).
- **Server version bump** → update `version` and republish.

A stale `server.json` is worse than none: a client that trusts a `choices` list containing a decommissioned region will fail in a way the user cannot diagnose.

## Other discovery surfaces

Beyond the official registry, worth keeping in sync:

- **[`llms.txt`](../llms.txt)** — this repo's index for agents crawling the documentation directly.
- **Client marketplaces** — Cursor, VS Code and Claude Code each maintain their own MCP directory with its own submission path.
- **The product docs** — [coralogix.com/docs/user-guides/mcp-server/setup](https://coralogix.com/docs/user-guides/mcp-server/setup/) remains the canonical user-facing setup page. This repo should link to it, not fork it.
