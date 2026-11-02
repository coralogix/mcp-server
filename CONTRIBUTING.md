# Contributing

Thanks for helping improve the Coralogix MCP documentation.

## What lives here

This repository holds the **public documentation, connection examples, and registry metadata** for the hosted Coralogix MCP server:

- Setup and connection guides (`docs/`, `examples/`)
- The tool and skill catalogs (`docs/tools.md`, `docs/skills.md`)
- Machine-readable manifests (`resources/`, `server.json`, `llms.txt`)

## What does not live here

**The server implementation.** It is developed and deployed privately by Coralogix. Pull requests adding server source code, tool implementations, or deployment configuration will be closed.

That boundary is deliberate: the server is a hosted service backed by Coralogix's internal APIs, so a public implementation could not be run by anyone outside Coralogix anyway. What is useful in public is everything needed to *connect to* and *reason about* the server — which is what this repo is.

## Good contributions

- A client configuration that works and isn't documented yet
- A correction where the docs disagree with the deployed server
- A clearer explanation, a missing troubleshooting entry, a broken link
- A worked prompt example for a real workflow

## Reporting issues

**Documentation problems** — wrong instructions, stale tool list, broken example, incorrect registry metadata → open a GitHub issue here.

**Server or account problems** — a tool erroring, missing data, permissions, quota → contact Coralogix support through your usual channel. Issues opened here cannot reach your account.

When reporting a documentation bug, include the page, what it says, and what actually happens.

## Making changes

1. Fork and branch.
2. Make the change. Keep the existing tone: direct, second person, no marketing language.
3. Verify every command and config you touch actually works, and every link resolves.
4. Add a `CHANGELOG.md` entry under "Unreleased" if the change is user-visible.
5. Open a pull request describing what changed and how you verified it.

## Contributor License Agreement

Before your first pull request can be merged, you must sign the [Contributor License Agreement](CLA.md). The CLA Assistant bot comments on your pull request with a link to sign it. You sign once; it covers all your later contributions.

## Generated files

**Do not hand-edit these.** They are derived from the server source and will be overwritten:

- `resources/tools.json`
- `resources/skills.json`
- `docs/tools.md`
- `docs/skills.md`

If one is wrong or stale, open an issue — the fix is to regenerate it, and regeneration requires access to the server source. Note that `resources/regions.json` and `server.json` *are* hand-maintained.

## Keeping docs in step with the server

Documentation that has drifted from the deployed server is worse than missing documentation, because it fails in ways users cannot diagnose. When the server changes, [`docs/registry-publishing.md`](docs/registry-publishing.md) lists exactly what in this repo has to change with it.
