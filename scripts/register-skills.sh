#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"
TARGET_DIR="$HOME/.claude/skills"

mkdir -p "$TARGET_DIR"

for skill_file in "$SKILLS_DIR"/*/SKILL.md; do
    [[ -f "$skill_file" ]] || continue

    skill_dir="$(dirname "$skill_file")"
    skill_name="$(basename "$skill_dir")"
    target="$TARGET_DIR/$skill_name"

    if [[ -L "$target" ]]; then
        if [[ "$(readlink -f "$target")" == "$(readlink -f "$skill_dir")" ]]; then
            echo "Already registered: $skill_name"
        else
            echo "Conflict: $target points elsewhere; skipping."
        fi
    elif [[ -e "$target" ]]; then
        echo "Conflict: $target already exists; skipping."
    else
        ln -s "$skill_dir" "$target"
        echo "Registered: $skill_name"
    fi
done
