#!/usr/bin/env bash
# List skills, which are served as MCP resources under skill://<name>/SKILL.md.
# Returns nothing if the request is pinned to mcp-version: v1, which serves no resources.
source "$(dirname "$0")/_common.sh"

mcp_post '{
  "jsonrpc": "2.0",
  "id": 3,
  "method": "resources/list",
  "params": {}
}' | pretty '{ count: (.result.resources | length),
              skills: [.result.resources[] | {uri, name}] }'
