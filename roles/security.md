# Security / AppSec engineer

Focus: **building controls, reading code like an attacker, threat modeling, and risk-vs-velocity judgment** — not reciting the CIA triad. Clarify the req: **security engineer** (designs/hardens) vs **analyst** (triage/response) vs **AppSec** (SDLC, code review, paved roads).

## What interviewers probe

| Area | Signals |
| --- | --- |
| Secure design | Identity, trust boundaries, abuse cases, proportionate controls |
| Code review | Name vuln + exploit + fix + class-level guardrail |
| Cloud / IAM | Least privilege, leaked keys, CI as production access |
| Supply chain | Dependencies, provenance, runners, artifact integrity |
| Judgment | Smallest safe path; document owner + date; not “block” or “wave through” |

## Sample questions

### Secure design & threat modeling

1. Design auth for a customer-facing API (callers, token lifetime, leak day, rate limits).
2. Threat-model a file-upload, payment webhook, or OAuth integration out loud.
3. Design authentication for an internal service mesh (workload identity, mTLS vs mesh complexity).
4. How do you decide which changes get a security review before ship?

### Code review / AppSec

1. Review a snippet — injection, IDOR, unsafe deserialization, secrets, SSRF.
2. PR contains a hardcoded cloud access key — ordered response.
3. How do you find this bug **class** at scale (lint, paved-road library, CI rule)?

### Cloud, identity, CI/CD

1. Inherit an AWS account where many roles have `AdministratorAccess` — first 30 days.
2. Secure a pipeline that deploys to production (OIDC over static secrets, who can edit YAML, runner blast radius, signed artifacts).
3. Which logs first in a suspected cloud breach — identity, control plane, then data access?

### Judgment & culture

1. Friday ship; scanner flags a critical/medium dependency — go.
2. Time you were overruled on a risk call.
3. How do you get teams to adopt tooling without becoming the department of no?

## Strong answer shape (code review)

1. Name the issue (e.g. string-concat SQL).
2. Concrete exploit path (who can trigger it, what they get).
3. Fix this instance (parameterize).
4. Guardrail so the class cannot return (lint / API that forbids concat in the data layer).

## Strong answer shape (ship-blocker)

1. Is it **reachable** here (internet-facing? authz already in front?).
2. Smallest safe path: targeted patch, feature flag, WAF/compensating control.
3. Document risk, owner, date — neither “block forever” nor “let it slide.”

## OWASP Top 10:2025 (awareness, not trivia)

Interviewers care that you can **map a bug to a category and a control**, not recite order. 2025 adds **software supply chain failures** and **mishandling of exceptional conditions**; SSRF now sits under broken access control.

| ID | Theme to speak to |
| --- | --- |
| A01 Broken Access Control | IDOR, missing object checks, SSRF |
| A03 Supply chain | Compromised deps, unsigned artifacts, poisoned CI |
| A05 Injection | SQL/command/template — fix the class |
| A07 Authentication failures | Session, MFA, credential stuffing |
| A10 Exceptional conditions | Fail-open, swallowed errors, crash → bypass |

## Level expectations

| Level | Depth |
| --- | --- |
| Junior | OWASP classes, basic review, one language for automation |
| Mid | Threat model a feature; CI secrets; cloud IAM hygiene |
| Senior | Risk vs velocity, paved roads, tabletop leadership, spikes (auth / cloud / AppSec) |

## Also study

- [../general/cs-fundamentals.md](../general/cs-fundamentals.md) — networking, crypto basics
- [../roles/backend.md](backend.md) — APIs, auth, OWASP overlap
- [../roles/devops-sre.md](devops-sre.md) — CI/CD, secrets, incidents

## Sources

- [Security Engineer Interview Questions 2026 — InfoSec Job Board](https://www.infosecjobboard.com/blog/security-engineer-interview-questions-2026) — accessed 2026-08-22
- [Application Security Interview Questions 2026 — InfoSec Job Board](https://www.infosecjobboard.com/blog/appsec-interview-questions-2026) — accessed 2026-08-22
- [Cybersecurity Engineer Interview Questions 2026 — KORE1](https://www.kore1.com/cybersecurity-engineer-interview-questions-2026/) — accessed 2026-08-22
- [OWASP Top 10:2025](https://owasp.org/Top10/2025/) — accessed 2026-08-22
- [Application security interview questions — jassics/security-interview-questions](https://github.com/jassics/security-interview-questions/blob/main/application-security-interview-questions.md) — accessed 2026-08-22
