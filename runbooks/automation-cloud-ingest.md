# Runbook — cloud automation ingest (each scheduled run)

This file is the **authoritative instruction set** for the Cursor cloud automation on `piyatat/swe-interview-prep`. Equivalent to `/swe-interview-prep-ingest` with automation defaults below.

## Goal

Research the open web → write **summary notes** (questions, answer outlines, resources) → validate → **commit and push to `main`**.

## Automation defaults (override chat args)

| Setting | Value |
| --- | --- |
| Mode | `gap-fill` (no fixed topic unless noted in run memory) |
| Limit | **5** new or updated pages max |
| Push | **Yes** — commit + push to `main` when check passes |
| Folders | `general/`, `roles/`, `companies/`, `answers/`, `resources/` |

## Phase 0 — Setup

1. Confirm checkout is `piyatat/swe-interview-prep` on `main`.
2. `git pull --rebase origin main`
3. Read `INDEX.md`, `CONTRIBUTING.md`, this file.
4. Run `./scripts/check.sh` — baseline must be green.
5. Print: current page count (markdown files under content dirs), limit for this run.

## Phase 1 — Gap analysis

Scan corpus for thin areas:

- Roles with few questions (embedded, security, QA if missing)
- Company tracks needing updates
- General topics: new 2026 formats (AI rounds, downleveling, take-homes)
- `answers/` missing outlines for common LeetCode mediums
- `resources/` stale links

Pick up to **5** themes aligned with gap-fill. Prefer **extending** existing pages over new duplicates.

## Phase 2 — Research (parallel)

Run up to **3 parallel research tracks** using web search and fetch:

| Seat | Focus |
| --- | --- |
| **docs** | Official career pages, engineering blogs, primary sources |
| **practice** | Reputable prep guides (summarize only — no full copy) |
| **signals** | Interview format changes, company-specific trends |

Each seat returns ≤5 candidates:

```
{ title, slug, folder, tags, key_points[], sources[{title,url}], overlap_with_existing }
```

Deduplicate against repo (`rg -l "topic"`). Drop uncited or thin ideas.

## Phase 3 — Select

Rank by: usefulness, source quality, non-overlap, freshness. Lock **≤5** winners for this run.

## Phase 4 — Write

For each winner:

1. Create or update `folder/slug.md`
2. Use existing patterns:
   - Questions: prompt + probes + strong answer shape (see `answers/`)
   - Resources: table with one-line “why”
3. Add `## Sources` with accessed date (today UTC)
4. Append rows to `sources/bibliography.md`
5. Update `INDEX.md` if new page

**Do not** paste full copyrighted content. **Do not** add secrets.

## Phase 5 — Validate and ship

1. Run `./scripts/check.sh` — fix until green
2. `git add -A`
3. Commit message (HEREDOC style):

   ```
   Ingest N interview prep notes from web research.

   <bullet list of paths added/updated>
   ```

4. `git push origin main`

## Phase 6 — Report

Reply with markdown table:

| Path | Topic | Sources |
| --- | --- | --- |
| … | … | n |

Include commit SHA. Note gaps for next run.

## Hard rules (never break)

- ≤5 pages per run
- `./scripts/check.sh` green before push
- Every content page has `## Sources`
- No force-push, no git config changes
- No duplicate pages when extension suffices

## Optional args (manual /swe-interview-prep-ingest only)

`topic:…` `tags:…` `limit:N` `folder:…` `dry-run` `no-push`

Automation ignores `no-push` and `dry-run` unless explicitly disabled in editor.

## Sources

- Internal: `runbooks/collect-from-web.md`, `CONTRIBUTING.md`
- Skill (local Cursor): `swe-interview-prep-ingest`
