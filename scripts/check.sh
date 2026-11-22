#!/usr/bin/env bash
# Validate repo structure: INDEX links, bibliography, Sources, relative links.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
ERR=0

echo "check: INDEX.md exists"
test -f INDEX.md || { echo "missing INDEX.md"; ERR=1; }

echo "check: bibliography exists"
test -f sources/bibliography.md || { echo "missing sources/bibliography.md"; ERR=1; }

echo "check: markdown content files have Sources section"
missing=0
while IFS= read -r f; do
  case "$f" in
    INDEX.md|CONTRIBUTING.md|README.md|LICENSE|answers/README.md|general/README.md|roles/README.md|companies/README.md|resources/README.md|career/README.md|runbooks/*|.cursor/*|dist/*) continue ;;
  esac
  if ! grep -q '^## Sources' "$f" 2>/dev/null; then
    echo "  missing '## Sources' in $f"
    missing=$((missing + 1))
    ERR=1
  fi
done < <(find general roles companies answers resources career -name '*.md' 2>/dev/null || true)

if [ "$missing" -gt 0 ]; then
  echo "  $missing content file(s) missing Sources"
fi

echo "check: broken INDEX links"
while IFS= read -r line; do
  path=$(echo "$line" | sed -n 's/.*(\([^)]*\.md\)).*/\1/p')
  [ -z "$path" ] && continue
  path="${path%%#*}"
  if [ ! -f "$path" ]; then
    echo "  broken link in INDEX: $path"
    ERR=1
  fi
done < <(grep -E '\]\([^)]+\.md' INDEX.md || true)

echo "check: relative .md links in corpus"
while IFS= read -r f; do
  case "$f" in
    dist/*|.cursor/*) continue ;;
  esac
  dir=$(dirname "$f")
  while IFS= read -r rel; do
    [ -z "$rel" ] && continue
    case "$rel" in
      http://*|https://*|mailto:*) continue ;;
    esac
    # skip pure anchors
    case "$rel" in
      '#'*) continue ;;
    esac
    rel="${rel%%#*}"
    case "$rel" in
      *.md) ;;
      *) continue ;;
    esac
    if [[ "$rel" == /* ]]; then
      target="${rel#/}"
    else
      target=$(python3 -c "import os,sys; print(os.path.normpath(sys.argv[1]))" "$dir/$rel")
    fi
    if [ ! -f "$target" ]; then
      echo "  broken link in $f -> $rel (resolved $target)"
      ERR=1
    fi
  done < <(grep -oE '\[[^]]*\]\([^)]+\)' "$f" | sed -n 's/.*](\([^)]*\)).*/\1/p' || true)
done < <(find . -name '*.md' -not -path './.git/*' -not -path './dist/*' 2>/dev/null || true)

echo "check: career advisor role slug files exist"
for slug in backend frontend fullstack devops-sre mobile data-ml; do
  test -f "roles/${slug}.md" || { echo "  missing roles/${slug}.md"; ERR=1; }
done

echo "check: Agensi portable package present"
test -f dist/agensi/swe-career-advisor/SKILL.md || { echo "  missing dist/agensi/swe-career-advisor/SKILL.md"; ERR=1; }
test -f dist/agensi/swe-career-advisor/reference.md || { echo "  missing dist/agensi/swe-career-advisor/reference.md"; ERR=1; }

if [ "$ERR" -eq 0 ]; then
  echo "OK"
else
  echo "FAILED"
  exit 1
fi
