# Security

## Reporting a vulnerability

**Do not open a public GitHub issue for a security vulnerability.**

Report vulnerabilities in the Coralogix MCP server, or in anything this repository documents, through Coralogix's security disclosure process.

<!-- TODO(coralogix): confirm the official disclosure address with the security team and replace this block before publishing. -->

- **Email** — `TBD@coralogix.com` *(to be confirmed by the Coralogix security team)*
- **Or** — your existing Coralogix support channel, which will route the report to security.

Please include the affected component, steps to reproduce, and the impact you believe it has. Coralogix will acknowledge and keep you informed of remediation.

## Scope

**In scope** — the hosted MCP server (`api.<region>.coralogix.com/mgmt/api/v1/mcp`): authentication and authorization, tenant isolation, token handling, tool authorization.

**In scope for this repository** — documentation that would lead a user into an insecure configuration. Report those as normal GitHub issues; they are not vulnerabilities in the service.

**Out of scope** — vulnerabilities in third-party MCP clients. Report those to their maintainers.

## Security model, in brief

- **Credentials.** OAuth 2.1 with OIDC, or a personal Coralogix API key as a bearer token. Tokens are validated by live introspection against Coralogix identity on every request, so revocation is immediate.
- **Authorization.** A session inherits exactly the permissions of the user behind the credential. MCP grants no access that user does not already have. Appearing in `tools/list` is not a permission grant — calls are authorized individually.
- **Tenancy.** Team and tenant scope is resolved from the credential, not from client-supplied parameters. There is no parameter that reaches another team's data.
- **Data residency.** The server runs inside the same regional cluster as the data it queries. See [Regions](docs/regions.md).

## Using MCP safely

- **Prefer OAuth.** It ties activity to a human identity and puts no long-lived secret in a config file.
- **Scope API keys down.** A key inherits its creator's permissions. Give agents read-only keys unless they genuinely need to write.
- **Keep keys out of version control.** MCP config files usually live in project directories. Use environment variables where the client supports them.
- **Keep approval prompts on for destructive tools.** The `manage_dashboards`, `manage_views`, `manage_view_folders`, `manage_cases` and `manage_ai_*` tools are annotated `destructiveHint: true` so clients can prompt. Do not blanket-approve them.
- **Treat telemetry as untrusted input.** Log and span content originates outside your system and flows into a model's context. Standard prompt-injection caution applies — do not let an agent act on instructions found in log data.
