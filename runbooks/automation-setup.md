# Cloud automation — SWE Interview Prep Ingest

Use this as the **Instructions** body for the Cursor Automation on `piyatat/swe-interview-prep`. The cloud agent should follow this runbook every scheduled run.

## Automation settings

| Field | Value |
| --- | --- |
| **Name** | SWE Interview Prep Ingest |
| **Description** | Daily web research → summarized interview questions/outlines → validate → push to main |
| **Trigger** | Daily 10:00 ICT (cron `0 3 * * *` UTC) — adjust in editor |
| **Repo** | `piyatat/swe-interview-prep` · branch `main` |
| **Memory** | On |

## Instructions (paste into automation prompt)

```text
Run the swe-interview-prep web ingest workflow end-to-end.

Read and follow runbooks/automation-cloud-ingest.md in this repository exactly (same steps as /swe-interview-prep-ingest).

Defaults for this automation:
- gap-fill: scan INDEX.md + recent SWE interview discourse; fill thin areas
- limit: 5 new or updated pages max per run
- folders: general/, roles/, companies/, answers/, or resources/ as appropriate
- status: commit and push to main when done (approved for automation)

Hard rules:
- Summarize only (≤ ~150 lines/page); never paste full copyrighted guides
- Every content page needs ## Sources; append sources/bibliography.md
- Dedupe with ripgrep before creating near-duplicate pages
- Update INDEX.md when adding pages
- ./scripts/check.sh must pass before commit
- No secrets; no force-push

When done, reply with a short summary table: path | topic | sources count | commit SHA.
```

## Manual test

Before enabling the schedule, run once from chat:

```
/swe-interview-prep-ingest gap-fill limit:2
```

Then verify `./scripts/check.sh` and the commit on GitHub.
