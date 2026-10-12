# Prompt examples

Worked prompts for common observability tasks. Each shows what to ask, which tools and skills the model typically reaches for, and how to steer it when the first answer is thin.

| | |
|---|---|
| [`incident-triage.md`](incident-triage.md) | An alert fired — find out why |
| [`latency-investigation.md`](latency-investigation.md) | Something got slow — find where |
| [`log-exploration.md`](log-exploration.md) | Explore an unfamiliar log stream |
| [`rum-frontend-errors.md`](rum-frontend-errors.md) | Investigate what real users hit |
| [`code-aware-debugging.md`](code-aware-debugging.md) | Go from a production error to a fix in the repo |

## General guidance

**Name the time range.** Query tools default to a 15-minute window. "In the last 6 hours" costs you nothing and avoids an empty result you then have to debug.

**Name the service.** Field names and service names are account-specific. Giving the model a real service name saves a discovery round trip.

**Let it discover fields.** If the model guesses a field name and the query returns nothing, ask it to run `search_for_fields` or `get_schemas` rather than guessing again.

**Ask for aggregates on wide windows.** A day of raw logs will hit row limits and can time out. `count by`, percentiles and top-N give a complete picture of a large window; raw rows give a truncated one.

**Prefer direct tools over `olly_ask`.** The direct query tools are cheaper, faster and auditable. Delegate to Olly when the question is genuinely open-ended.
