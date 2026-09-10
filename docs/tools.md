# Tool catalog

The Coralogix MCP server exposes **57 current tools** across 16 capability domains, plus **12 deprecated tools** retained on the `v1` surface.

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
| `ai_center_get_model_pricing` | — | — | — | — |
| `ai_center_list_applications` | — | — | — | — |
| `ai_center_list_evaluations` | — | — | — | — |
| `manage_ai_custom_evaluation` | — | — | — | — |
| `manage_ai_evaluation` | — | — | — | — |
| `manage_ai_model_pricing` | — | — | — | — |

### Alerts & Cases (4)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_alerts_object` | Get alerts object | yes | no | no |
| `get_case_events` | Get case events | yes | no | no |
| `manage_cases` | Manage and inspect cases | no | yes | no |
| `search_alert_definitions` | Search alert definitions | yes | no | no |

### Dashboards (6)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `list_dashboard_folders` | List dashboard folders | yes | no | no |
| `list_dashboards` | List dashboards | yes | no | no |
| `manage_dashboard_folders` | Create or delete dashboard folders | no | yes | no |
| `manage_dashboards` | Create, replace, validate, or delete dashboards | no | yes | no |
| `search_dashboard` | Search dashboards or fetch one by ID | yes | no | no |
| `search_queries` | Search saved dashboard queries | yes | no | no |

### Data Usage (2)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_data_usage_capabilities` | Get Data Usage Query API capabilities | yes | no | no |
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

### Infrastructure (4)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_infrastructure_resource_health_history` | Get Infrastructure Resource Health History | yes | no | no |
| `get_infrastructure_resource_raw_data` | Get Infrastructure Resource Raw Data | yes | no | no |
| `list_infrastructure_resource_types` | List Infrastructure Resource Types | yes | no | no |
| `list_infrastructure_resources` | List Infrastructure Resources | yes | no | no |

### Logs, Spans & Datasets (3)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_system_dataset_info` | Get system dataset info | yes | no | no |
| `list_datasets` | List datasets | yes | no | no |
| `query_dataprime` | Query DataPrime (logs, spans, or datasets) | yes | no | no |

### Metrics (6)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `get_metric_label_values` | List metric label values | yes | no | no |
| `get_metric_labels` | List metric label names | yes | no | no |
| `query_promql_instant` | Run PromQL instant query (metrics) | yes | no | no |
| `query_promql_range` | Run PromQL range query (metrics) | yes | no | no |
| `search_labels` | Search label names across metrics | yes | no | no |
| `search_relevant_metrics` | Search relevant metrics | yes | no | no |

### Olly Agent (6)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `olly_ask` ¹ | Ask Olly AI Assistant | no | no | yes |
| `olly_get_artifact` ¹ | Get Olly Artifact | yes | no | no |
| `olly_get_chat` ¹ | Get Olly Chat | yes | no | no |
| `olly_get_interaction` ¹ | Get Olly Interaction | yes | no | no |
| `olly_list_artifacts` ¹ | List Olly Artifacts | yes | no | no |
| `olly_list_chats` ¹ | List Olly Chats | yes | no | no |

¹ Requires the `x-allow-costly-use: true` header. See [Headers and versioning](headers-and-versioning.md).

### RUM (1)

| Tool | Title | Read-only | Destructive | Open world |
|---|---|---|---|---|
| `read_rum_sdk_docs` | Read Coralogix RUM SDK documentation | yes | no | no |

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
| `get_traces_v1` | Query traces with DataPrime | yes | no | no |
| `read_dataprime_intro_docs_v1` | Read DataPrime query introduction docs | yes | no | no |
| `metrics__list_v1` | List available metric names | yes | no | no |
| `metrics__metric_label_values_v1` | List metric label values | yes | no | no |
| `metrics__metric_labels_v1` | List metric label names | yes | no | no |
| `metrics__range_query_v1` | Run PromQL range query (metrics) | yes | no | no |
| `read_metrics_guidelines_v1` | Read metrics querying best practices | yes | no | no |
| `search_metrics` | Search metrics by description or name pattern | yes | no | no |
| `read_rum_log_intro_docs_v1` | Read RUM log fields and query guide | yes | no | no |
| `read_rum_sdk_docs_v1` | Read Coralogix RUM SDK documentation | yes | no | no |
| `get_schemas_v1` | List dataset schemas and fields | yes | no | no |

## Notes

- **Dynamically mounted tools.** The server also mounts the Coralogix IaC MCP as a proxy, so a live `tools/list` may include Infrastructure-as-Code tools that are not enumerated here. Always treat `tools/list` as authoritative for a given account and region.
- **Annotation gaps.** The AI Center tools do not yet declare tool annotations. Clients should treat `manage_ai_*` tools as state-changing until the hints are published.
