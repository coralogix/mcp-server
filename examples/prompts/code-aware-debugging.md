# From production error to code fix

The case where MCP in a coding assistant beats a dashboard: the model reads production telemetry and your source in the same conversation, so it can go from a stack trace to a specific line.

## The prompt

> Using Coralogix, find the most frequent unhandled exception in `orders-service` over the last 24 hours. Pull a representative stack trace, locate the responsible code in this repo, explain why it fails, and propose a fix.

## What the model does

1. Loads `dataprime` and `logs`, then aggregates exceptions by message with `query_dataprime`.
2. Pulls full log records for the top offender, including stack trace and request context.
3. Reads the files the trace names, in your working tree.
4. Correlates the two — the failing line, and the input shape that reaches it.
5. Proposes a patch, and often a test that reproduces the production input.

## Steering it

**Ask for the real input, not just the trace** — *"What did the request payload look like on the failing calls? Is there a pattern in which inputs fail?"* This is what turns a plausible fix into a correct one.

**Check the blast radius before fixing** — *"How many distinct users hit this in the last 24 hours, and is the rate increasing?"* Frequency ranking is not severity ranking.

**Verify after deploying** — *"Query the same exception for the last 30 minutes and tell me whether it's gone."*

## Follow-ups worth asking

> Are there other call sites in this repo with the same bug that just haven't fired yet?

> Did this exception exist before the last deploy? Compare the last 24 hours to the previous week.

> Which spans correspond to these failures, and what did they do downstream before failing?
