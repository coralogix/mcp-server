# Troubleshooting

## The tool list is empty

**No tools at all.** The connection succeeded but authorization did not. The server needs a valid Coralogix credential to resolve your team before it can list tools. Re-run the OAuth flow, or confirm your API key is current and correctly prefixed with `Bearer `.

**Tools present but Olly missing.** Expected. Olly is opt-in — send `x-allow-costly-use: true`. See [Headers and versioning](headers-and-versioning.md).

**Tools present but no skills.** You are pinned to `mcp-version: v1`, which serves no resources. Remove the header to get `v2` and all 18 skills.

**Fewer tools than the catalog lists.** Your client may cap the tool count, or filter by annotation. Check your client's MCP settings before assuming a server problem.

## Authentication failures

| Symptom | Cause | Fix |
|---|---|---|
| `401` on every request | No credential, or a malformed `Authorization` header | Send `Bearer <key>`, or drop the header and use OAuth |
| Worked yesterday, `401` today | Token revoked, key rotated, or user deactivated | Re-authenticate; validation is by live introspection, so revocation takes effect immediately |
| OAuth browser opens, then the client reports failure | Redirect could not complete | Ensure the client can bind a loopback port and that nothing blocks `localhost` callbacks |
| "missing company ID" or "no team" error | The credential did not resolve to a Coralogix team | Confirm the key belongs to an active user on the region you are connecting to |
| Authenticated, but a specific tool returns a permission error | The tool surface is not a permission grant | Grant the underlying product permission to the user behind the credential |

## Wrong or missing data

**Queries return nothing.** Check the time range first. Query tools default to a **15-minute** window; if your data is older, state the range explicitly. Then confirm you are on the right [region](regions.md) — a valid credential on the wrong cluster authenticates against a different account.

**"I can't find that field."** Field names in Coralogix are account-specific. Ask the assistant to use `search_for_fields` or `get_schemas` to discover them rather than guessing. RUM data uses flat `$d.*` fields and lives under `source rum.events`, not `source logs`.

**Results look right but incomplete.** Query tools return a bounded row count. Ask for an aggregation (`count by`, percentiles) instead of raw rows when you want a complete picture of a large window.

## Connection problems

**TLS or DNS errors.** Verify the endpoint host against [Regions](regions.md). The path is `/mgmt/api/v1/mcp` — a bare `/mcp` will not route.

**Timeouts on large queries.** Narrow the time range or aggregate server-side. A DataPrime query that scans days of raw logs can exceed a client's MCP timeout even though the query itself is valid.

**Corporate proxy or egress filtering.** The transport is streamable HTTP over 443 to `api.<region>.coralogix.com`. A proxy that buffers responses can break streaming; allowlist the host directly where possible.

**Health checks.** The server exposes `/liveness` and `/readiness` on its own host. These report server health, not your authorization, and are mainly useful for confirming reachability from a restricted network.

## Verifying at the protocol level

When a client's error message is unhelpful, talk to the server directly with the scripts in [`examples/curl/`](../examples/curl/). `initialize.sh` proves reachability and protocol negotiation; `list-tools.sh` proves authorization. That split usually isolates the problem in one step.

## Still stuck

- Documentation errors, missing examples, wrong metadata in this repo → open a GitHub issue.
- Server errors, missing data, account and permission questions → contact Coralogix support through your usual channel. Include your region, the tool name, and the timestamp.
