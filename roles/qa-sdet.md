# QA / SDET / quality engineer

Focus: **engineering quality systems** — strategy, automation, CI gates, and release judgment — not reciting ISTQB definitions. Clarify the req: **SDET** (codes test infrastructure, owns gates) vs **manual / exploratory QA** vs **quality analyst** (process, reporting).

## What interviewers probe

| Area | Signals |
| --- | --- |
| Strategy | Risk-based coverage; pyramid vs inverted; when to deviate |
| Automation | Framework design, isolation, flake ownership — not locator trivia |
| Coding | Readable Python/Java/TS with assertions; retry/backoff; data factories |
| CI / infra | Merge vs nightly gates; parallelization; secrets; reporting |
| Judgment | Ship-or-stop with blast radius; AI tools without losing rigor |

2026 loops add **Playwright-style auto-wait**, **contract tests** for services, and **how you test non-deterministic AI features**.

## Sample questions

### Strategy

1. Test pyramid — layers, typical mix, when you invert it (UI-heavy product, untestable legacy, microservices).
2. What to automate vs keep exploratory (stable/high-frequency vs new UX / judgment).
3. Risk-based plan for checkout, login, or payments (likelihood × impact).
4. Shift-left: where QA sits in design review, pre-commit, PR, nightly.
5. How you measure effectiveness (escaped defects, flake rate, mutation score) — not line coverage alone.

### Framework & tooling

1. Design an automation stack from scratch (driver/config, page or component objects, data factories, reporting).
2. Page Object Model — when it helps vs when component objects fit better.
3. Playwright vs Selenium vs Cypress — isolation, auto-wait, parallelism (name tradeoffs).
4. Parallel execution: unique data, no shared state, worker-local DBs or API setup.
5. Config across local / staging / prod — env files + secrets manager, never hardcoded creds.

### Debugging & CI

1. Test is flaky at 5–20% in CI — reproduce, classify (timing, data, env, race), quarantine with owner/date, **do not** “retry forever.”
2. Suite takes 4 hours — move checks down the pyramid, shard E2E, drop duplicates.
3. Quality gates: lint+unit on commit; contracts/integration on PR; full E2E + perf nightly; release = critical path + no open Sev-1.

### System / product (senior)

1. Test strategy for a **microservice checkout** (unit rules, Pact-style contracts, few E2E journeys, fault injection).
2. Test an **AI-powered** feature — golden sets, evals, never exact-string match on model text.
3. Design a **flaky-test detector** (pass-rate band, owner, quarantine queue).

### Behavioral

1. Release tonight; one critical test flakes — ship or stop? (payments/auth/data loss → block unless flagged + rollback).
2. Developer says “not reproducible” — build, env, request IDs, pair, shared truth.
3. Time your automation **caught** a bug before prod (metric, not slogan).

## Strong answer shape (flake)

1. Reproduce with repeats / seed / same shard.
2. Name the class (sleep vs condition wait; shared fixture; 3rd-party flake).
3. Fix the class; quarantine only with ticket + owner + due date.
4. Track flake rate as a quality SLO — retries hide the fire.

## Strong answer shape (pyramid)

> Many fast unit/API tests; few E2E on critical paths. Playwright (or similar) for the top: auto-wait, fresh browser context per test, role locators. Deviate when the UI *is* the product or contracts matter more than units.

## Level expectations

| Level | Depth |
| --- | --- |
| Junior | Pyramid, POM, one runner, basic API checks |
| Mid | Isolation, flake RCA, CI gates, risk-based plans |
| Senior | Test infra design, release calls, AI/eval literacy, org quality bar |

## Also study

- [../roles/backend.md](backend.md) — APIs, idempotency, rate limits
- [../roles/devops-sre.md](devops-sre.md) — pipelines, incidents
- [../general/take-homes.md](../general/take-homes.md) — if the loop includes a take-home harness

## Sources

- [Top 50 SDET Interview Questions 2026 — QASkills.sh](https://qaskills.sh/blog/sdet-interview-questions-2026) — accessed 2026-08-22
- [SDET Interview Questions 2026 hiring playbook — TheLinuxCode](https://thelinuxcode.com/sdet-interview-questions-and-answers-a-2026-hiring-playbook-from-my-side-of-the-table/) — accessed 2026-08-22
- [Writing tests — Playwright](https://playwright.dev/docs/writing-tests) — accessed 2026-08-22
- [The Practical Test Pyramid — Martin Fowler](https://martinfowler.com/articles/practical-test-pyramid.html) — accessed 2026-08-22
- [System Design for SDET Interviews — ScrollTest](https://scrolltest.com/system-design-sdet-interviews-test-infrastructure/) — accessed 2026-08-22
