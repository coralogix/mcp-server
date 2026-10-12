# Incident triage

## The prompt

> An alert fired for `payments-api` about 20 minutes ago. Using Coralogix, find the case, walk me through its timeline, and tell me what actually broke. Check whether the error rate and latency for that service changed, and look for a deploy or config change that lines up.

## What the model does

1. Loads the `alerts` skill for terminology, then `single-case` for the deep dive.
2. `search_alert_definitions` and `get_alerts_object` to find the alert and the case it created.
3. `get_case_events` for the lifecycle — when it triggered, who was notified, what changed.
4. Loads `service-catalog` and queries RED metrics for `payments-api` to confirm error rate and latency moved when the alert says they did.
5. `query_dataprime` against logs and spans in the window to find the actual failing operation.

## Steering it

**If it stalls on the case ID** — give it the readable ID (`CASE-1234`) or the UUID from the Coralogix UI directly. It will load `single-case` and go straight in.

**If it reports metrics without confirming the cause** — ask: *"Now show me the actual error messages behind that error rate, grouped by message, and the downstream service each one hit."* Service Catalog tells you a service is unhealthy; logs and spans tell you why.

**If you want the fleet view instead** — *"How many P1 cases have we had this week, and what's the MTTR?"* loads `case-analytics` and queries the cases dataset rather than any single case.

## Follow-ups worth asking

> Was anything else unhealthy at the same time, or was `payments-api` isolated?

> Show me the service dependency graph for `payments-api` — did the failure come from upstream?

> Did any of this reach real users? Check RUM for the same window.
