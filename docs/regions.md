# Regions

Coralogix is deployed in independent regional clusters. **Your MCP endpoint is the one for the region your account lives in** — there is no global endpoint, and connecting to the wrong region will authenticate against an account you do not have.

## Endpoint pattern

```
https://api.<region>.coralogix.com/mgmt/api/v1/mcp
```

## Endpoints

| Region | MCP endpoint |
|---|---|
| `eu1` | `https://api.eu1.coralogix.com/mgmt/api/v1/mcp` |
| `eu2` | `https://api.eu2.coralogix.com/mgmt/api/v1/mcp` |
| `us1` | `https://api.us1.coralogix.com/mgmt/api/v1/mcp` |
| `us2` | `https://api.us2.coralogix.com/mgmt/api/v1/mcp` |
| `us3` | `https://api.us3.coralogix.com/mgmt/api/v1/mcp` |
| `ap1` | `https://api.ap1.coralogix.com/mgmt/api/v1/mcp` |
| `ap2` | `https://api.ap2.coralogix.com/mgmt/api/v1/mcp` |
| `ap3` | `https://api.ap3.coralogix.com/mgmt/api/v1/mcp` |

A machine-readable version is at [`resources/regions.json`](../resources/regions.json).

## Finding your region

Your region is visible in the URL of your Coralogix UI. If you are unsure, check **Settings** in the Coralogix app, or consult the [Coralogix domain reference](https://coralogix.com/docs/user-guides/account-management/account-settings/coralogix-domain/).

Private and dedicated deployments use their own hostnames. If your account is on a dedicated cluster, ask Coralogix support for your MCP endpoint.

## Data residency

Each regional cluster stores and processes data in its own jurisdiction. The MCP server runs inside the same cluster as the data it queries — an MCP request to `api.eu2.coralogix.com` does not leave that region to read your telemetry.
