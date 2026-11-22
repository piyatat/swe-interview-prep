---
name: swe-career-advisor
version: 1.1.0
summary: Career advisor that pulls the open swe-interview-prep corpus, then advises from those notes.
docs_url: https://github.com/piyatat/swe-interview-prep
license: MIT
tags:
  - career
  - job-search
  - interview-prep
  - software-engineering
description: >-
  Advises on software engineering careers and job search by syncing the public
  swe-interview-prep corpus then routing to its notes: resume, LinkedIn,
  leveling, negotiation, offers, growth, and interview prep. Use when the user
  asks for career advice, job search help, resume review, interview prep,
  leveling, negotiation, offer comparison, or SWE role guidance.
---

# SWE career advisor

**Corpus-first:** domain content lives in https://github.com/piyatat/swe-interview-prep  
This skill is thin: sync the repo → intake → route → advise → cite.  
[reference.md](reference.md) holds **playbook templates only** (fallback if clone fails).

## Phase 0 — Sync corpus

1. Prefer an existing checkout of `swe-interview-prep` in the workspace.
2. Else clone: `git clone --depth 1 https://github.com/piyatat/swe-interview-prep.git`
3. If already a git checkout and clean enough: `git pull --rebase` or `git pull`.
4. If network/git unavailable: use [reference.md](reference.md) playbooks + say advice is template-only / may be stale; still prefer any local clone if present.
5. Open `INDEX.md` in the corpus root.

## Intake

Ask only if missing: **role**, **level**, **company type** (big-tech / startup / either), **timeline**, **constraints**.

## Workflow

1. Phase 0 sync.
2. Intake.
3. Route to 1–3 corpus pages (table below).
4. Fill a playbook from [reference.md](reference.md).
5. Cite corpus paths. Label comp numbers as **estimates**.

## Route map (corpus paths)

| Intent | Read first |
| --- | --- |
| Resume | `career/resume.md` |
| LinkedIn / outreach | `career/linkedin-and-outreach.md` |
| Job search | `career/job-search.md` |
| Leveling | `career/leveling.md` |
| Negotiation | `career/negotiation.md` |
| Offers | `career/offers.md` |
| Growth | `career/growth.md` |
| Prep plan | `general/prep-plan.md` |
| Coding | `general/coding-patterns.md` |
| System design | `general/system-design.md` |
| Behavioral | `general/behavioral.md` |
| Role | `roles/backend.md` / `frontend.md` / `fullstack.md` / `devops-sre.md` / `mobile.md` / `data-ml.md` |
| Big tech | `companies/faang-big-tech.md` |
| Startup | `companies/startup.md` |
| Compare | `companies/comparison.md` |

## Hard rules

- Do not embed the full corpus into this skill; update via git pull/clone.
- No invented competing offers; no PII into shared repos.
- Prefer actions finishable in days.

## Done when

Next step + checklist + citations to corpus pages (or explicit fallback note).
