---
id: publish-agensi
title: Runbook — publish free swe-career-advisor on Agensi
tags: [runbook, distribution]
updated: 2026-11-22
---

## Goal

Ship a **free**, self-contained skill on [Agensi](https://www.agensi.io/) so any Agensi-connected agent can advise on SWE careers. This git repo remains the editable source of truth.

**Two packages (same model):** thin skill + **git pull/clone** of the public corpus. Domain notes are **not** embedded in the skill.

| Package | Path | Behavior |
| --- | --- | --- |
| Project (Cursor) | `.cursor/skills/swe-career-advisor/` | Sync local/clone repo → route into markdown corpus |
| Portable (Agensi) | `dist/agensi/swe-career-advisor/` | Clone/pull GitHub corpus → same routing; `reference.md` = playbook templates + offline fallback |

## Package location

| Path | Role |
| --- | --- |
| [`dist/agensi/swe-career-advisor/`](../dist/agensi/swe-career-advisor/) | Portable `SKILL.md` + `reference.md` |
| `dist/agensi/swe-career-advisor.zip` | Upload artifact (`SKILL.md` at ZIP root); gitignored — rebuild before submit |

## Pre-submit checklist

1. Keep portable skill thin: workflow + clone/pull instructions; playbook templates only in `reference.md` (no full corpus paste).
2. Confirm portable `SKILL.md` has no `/Users/…` paths and no secrets.
3. Rebuild ZIP:

```bash
cd dist/agensi/swe-career-advisor
rm -f ../swe-career-advisor.zip
zip -X -r ../swe-career-advisor.zip SKILL.md reference.md
unzip -l ../swe-career-advisor.zip   # SKILL.md + reference.md at root
```

4. Creator account → Creator Mode → [Submit](https://www.agensi.io/dashboard/submit).
5. Pricing: **Free** (no Stripe/Zoneless needed).
6. Fill listing:

| Field | Suggested |
| --- | --- |
| Name | SWE Career Advisor |
| Summary | Career + job-search advisor for software engineers: resume, outreach, leveling, negotiation, offers, and interview prep plans. |
| Description | What it does, intake fields, playbooks, link to https://github.com/piyatat/swe-interview-prep , MIT ([LICENSE](../LICENSE)), estimate disclaimer for comp. |
| Demo | Sample user ask + full advisor reply (resume critique or 4-week plan). |
| Categories / tags | Career, Job search, Interview prep, Software engineering |
| Docs link | https://github.com/piyatat/swe-interview-prep |

7. Wait for security scan + human review (usually hours, up to ~48h).
8. When live: paste listing URL into [`README.md`](../README.md) under the Agensi blurb (replace “package ready” wording).

**Live listing:** https://agensi.io/skills/swe-career-advisor (v1.1.0, free, security approved).

## Safety checks before upload

- [ ] No absolute local paths (`/Users/…`)
- [ ] No secrets, tokens, or personal resumes
- [ ] No “ignore previous instructions” / obfuscation
- [ ] `SKILL.md` is at ZIP **root**
- [ ] ZIP rebuilt with `zip -X` (strip UID/GID extras)

## Updates

Edit `dist/agensi/swe-career-advisor/`, rebuild ZIP (`rm` + `zip -X`), submit as an **update** on Agensi.

## Done when

- ZIP built and listing submitted (or ready with checklist above)
- README points at the live Agensi listing URL once approved
