#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG="$ROOT_DIR/adapters/claude-code/mcp/duckduckgo.json"

claude mcp remove --scope user duckduckgo 2>/dev/null || true
claude mcp add-json --scope user duckduckgo "$(cat "$CONFIG")"