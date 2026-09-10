#!/usr/bin/env bash
# Negotiate the MCP protocol. Proves the endpoint is reachable and speaks MCP.
# Prints the server name, version, and advertised capabilities.
source "$(dirname "$0")/_common.sh"

mcp_post '{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "initialize",
  "params": {
    "protocolVersion": "2025-06-18",
    "capabilities": {},
    "clientInfo": { "name": "curl-example", "version": "1.0.0" }
  }
}' | pretty '.result | {serverInfo, protocolVersion, capabilities}'
