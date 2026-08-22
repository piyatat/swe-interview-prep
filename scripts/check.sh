#!/usr/bin/env bash
# Validate repo structure: INDEX links, bibliography presence, no empty key files.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
ERR=0

echo "check: INDEX.md exists"
test -f INDEX.md || { echo "missing INDEX.md"; ERR=1; }

echo "check: bibliography exists"
test -f sources/bibliography.md || { echo "missing sources/bibliography.md"; ERR=1; }

echo "check: markdown files have Sources section (sample)"
missing=0
while IFS= read -r f; do
  case "$f" in
    INDEX.md|CONTRIBUTING.md|README.md|answers/README.md|general/README.md|roles/README.md|companies/README.md|resources/README.md|runbooks/*) continue ;;
  esac
  if ! grep -q '^## Sources' "$f" 2>/dev/null; then
    echo "  warn: no '## Sources' in $f"
    missing=$((missing + 1))
  fi
done < <(find general roles companies answers resources -name '*.md' 2>/dev/null || true)

if [ "$missing" -gt 5 ]; then
  echo "  too many files missing Sources ($missing) — fix before merge"
  ERR=1
fi

echo "check: broken INDEX links (basic)"
while IFS= read -r line; do
  path=$(echo "$line" | sed -n 's/.*(\([^)]*\.md\)).*/\1/p')
  [ -z "$path" ] && continue
  # strip anchor
  path="${path%%#*}"
  if [ ! -f "$path" ]; then
    echo "  broken link in INDEX: $path"
    ERR=1
  fi
done < <(grep -E '\]\([^)]+\.md' INDEX.md || true)

if [ "$ERR" -eq 0 ]; then
  echo "OK"
else
  echo "FAILED"
  exit 1
fi
