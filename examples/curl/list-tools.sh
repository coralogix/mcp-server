#!/usr/bin/env bash
# List available tools. Proves your credential authorizes and resolves a team.
# An empty list almost always means an authorization problem, not a server problem.
#
# Add -H "x-allow-costly-use: true" to also see the six olly_* tools.
source "$(dirname "$0")/_common.sh"

mcp_post '{
  "jsonrpc": "2.0",
  "id": 2,
  "method": "tools/list",
  "params": {}
}' | pretty '{ count: (.result.tools | length),
              tools: [.result.tools[] | {name, title: .annotations.title, readOnly: .annotations.readOnlyHint}] }'
