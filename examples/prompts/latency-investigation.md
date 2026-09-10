# Latency investigation

## The prompt

> The checkout flow has felt slow since yesterday. Using Coralogix, show me p50, p95 and p99 latency for the `checkout` service over the last 48 hours, tell me when it changed, and find which operation or downstream dependency is responsible.

## What the model does

1. Loads `service-catalog` — the pre-aggregated path for latency percentiles, and much cheaper than computing them from raw spans.
2. Pulls RED metrics for `checkout` across the window to locate the inflection point.
3. Loads `spans` and `dataprime`, then queries slow spans in the degraded window to attribute the time.
4. `get_service_map_relations_graph` to check whether the latency originates downstream.

## Steering it

**If it reaches for raw spans first** — redirect: *"Use the service catalog for the percentiles; only go to spans once we know which operation to look at."* Raw span percentile math over 48 hours is slow and can time out.

**To attribute the time precisely** — *"Show me the 20 slowest `checkout` spans in the degraded window with their operation name and duration, and break down where the time went inside each trace."*

**For infrastructure causes** — *"Check CPU, memory and OOMKilled for the `checkout` pods over the same window."* This loads `service-catalog` saturation data rather than hand-written PromQL.

**For custom or infrastructure metrics** — *"Query PromQL directly for..."* loads the `metrics` skill and uses `query_promql_range`. Use this when the data isn't RED metrics.

## Follow-ups worth asking

> Is the latency uniform, or is a subset of requests much slower than the rest?

> Compare this 48-hour window to the same window last week.

> Did p99 latency correlate with throughput, or did it degrade at constant load?
