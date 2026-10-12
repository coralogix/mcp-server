<!-- Generated from the live Coralogix MCP server. Do not hand-edit; regenerate with scripts/generate-mcp-public-repo.py in coralogix/documentation. -->

# Tool catalog

The Coralogix MCP server exposes **72 current tools** across 20 capability domains, plus **12 deprecated tools** retained on the `v1` surface.

6 of the current tools are the Olly agent tools, which a client sees only when the request sends `x-allow-costly-use: true` — see [Headers and versioning](headers-and-versioning.md).

A machine-readable version of this catalog lives at [`resources/tools.json`](../resources/tools.json).

## How to read the annotation columns

Tools advertise [MCP tool annotations](https://modelcontextprotocol.io/docs/concepts/tools) so a client can decide whether a call needs human approval:

| Column | Meaning |
|---|---|
| **Read-only** | `readOnlyHint` — the tool does not modify any state. |
| **Destructive** | `destructiveHint` — the tool may delete or irreversibly change state. Clients should confirm before calling. |
| **Open world** | `openWorldHint` — the tool reaches outside the closed Coralogix dataset (public docs, or an open-ended assistant). |

`—` means the tool does not declare that hint.

## Current tools (`v2`, default)

### AI Center (6)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `ai_center_get_model_pricing` | Read AI Center configuration | yes | no | no |
| `ai_center_list_applications` | Read AI Center configuration | yes | no | no |
| `ai_center_list_evaluations` | Read AI Center configuration | yes | no | no |
| `manage_ai_custom_evaluation` | Manage custom AI evaluation | no | yes | no |
| `manage_ai_evaluation` | Manage AI evaluation | no | yes | no |
| `manage_ai_model_pricing` | Manage AI model pricing | no | yes | no |

### Account & Access (1)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `manage_custom_roles` | Manage Coralogix Custom Roles | no | yes | no |

### Alerts & Cases (6)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_alerts_object` | Get alerts object | yes | no | no |
| `get_case_events` | Get case events | yes | no | no |
| `manage_alerts` | Manage Coralogix Alerts | no | yes | no |
| `manage_alerts_scheduler` | Manage Coralogix Alerts Schedulers | no | yes | no |
| `manage_cases` | Manage and inspect cases | no | yes | no |
| `search_alert_definitions` | Search alert definitions | yes | no | no |

### Dashboards (5)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `list_dashboard_folders` | List dashboard folders | yes | no | no |
| `manage_dashboard_folders` | Create or delete dashboard folders | no | yes | no |
| `manage_dashboards` | Manage Coralogix Dashboards | no | yes | no |
| `search_dashboard` | Search indexed dashboards by meaning or ID | yes | no | no |
| `search_queries` | Search saved dashboard queries | yes | no | no |

### Data Usage (6)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_data_usage_capabilities` | Get Data Usage Query API capabilities | yes | no | no |
| `manage_quota_allocation_rule_set` | Manage Coralogix Quota Allocation Rule Set | no | yes | no |
| `manage_tco_log_policies` | Manage Coralogix TCO Log Policies | no | yes | no |
| `manage_tco_rum_policies` | Manage Coralogix TCO RUM Policies | no | yes | no |
| `manage_tco_trace_policies` | Manage Coralogix TCO Trace Policies | no | yes | no |
| `query_data_usage` | Query billable data usage | yes | no | no |

### DataPrime Language (4)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `describe_dataprime_construct` | Describe a DataPrime construct | yes | no | no |
| `list_dataprime_commands` | Browse DataPrime commands and functions | yes | no | no |
| `list_dataprime_constructs` | List DataPrime constructs | yes | no | no |
| `show_dataprime_command_details` | Show DataPrime command syntax and details | yes | no | no |

### Documentation (2)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `fetch_doc` | Fetch a Coralogix doc page | yes | no | yes |
| `search_docs` | Search Coralogix docs | yes | no | yes |

### Field Discovery (1)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `search_for_fields` | Search log/span fields by description and/or example value | yes | no | no |

### Infrastructure (5)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_infrastructure_resource_health_history` | Get Infrastructure Resource Health History | yes | no | no |
| `get_infrastructure_resource_raw_data` | Get Infrastructure Resource Raw Data | yes | no | no |
| `list_infrastructure_filters` | List Infrastructure Filters | yes | no | no |
| `list_infrastructure_resource_types` | List Infrastructure Resource Types | yes | no | no |
| `list_infrastructure_resources` | List Infrastructure Resources | yes | no | no |

### Ingestion & Enrichment (3)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `manage_data_enrichments` | Manage Coralogix Data Enrichments | no | yes | no |
| `manage_integrations` | Manage Coralogix Integrations | no | yes | no |
| `manage_parsing_rules` | Manage Coralogix Parsing Rules | no | yes | no |

### Logs, Spans & Datasets (3)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_system_dataset_info` | Get system dataset info | yes | no | no |
| `list_datasets` | List datasets | yes | no | no |
| `query_dataprime` | Query DataPrime (logs, spans, or datasets) | yes | no | no |

### Metrics (8)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_metric_label_values` | List metric label values | yes | no | no |
| `get_metric_labels` | List metric label names | yes | no | no |
| `manage_events2metrics` | Manage Coralogix Events2Metrics | no | yes | no |
| `manage_recording_rules_groups_set` | Manage Coralogix Recording Rule Group Sets | no | yes | no |
| `query_promql_instant` | Run PromQL instant query (metrics) | yes | no | no |
| `query_promql_range` | Run PromQL range query (metrics) | yes | no | no |
| `search_labels` | Search label names across metrics | yes | no | no |
| `search_relevant_metrics` | Search relevant metrics | yes | no | no |

### Notifications (2)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `manage_global_routers` | Manage Coralogix Global Routers | no | yes | no |
| `manage_presets` | Manage Coralogix Presets | no | yes | no |

### Olly Agent (6)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `olly_ask` *(gated)* | Ask Olly AI Assistant | no | no | yes |
| `olly_get_artifact` *(gated)* | Get Olly Artifact | yes | no | no |
| `olly_get_chat` *(gated)* | Get Olly Chat | yes | no | no |
| `olly_get_interaction` *(gated)* | Get Olly Interaction | yes | no | no |
| `olly_list_artifacts` *(gated)* | List Olly Artifacts | yes | no | no |
| `olly_list_chats` *(gated)* | List Olly Chats | yes | no | no |

### RUM (1)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `read_rum_sdk_docs` | Read Coralogix RUM SDK documentation | yes | no | no |

### SLO (1)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `manage_slo_v2s` | Manage Coralogix SLO v2 Resources | no | yes | no |

### Saved Views (6)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_view` | Get saved view | yes | no | no |
| `get_view_folder` | Get saved view folder | yes | no | no |
| `list_view_folders` | List saved view folders | yes | no | no |
| `list_views` | List saved views | yes | no | no |
| `manage_view_folders` | Create, update, or delete saved view folders | no | yes | no |
| `manage_views` | Create, update, or delete saved views | no | yes | no |

### Service Catalog (4)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_service_catalog_entities_data` | Get Service Catalog Entities Data | yes | no | no |
| `get_service_catalog_entity_type_schema` | Get Service Catalog Entity Type Schema | yes | no | no |
| `list_service_catalog_entities` | List Service Catalog Entities | yes | no | no |
| `list_service_catalog_entity_types` | List Service Catalog Entity Types | yes | no | no |

### Service Map (1)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_service_map_relations_graph` | Get service dependency graph | yes | no | no |

### Utilities (1)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_datetime` | Get current UTC date and time | yes | no | no |

## Deprecated tools (`v1`)

These are served only when a client sends `mcp-version: v1`. They are superseded by the current tools above and will be removed in a future release — do not build new integrations on them.

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_logs_v1` | Query logs with DataPrime | yes | no | no |
| `get_schemas_v1` | List dataset schemas and fields | yes | no | no |
| `get_traces_v1` | Query traces with DataPrime | yes | no | no |
| `metrics__list_v1` | List available metric names | yes | no | no |
| `metrics__metric_label_values_v1` | List metric label values | yes | no | no |
| `metrics__metric_labels_v1` | List metric label names | yes | no | no |
| `metrics__range_query_v1` | Run PromQL range query (metrics) | yes | no | no |
| `read_dataprime_intro_docs_v1` | Read DataPrime query introduction docs | yes | no | no |
| `read_metrics_guidelines_v1` | Read metrics querying best practices | yes | no | no |
| `read_rum_log_intro_docs_v1` | Read RUM log fields and query guide | yes | no | no |
| `read_rum_sdk_docs_v1` | Read Coralogix RUM SDK documentation | yes | no | no |
| `search_metrics` | Search metrics by description or name pattern | yes | no | no |

## Notes

- **Dynamically mounted tools.** The server also mounts the Coralogix IaC MCP as a proxy, so a live `tools/list` may include Infrastructure-as-Code tools that are not enumerated here. Always treat `tools/list` as authoritative for a given account and region.
