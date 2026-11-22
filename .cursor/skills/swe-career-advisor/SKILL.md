---
name: swe-career-advisor
description: >-
  Advises on software engineering careers and job search: resume and LinkedIn,
  outreach, leveling, negotiation and offers, growth/promotion, interview prep
  plans, mock drills, and company/role tracks. Use when the user asks for career
  advice, job search help, resume review, interview prep, leveling, negotiation,
  offer comparison, or SWE role/company guidance.
---

# SWE career advisor

**Corpus-first:** advice content lives in the `swe-interview-prep` git repo, not in this skill.
This skill only: sync → intake → route → advise → cite. Prefer short plans and checklists.

## Phase 0 — Sync corpus

1. Resolve repo root (first hit):
   - `path:` arg from user
   - workspace folder named `swe-interview-prep`
   - `/Users/piyatat/Documents/Workspace/swe-interview-prep`
   - else `git clone https://github.com/piyatat/swe-interview-prep.git` into a sensible workspace path
2. `cd` to that root.
3. If a git checkout and the tree is clean enough: `git pull --rebase` (or `git pull`) so notes are current. If pull fails (dirty tree / no network), continue on local files and say corpus may be stale.
4. Skim `INDEX.md` (do not load the whole tree).

Do **not** paste corpus chapters into the skill files. Update knowledge by pulling the repo.

## Intake

Ask only for missing fields:

| Field | Examples |
| --- | --- |
| Role | backend, frontend, fullstack, mobile, devops/SRE, data/ML |
| Level | junior / mid / senior / staff (or L4, L5, …) |
| Company type | FAANG/big-tech, startup, either |
| Timeline | weeks until interviews / open search |
| Constraints | location, visa, stack, comp floor |

Narrow asks (e.g. resume critique) → skip unused fields.

## Workflow

1. Phase 0 sync.
2. Intake.
3. **Route** — open 1–3 pages from the map (after `INDEX.md`).
4. **Advise** — fill a playbook from [reference.md](reference.md) (templates only).
5. **Cite** paths read (e.g. `career/negotiation.md`).
6. Deepen only if asked.

## Route map

| Intent | Read first |
| --- | --- |
| Resume | `career/resume.md` |
| LinkedIn / outreach | `career/linkedin-and-outreach.md` |
| Job search cadence | `career/job-search.md` |
| Leveling / scope | `career/leveling.md` |
| Negotiation | `career/negotiation.md` |
| Offer compare | `career/offers.md` |
| Growth / promo | `career/growth.md` |
| Career overview | `career/README.md` |
| Prep schedule | `general/prep-plan.md` |
| Coding / DSA | `general/coding-patterns.md` + `answers/coding-*.md` |
| System design | `general/system-design.md` + `answers/system-design-*.md` |
| Behavioral / STAR | `general/behavioral.md` + `answers/behavioral-*.md` |
| CS fundamentals | `general/cs-fundamentals.md` |
| AI interview formats | `general/ai-assisted-rounds.md` |
| Role deep dive | `roles/<slug>.md` — see role slug map |
| Big tech loop | `companies/faang-big-tech.md` |
| Startup loop | `companies/startup.md` |
| Big tech vs startup | `companies/comparison.md` |
| Practice tools | `resources/practice-platforms.md`, `resources/books-and-courses.md` |

### Role slug map

| Intake label | File |
| --- | --- |
| backend | `roles/backend.md` |
| frontend | `roles/frontend.md` |
| fullstack | `roles/fullstack.md` |
| devops / SRE | `roles/devops-sre.md` |
| mobile | `roles/mobile.md` |
| data / ML | `roles/data-ml.md` |

## Playbooks

Templates only in [reference.md](reference.md) — not domain content:

- Resume / LinkedIn critique
- 2–6 week job-search + interview plan
- Mock interview drill
- Leveling / scope calibration
- Offer / negotiation talking points
- Growth / promotion

## Hard rules

- **Corpus is source of truth** — pull/update the repo; don’t embed guides in this skill.
- **Summarize** — do not paste copyrighted guides into the repo.
- **Comp** — label numbers as estimates.
- **No personal data** — never commit resumes/emails into the repo.
- **Cite** pages you opened.
- Prefer actions finishable in days.

## Done when

Clear next step, corpus citations, and (if useful) a short checklist.
