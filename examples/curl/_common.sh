#!/usr/bin/env bash
# Shared setup for the Coralogix MCP curl examples. Sourced, not run directly.
set -euo pipefail

URL="${1:-${CORALOGIX_MCP_URL:-}}"
KEY="${2:-${CORALOGIX_API_KEY:-}}"

if [[ -z "$URL" || -z "$KEY" ]]; then
  cat >&2 <<USAGE
Usage: $(basename "$0") [MCP_URL] [API_KEY]

Or set the environment:
  export CORALOGIX_MCP_URL="https://api.<region>.coralogix.com/mgmt/api/v1/mcp"
  export CORALOGIX_API_KEY="cxtp_..."
USAGE
  exit 2
fi

mcp_post() {
  curl -sS --fail-with-body -X POST "$URL" \
    -H "Authorization: Bearer $KEY" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json, text/event-stream" \
    -d "$1"
}

pretty() {
  if command -v jq >/dev/null 2>&1; then jq "${1:-.}"; else cat; fi
}
