# RUM and frontend errors

## The prompt

> Using Coralogix RUM, show me what real users hit in the last hour — JavaScript errors grouped by message, which pages and browsers they affect, and whether Web Vitals degraded.

## What the model does

1. Loads `coralogix-rum`, which is required: RUM lives at `source rum.events` with flat `$d.*` fields, and the model will query the wrong source without it.
2. `query_dataprime` against `source rum.events`, aggregating errors by message, page and browser.
3. Queries Web Vitals — LCP, CLS, INP — over the window.

## Steering it

**If it queries `source logs`** — that is the tell that the RUM skill did not load. Say *"RUM data is in `source rum.events`"* and it will correct.

**To segment** — *"Break that down by device type and country"*, or *"Show me mobile users only."* RUM events carry session, device and geo attributes.

**To connect frontend to backend** — *"Take the failing API call from those RUM errors and find the matching backend spans and logs."* This bridges RUM into `spans` for the full request path.

**For SDK and instrumentation questions** — *"How do I upload source maps for RUM?"* uses `read_rum_sdk_docs`, which serves the official SDK documentation.

## Follow-ups worth asking

> Which of these errors affects the most distinct sessions, not just the most events?

> Did the error spike line up with a deploy?

> What's the p75 LCP for the checkout page, and how does it compare to yesterday?
