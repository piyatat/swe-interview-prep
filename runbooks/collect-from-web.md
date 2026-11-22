---
id: collect-from-web
title: Runbook — collect web notes into swe-interview-prep
tags: [runbook, contributing]
updated: 2026-08-22
---

## Preferred entry

In Cursor, run **`/swe-interview-prep-ingest`** (skill: `swe-interview-prep-ingest`).

Optional args: `topic:…` `tags:…` `limit:N` `gap-fill` `folder:career|general|roles|companies|answers|resources` `path:…` `dry-run` `no-push`

Project skill: [`.cursor/skills/swe-interview-prep-ingest/SKILL.md`](../.cursor/skills/swe-interview-prep-ingest/SKILL.md).

## Manual steps

1. WebSearch + WebFetch primary sources (prefer official docs, engineering blogs, reputable prep guides).
2. Add **summarized** questions or answer outlines — not full copyrighted text.
3. Place files under the right folder (`career/`, `general/`, `roles/`, `companies/`, `answers/`, `resources/`).
4. Append URLs to `sources/bibliography.md`.
5. Update `INDEX.md` if adding new pages.
6. Run `./scripts/check.sh` (must pass).
7. Commit/push only if user asked or automation policy says auto-push.

## Done when

- New/updated pages have `## Sources` section
- `INDEX.md` and bibliography updated
- `./scripts/check.sh` green
