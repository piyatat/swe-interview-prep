# swe-interview-prep

**SWE career advisor knowledge base** — job search, leveling, negotiation, and interview prep (questions, frameworks, mock outlines) for software engineering roles.

Summaries and question banks only (not full copyrighted guides). Content pages include a `## Sources` section; URLs are aggregated in [`sources/bibliography.md`](sources/bibliography.md).

## Career advisor skill

In Cursor (this repo open), the project skill **`swe-career-advisor`** routes career/job asks through this corpus (intake → route → advise → cite pages).

- Skill path: [`.cursor/skills/swe-career-advisor/SKILL.md`](.cursor/skills/swe-career-advisor/SKILL.md) — thin router; **pulls/reads this repo** (does not embed the guides)
- Start with [`career/README.md`](career/README.md) or ask in chat (resume, search plan, mock drill, negotiation, etc.)
- **Agensi (live, free):** [SWE Career Advisor](https://agensi.io/skills/swe-career-advisor) — clones/pulls this corpus, then advises. Publish/update: [`runbooks/publish-agensi.md`](runbooks/publish-agensi.md)

## Layout

| Path | Contents |
| --- | --- |
| [`career/`](career/) | Resume, LinkedIn/outreach, job search, leveling, negotiation, offers, growth |
| [`general/`](general/) | Rounds every SWE role hits — coding, system design, behavioral, CS fundamentals, AI-assisted rounds, prep plans |
| [`roles/`](roles/) | Role-specific question sets and focus areas |
| [`companies/`](companies/) | FAANG/big-tech vs startup tracks and comparison |
| [`answers/`](answers/) | Mock answer outlines (coding, system design, behavioral) |
| [`resources/`](resources/) | Books, courses, practice platforms, mock-interview tools |
| [`runbooks/`](runbooks/) | Web ingest, cloud automation, Agensi publish |
| [`sources/`](sources/) | Attributed bibliography |

## Quick start

**Career / job search:** [`career/README.md`](career/README.md) → resume + LinkedIn → [`career/job-search.md`](career/job-search.md) → negotiate/offers when ready.

**Interview loop this week:** [`general/prep-plan.md`](general/prep-plan.md) → role under [`roles/`](roles/) → company track under [`companies/`](companies/) → drills in [`answers/`](answers/).

1. Clarify role + level ([`career/leveling.md`](career/leveling.md)).
2. Align resume / LinkedIn ([`career/resume.md`](career/resume.md), [`career/linkedin-and-outreach.md`](career/linkedin-and-outreach.md)).
3. Follow [`general/prep-plan.md`](general/prep-plan.md) for a 4–6 week interview schedule.
4. Build a **STAR story bank** ([`general/behavioral.md`](general/behavioral.md)) and a **pattern list** ([`general/coding-patterns.md`](general/coding-patterns.md)).
5. Before offers: [`career/negotiation.md`](career/negotiation.md) + [`career/offers.md`](career/offers.md).

## Index

See [`INDEX.md`](INDEX.md) for a flat list of all pages.

## Updating from the web

In Cursor: **`/swe-interview-prep-ingest`** — project skill [`.cursor/skills/swe-interview-prep-ingest/`](.cursor/skills/swe-interview-prep-ingest/SKILL.md); see [`runbooks/collect-from-web.md`](runbooks/collect-from-web.md). Supports `folder:career` as well as interview folders.

**Cloud automation:** copy instructions from [`runbooks/automation-setup.md`](runbooks/automation-setup.md) (full runbook: [`runbooks/automation-cloud-ingest.md`](runbooks/automation-cloud-ingest.md)).

Validate after edits: `./scripts/check.sh`

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md). Add summarized notes with sources — no paste of paywalled or copyrighted full answers.

## License

MIT for original notes in this repo ([`LICENSE`](LICENSE)). Linked third-party pages keep their own licenses.
