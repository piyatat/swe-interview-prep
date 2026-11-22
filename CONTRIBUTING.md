# Contributing

## What belongs here

- **Career notes** under `career/` (resume, search, leveling, negotiation, offers, growth)
- **Interview questions** (prompt + what interviewers probe + brief answer outline)
- **Frameworks** (STAR, system design steps, prep schedules)
- **Resource links** with one-line why-it-matters notes
- **Role-specific** focus areas and sample prompts

## What does not belong

- Full copied answers from books or paid courses
- Company-confidential interview content
- Personal data, resumes with PII, or recruiter emails
- Invented salary figures presented as facts (label estimates)

## Format

Each **content** markdown file (leaf pages under `career/`, `general/`, `roles/`, `companies/`, `answers/`, `resources/`) should end with:

```markdown
## Sources
- [Title](URL) — accessed YYYY-MM-DD
```

Hub `README.md` files and `runbooks/` are navigation/process docs — Sources optional.

When adding questions, use:

```markdown
### Question title
**Prompt:** …
**Probes:** what the interviewer scores
**Strong answer shape:** bullets, not a script
```

Update `INDEX.md` when adding a new page. Append new URLs to `sources/bibliography.md`.

Folders: `career/` | `general/` | `roles/` | `companies/` | `answers/` | `resources/` | `runbooks/` | `sources/`

Soft length: prefer ≤ ~150 lines for ingest; soft max ~200.

## Validation

Before opening a PR: verify links, keep pages concise. Run `./scripts/check.sh`.
