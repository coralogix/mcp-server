# Log exploration

## The prompt

> I'm new to this account. Using Coralogix, show me what log data exists — which services are logging, what fields are available, and what the error picture looks like over the last 6 hours.

## What the model does

1. Loads `dataprime` and `logs`, and `datasets` to see what sources exist.
2. `list_datasets` and `get_schemas` to enumerate datasets and fields.
3. `search_for_fields` to find semantically relevant fields — the semantic layer is how you find "the field that holds the user ID" without knowing its name.
4. `query_dataprime` to aggregate by service and severity.

## Steering it

**If field names come out wrong** — this is the normal failure mode in an unfamiliar account. Ask: *"Use `search_for_fields` to find the actual field name for X before querying."*

**To learn the query language alongside** — *"Show me the DataPrime query you ran, and explain each stage."* The model has the full command and function reference available through `list_dataprime_commands` and `describe_dataprime_construct`.

**For custom datasets** — *"What system datasets are available, and what's in `system/...`?"* loads the `datasets` skill and inspects them with `get_system_dataset_info`.

## Follow-ups worth asking

> Which services produce the most log volume, and what is that costing us? (loads `data-usage`)

> Find the most frequent error message in the last 6 hours and show me 5 example log lines.

> Are there any error patterns that started in the last 6 hours and weren't present before?
