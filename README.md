# swe-interview-prep

Curated **software engineering interview preparation** — questions, frameworks, and resources for all roles, plus role-specific deep dives.

Summaries and question banks only (not full copyrighted guides). Every page links to primary sources in [`sources/bibliography.md`](sources/bibliography.md).

## Layout

| Path | Contents |
| --- | --- |
| [`general/`](general/) | Rounds every SWE role hits — coding, system design, behavioral, CS fundamentals, AI-assisted rounds, prep plans |
| [`roles/`](roles/) | Role-specific question sets and focus areas |
| [`companies/`](companies/) | FAANG/big-tech vs startup tracks and comparison |
| [`answers/`](answers/) | Mock answer outlines (coding, system design, behavioral) |
| [`resources/`](resources/) | Books, courses, practice platforms, mock-interview tools |
| [`runbooks/`](runbooks/) | How to ingest new web research (`/swe-interview-prep-ingest`) |
| [`sources/`](sources/) | Attributed bibliography |

## Quick start

1. Read [`general/prep-plan.md`](general/prep-plan.md) for a 4–6 week schedule.
2. Pick your target role under [`roles/`](roles/).
3. Build a **STAR story bank** ([`general/behavioral.md`](general/behavioral.md)) and a **pattern list** ([`general/coding-patterns.md`](general/coding-patterns.md)).
4. Practice system design with the framework in [`general/system-design.md`](general/system-design.md).
5. Track gaps in a personal notes doc; retake weak topics weekly.

## Index

See [`INDEX.md`](INDEX.md) for a flat list of all pages.

## Updating from the web

In Cursor: **`/swe-interview-prep-ingest`** — scrapes reputable sources and adds summarized questions/outlines (see [`runbooks/collect-from-web.md`](runbooks/collect-from-web.md)).

**Cloud automation:** copy instructions from [`runbooks/automation-setup.md`](runbooks/automation-setup.md) into the Cursor Automations editor (full runbook: [`runbooks/automation-cloud-ingest.md`](runbooks/automation-cloud-ingest.md)).

Validate after edits: `./scripts/check.sh`

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md). Add summarized questions with sources — no paste of paywalled or copyrighted full answers.

## License

MIT for original notes in this repo. Linked third-party pages keep their own licenses.
