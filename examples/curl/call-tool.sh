#!/usr/bin/env bash
# Call a tool end to end. Defaults to get_datetime, which is read-only, takes no
# arguments, and touches no telemetry — the safest possible round-trip check.
#
# For a real query, swap in something like:
#
#   NAME="query_dataprime"
#   ARGS='{"query": "source logs | filter $m.severity == '"'"'ERROR'"'"' | count", "limit": 10}'
#
source "$(dirname "$0")/_common.sh"

NAME="${TOOL_NAME:-get_datetime}"
ARGS="${TOOL_ARGS:-{\}}"

mcp_post "$(printf '{
  "jsonrpc": "2.0",
  "id": 4,
  "method": "tools/call",
  "params": { "name": "%s", "arguments": %s }
}' "$NAME" "$ARGS")" | pretty '.result'
