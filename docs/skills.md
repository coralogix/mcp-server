<!-- Generated from the live Coralogix MCP server. Do not hand-edit; regenerate with scripts/generate-mcp-public-repo.py in coralogix/documentation. -->

# Skills

The Coralogix MCP server ships **18 skills** — MCP resources served under `skill://<name>/SKILL.md` via progressive disclosure. A skill is a document that teaches the model something it cannot infer from a tool schema alone: DataPrime and PromQL syntax, which Coralogix field holds what, and the order to investigate an incident in.

The model loads a skill only when the conversation calls for it, so a client's context is not paid up front for capabilities the session never touches. Skills are served automatically — there is nothing to configure or install.

Each skill's `description` is the routing signal the model matches against, which is why they are reproduced verbatim below.

> Skills are exposed as MCP **resources**, and resources are only served on the `v2` surface. A client pinned to `mcp-version: v1` gets tools but no skills. See [Headers and versioning](headers-and-versioning.md).

A machine-readable version lives at [`resources/skills.json`](../resources/skills.json).

## Catalog

### `ai-center`

**URI** — `skill://ai-center/SKILL.md`

Coralogix AI Center — observe, evaluate, and guard GenAI/LLM applications and agents. Use for ANY question or action about the user's AI/GenAI applications or agents — their behavior, prompts/responses, quality, hallucinations, guardrails, security, cost/tokens, errors, latency, evaluations/policies, model pricing, inventory/security posture, or configuration, including comparing or tracking agents over time. Combines GenAI span queries (via `query_dataprime`) with the `ai_center_*` / `manage_ai_*` configuration tools.

### `alerts`

**URI** — `skill://alerts/SKILL.md`

Alert and case terminology, alert definitions, alert events, cases, IDs, alert types, and skill routing. Load whenever working with alerts or cases to understand shared terminology.

### `case-analytics`

**URI** — `skill://case-analytics/SKILL.md`

Fleet/aggregate analytics across many cases via the `system/labs.cases.state_updates` DataPrime dataset. Load when the user asks counts, trends, distributions or rates across cases — e.g. "MTTR last week", "how many P1 cases today", "active case count per team", "list active cases", "how long until activation on average". Do NOT load for one specific case ID — use alert tools for single-case investigation. Load the `dataprime` skill alongside this skill.

### `cases`

**URI** — `skill://cases/SKILL.md`

Triage and manage Coralogix Cases. Load when a user wants to inspect a case, update it, add a comment, assign or acknowledge it, resolve or close it, change its priority, inspect its events, or inspect notification deliveries.

### `coralogix-docs`

**URI** — `skill://coralogix-docs/SKILL.md`

| Search and read official Coralogix platform documentation using **`search_docs`** and **`fetch_doc`**. Use when the user asks how Coralogix features work, how to configure or use the UI, set up integrations (OpenTelemetry, agents, collectors, webhooks), manage API keys, explore spans/traces/logs in the product, configure alerts/SLOs/dashboards, or needs authoritative product docs — not live tenant telemetry.

### `coralogix-logs`

**URI** — `skill://coralogix-logs/SKILL.md`

Log-specific concepts, fields, field discovery usage, and troubleshooting patterns. The `dataprime` skill should be loaded alongside this skill. Load when you need to explore logs in your investigation or to answer a question about logs.

### `coralogix-rum`

**URI** — `skill://coralogix-rum/SKILL.md`

Use when the user asks to "query RUM", "cx_rum", "real user monitoring", "frontend errors", "browser errors", "mobile app crashes", "Web Vitals", "slow page load", "LCP", "CLS", "browser network failures", "user clicks", "session replay", "RUM SDK", "install RUM", "source maps for RUM", or wants to query Coralogix RUM telemetry using query_dataprime with `source rum.events`, DataPrime, and flat `$d.*` fields (field catalog is in Key Fields below), or needs official RUM SDK docs (read_rum_sdk_docs).

### `coralogix-spans`

**URI** — `skill://coralogix-spans/SKILL.md`

Span-specific concepts, fields, duration handling, and investigation patterns. Load when you need to explore spans in your investigation or to answer a question about spans. For service-level error rate, latency percentiles, throughput, or health, load the `service-catalog` skill instead — it is the pre-aggregated path for those; use this skill when you need individual traces, span attributes, or span-level detail the catalog does not expose. Always load the `dataprime` skill together with this one before writing any query.

### `dashboards`

**URI** — `skill://dashboards/SKILL.md`

Dashboard analysis and editing workflow and rules for using dashboard JSON, filters, variables, and time ranges. Load when the user provides dashboard context (for example a dashboard link) or asks to create or change a dashboard.

### `data-usage`

**URI** — `skill://data-usage/SKILL.md`

Data usage, billing units, plan consumption, quota metrics, anomaly detection, and time-series analysis concepts and query workflow. Load when the user asks about data usage, ingestion volumes, billing, plan limits, overage, quota attribution, usage anomalies, or usage trends over time.

### `dataprime`

**URI** — `skill://dataprime/SKILL.md`

DataPrime query language for logs/spans/custom datasets (shared syntax, patterns, and rules). Load when you need to write a DataPrime query to explore logs or spans. Also load in case the user asks for help with a DataPrime query or its generation.

### `datasets`

**URI** — `skill://datasets/SKILL.md`

Dataset discovery and source-selection guidance for DataPrime system and user-defined datasets. Load when the user asks what datasets exist, how to use `list_datasets`, how to query `system/...` or `default/...` sources, or how to inspect a specific system dataset after discovery. The `dataprime` skill should be loaded alongside this skill.

### `infrastructure`

**URI** — `skill://infrastructure/SKILL.md`

Discover and inspect infrastructure resources — monitored resource types, resource inventory, per-resource health history and raw data. Load when the user asks to "show resource types", "list infrastructure resources", "what resources of this kind are monitored", "is this resource healthy", "resource health history", "when did this resource go critical", "get raw resource data", "infrastructure inventory", "find resources by name", "filter resources by service or environment", or wants to explore infrastructure resources and their data.

### `metrics-query`

**URI** — `skill://metrics-query/SKILL.md`

PromQL fundamentals and metric discovery/query workflow. Load when you need to explore metrics in your investigation or to answer a question about metrics. For service-level RED metrics (error rate, latency percentiles, throughput) or pod/JVM resource saturation, load the `service-catalog` skill instead — it is a pre-aggregated path for that data; this skill is for custom, infrastructure, and hand-written PromQL work.

### `olly` *(gated)*

**URI** — `skill://olly/SKILL.md`

>- Use when the user wants to investigate or analyze data in Coralogix, or explicitly asks to use Olly. Examples: "ask Olly", "why is my service slow", "what alerts fired", "investigate this incident", "analyze errors", "explain this spike".

### `service-catalog`

**URI** — `skill://service-catalog/SKILL.md`

The fast, authoritative path for APM/RED data — error rate, latency percentiles (p50-p99), throughput, health status, resource saturation (CPU/memory/OOMKilled for k8s-pod, heap/thread/GC for jvm), and dependency latency — across services, databases, operations, k8s pods, and JVMs. Load this FIRST for any question about service errors, slowness, latency, health, or saturation, including broad ones like "is any service erroring or slow right now?", before reaching for raw spans or PromQL. Also covers inventory questions such as listing services or available entity types.

### `single-case`

**URI** — `skill://single-case/SKILL.md`

Deep single-case investigation. Load when the user asks about one specific case by ID (UUID or readable id like "CASE-123") — e.g. summarize comments, explain who was notified where, judge whether the trigger reflects a real incident, walk the lifecycle. The `alerts` skill should be loaded alongside this skill.

### `views`

**URI** — `skill://views/SKILL.md`

Manage Coralogix saved views and saved-view folders. Load when the user asks to create, update, delete, inspect, organize, or list saved log views.
