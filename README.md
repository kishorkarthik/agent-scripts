# agent-scripts

Reusable scripts, skills and workflows for Karthik's local workspace.

## Architecture

| Directory    | Purpose                                |
| ------------ | -------------------------------------- |
| `agents/`    | Agent roles and responsibilities       |
| `scripts/`   | executable, dependency-light utilities.|
| `skills/`    | Reusable capabilities and instructions |
| `workflows/` | Reusable development workflows         |
| `adapters/`  | Tool-specific configurations           |


## DuckDuckGo MCP

Requires `uv` and Claude Code.

Install the server:

    uv tool install "duckduckgo-mcp-server[browser]"

Register globally:

    ./scripts/install-mcp.sh
