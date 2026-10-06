# Changelog

Changes to the documentation, examples and registry metadata in this repository. For changes to the MCP server itself, see the [Coralogix release notes](https://coralogix.com/docs/).

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Added

- Initial public documentation set: getting started, regions, authentication, headers and versioning, troubleshooting, registry publishing.
- Tool catalog covering all 84 tools — 72 on the current `v2` surface and 12 deprecated `v1` tools — with MCP annotations.
- Skills reference for all 18 skills, with the verbatim descriptions the model routes on.
- Registry metadata (`server.json`) in the official MCP registry schema, declaring the remote streamable-HTTP endpoint, the region URL variable, and the three optional headers.
- Machine-readable manifests: `resources/tools.json`, `resources/skills.json`, `resources/regions.json`.
- `llms.txt` documentation index for agent discovery.
- Client configurations for Claude Code, Cursor, VS Code, Claude Desktop, Codex, Windsurf, Zed, and generic HTTP clients, plus API-key and Olly-enabled variants.
- Raw JSON-RPC examples in `examples/curl/` for verifying reachability, authorization and tool calls independently of any client.
- Worked prompt examples for incident triage, latency investigation, log exploration, RUM, and code-aware debugging.
- `CONTRIBUTING.md` and `SECURITY.md`.
