#!/usr/bin/env bash
# Copy the skills from this repo (the source of truth) to where Claude Code reads them.
# Usage: bash sync.sh        Targets can be overridden with the variables below.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
USER_SKILLS="${USER_SKILLS:-$HOME/.claude/skills}"
GERECHTER="${GERECHTER:-$HOME/projects/gerechter-family-archive}"
CHRISTENSEN="${CHRISTENSEN:-$HOME/projects/christensen-ancestry}"

copy() {  # copy <from-dir> <to-dir>: every skill folder in from-dir
  [ -d "$2" ] || { echo "skip (missing): $2"; return; }
  for s in "$1"/*/; do
    name="$(basename "$s")"
    mkdir -p "$2/$name"
    cp -r "$s". "$2/$name/"
    echo "  $name -> $2"
  done
}

copy "$HERE/skills" "$USER_SKILLS"
[ -d "$GERECHTER" ] && mkdir -p "$GERECHTER/.claude/skills"
copy "$HERE/skills" "$GERECHTER/.claude/skills"
copy "$HERE/project-skills/gerechter" "$GERECHTER/.claude/skills"
[ -d "$CHRISTENSEN" ] && mkdir -p "$CHRISTENSEN/.claude/skills"
copy "$HERE/skills" "$CHRISTENSEN/.claude/skills"
copy "$HERE/project-skills/christensen" "$CHRISTENSEN/.claude/skills"
echo "Synced. Commit the archive repos that changed."
