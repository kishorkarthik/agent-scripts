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

## Skills

Skills are maintained in `skills/`. Each `skills/<name>/SKILL.md` contains YAML front matter defining its name and description:

```yaml
---
name: skill-name
description: "Short description of the skill and when to use it."
---
```

Register skills globally with Claude Code:

```bash
./scripts/register-skills.sh
```

The script discovers available skills and creates symlinks in `~/.claude/skills/`. Run it again whenever a skill is added.

## DuckDuckGo MCP

Requires `uv` and Claude Code.

Install the server:

    uv tool install "duckduckgo-mcp-server[browser]"

Register globally:

    ./scripts/install-mcp.sh
