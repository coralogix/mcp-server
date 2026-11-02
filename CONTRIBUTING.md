# Contributing

This repository is maintained by Coralogix. **We do not accept pull requests from outside contributors.** Pull requests opened by people outside Coralogix will be closed.

You can still help: if you find a problem, open an issue.

## What lives here

This repository holds the **public documentation, connection examples, and registry metadata** for the hosted Coralogix MCP server:

- Setup and connection guides (`docs/`, `examples/`)
- The tool and skill catalogs (`docs/tools.md`, `docs/skills.md`)
- Machine-readable manifests (`resources/`, `server.json`, `llms.txt`)

**The server implementation does not live here.** It is developed and deployed privately by Coralogix.

## Reporting issues

**Documentation problems** — wrong instructions, stale tool list, broken example, incorrect registry metadata, a client configuration that is missing → open a GitHub issue here.

**Server or account problems** — a tool erroring, missing data, permissions, quota → contact Coralogix support through your usual channel. Issues opened here cannot reach your account.

**Security vulnerabilities** — do not open an issue. See [SECURITY.md](SECURITY.md).

When reporting a documentation bug, include the page, what it says, and what actually happens.

## For Coralogix maintainers

1. Branch from `master`.
2. Make the change. Keep the existing tone: direct, second person, no marketing language.
3. Verify every command and config you touch actually works, and every link resolves.
4. Add a `CHANGELOG.md` entry under "Unreleased" if the change is user-visible.
5. Open a pull request describing what changed and how you verified it.

## Generated files

**Do not hand-edit these.** They are derived from the server source and will be overwritten:

- `resources/tools.json`
- `resources/skills.json`
- `docs/tools.md`
- `docs/skills.md`

If one is wrong or stale, open an issue — the fix is to regenerate it, and regeneration requires access to the server source. Note that `resources/regions.json` and `server.json` *are* hand-maintained.

## Keeping docs in step with the server

Documentation that has drifted from the deployed server is worse than missing documentation, because it fails in ways users cannot diagnose. When the server changes, [`docs/registry-publishing.md`](docs/registry-publishing.md) lists exactly what in this repo has to change with it.
