---
name: swe-interview-prep-ingest
description: >-
  Scrape the web for software engineering interview prep and career notes,
  summarize into question banks and outlines, and update the swe-interview-prep
  repo. Use when the user runs /swe-interview-prep-ingest or asks to refresh
  interview or career prep notes from the web.
disable-model-invocation: true
---

# swe-interview-prep ingest

Research the open web → write **summary notes** into `swe-interview-prep` → validate. Never paste full copyrighted pages.

## Goal

Grow the corpus with **attributed, one-topic notes**: career/job-search frameworks, questions, answer outlines, company tracks, resources. Prefer primary docs and reputable engineering sources over SEO spam.

## Inputs (optional args)

- `topic:` — what to research (required unless `gap-fill`)
- `tags:` — e.g. `system-design behavioral faang`
- `limit:N` — max **new/updated** pages this run (default: `3`; automations: `5`)
- `folder:` — `career` | `general` | `roles` | `companies` | `answers` | `resources`
- `gap-fill` — scan INDEX + recent interview discourse; fill thin areas
- `path:` — repo path (default: workspace `swe-interview-prep`, else clone `piyatat/swe-interview-prep`)
- `dry-run` — propose outlines only
- `no-push` — commit locally only if user confirms; never push

## Hard rules

- **Summarize** — soft cap ≤ ~150 lines per page (CONTRIBUTING soft max ~200); quote sparingly.
- **Attribute** — `## Sources` on every content page + row in `sources/bibliography.md`.
- **No secrets** — never commit tokens or personal data.
- **No duplicates** — search repo (`rg`) before near-duplicate pages.
- Follow `CONTRIBUTING.md` and `runbooks/collect-from-web.md` in this repository.
- Run `./scripts/check.sh` before finish.
- Commit/push when user asked, automation policy says auto-push, or user confirmed once at start.

## Phase 0 — Locate repo

1. Resolve path: `path:` → else workspace root if this skill is in-repo → else clone `piyatat/swe-interview-prep`
2. `git pull --rebase` if clean policy allows
3. Read `INDEX.md`, `CONTRIBUTING.md`; run `./scripts/check.sh`
4. Print: path, page count estimate, topics, `limit`

## Phase 1 — Research (parallel)

Up to **3 seats** in parallel (`WebSearch` / `WebFetch`):

- `docs` — official career pages, engineering blogs, RFCs
- `practice` — reputable prep guides (summarize only)
- `signals` — format changes, AI rounds, company-specific trends

Each seat returns ≤5 candidates: `{title, slug, folder, tags, key_points[], sources[], overlap}`.

## Phase 2 — Select

Rank by: usefulness, source quality, non-overlap, freshness. Lock ≤ `limit` winners. Prefer **extending** existing pages over duplicates.

## Phase 3 — Ingest (unless `dry-run`)

For each winner:

1. Create or update `folder/slug.md` with question prompts and/or answer outlines (see `answers/` examples) or career frameworks under `career/`.
2. Append bibliography rows.
3. Update `INDEX.md` when adding pages.

Run `./scripts/check.sh` — must pass.

## Phase 4 — Finish

1. Summary table: path | topic | sources count
2. If commit approved: stage with allowlist only (never `git add -A`):
   `git add career general roles companies answers resources sources INDEX.md README.md CONTRIBUTING.md LICENSE runbooks scripts .cursor/skills dist/agensi/swe-career-advisor`
   Then one commit with why-focused message; push if approved
3. Suggest gaps for next run

## Done when

- ≤ `limit` new/updated pages with sources
- `./scripts/check.sh` green
- User got short summary
