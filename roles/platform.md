# Platform engineer (internal developer platform)

Focus: **platform as a product** — golden paths, self-service, adoption — not ticket-queue DevOps. Clarify the req: **platform** (other engineers are users) vs **[SRE / DevOps](devops-sre.md)** (production reliability, incidents, error budgets). Tooling overlaps (Kubernetes, Terraform, CI); the **rubric** does not.

CNCF: an internal platform is a curated set of capabilities that **reduces cognitive load** and bakes in guardrails. A **golden path** is an opinionated bundle (template + docs + pipeline) for a common outcome (e.g. new service to prod). Interviewers score whether product teams would **choose** your path.

## What interviewers probe

| Area | Signals |
| --- | --- |
| Product | Users, jobs-to-be-done, what you **leave out** of the path |
| Adoption | Voluntary usage, time-to-first-deploy, ticket volume **down** |
| Abstractions | Hide Kubernetes; do not write manifests **for** teams forever |
| Guardrails | Secure/compliant default; escape hatch for real exceptions |
| Change | Migrate CI without breaking Friday deploys — sequencing, rollback |
| Cross-func | Product engineers would use it; SREs get quotas/PDBs baked in |

2026 loops often include a **cross-functional panel**. A product engineer’s “I would not use this” can outweigh a strong infra deep-dive.

## Sample questions

### Golden path & IDP

1. Design a golden path for a new microservice across ~15 teams — defaults (CI, observability, catalog) vs what stays a team choice (e.g. datastore).
2. How do you measure platform success? (**Adoption / time-to-prod / support load**, not cluster uptime alone.)
3. Self-service DB or env: API/CLI/portal; credentials; no week-long ticket.
4. Over-prescriptive path abandoned — how you would thin it.

### Change & product

1. Move 8 teams Jenkins → GitHub Actions without missing release cadence — pioneer team, plugin debt, rollback, exec comms.
2. Three teams want conflicting portal plugins — one configurable path vs fix the deployment-model split first.
3. Backstage (or similar) for 200 engineers: start with a **trusted service catalog** (CODEOWNERS, on-call), not a plugin shopping list.

### Abstractions & multi-tenant

1. Team does not want to write YAML — scaffolder / Helm / composition, not “I’ll open a PR for them.”
2. Shared cluster: NetworkPolicy, RBAC, quotas; one team’s ML burst jobs — priority, burst quota, or node pool.
3. Observability golden path: RED/golden signals + correlation IDs by default; business metrics left to teams. Alert fatigue: high-signal defaults, team overrides, delete alerts that never page.

### Judgment

1. Security wants a control that would kill adoption — smallest safe default + exception process.
2. Platform NPS / interviews with users — evidence you treat engineers as customers.

## Strong answer shape (design round)

1. **Who** is the user (new hire vs staff backend vs data)? **How many** teams?
2. Current friction (deploys/week, tickets, failed prod).
3. Thinnest path that makes the **right** thing the **easy** thing.
4. Guardrails in the template (scan, identity, quotas) vs after-the-fact review.
5. Metrics and a sunset plan for the old way.
6. What you will **not** build in v1.

## Common mistakes

- Interviewing as senior DevOps: “I built X” with no **who used it**.
- Measuring only SLO/uptime of the platform cluster.
- Absorbing all YAML yourself (you become the ticket queue).
- Golden path with no escape hatch — or no path, only a wiki.
- Starting a portal before ownership data exists.

## Also study

- [devops-sre.md](devops-sre.md) — K8s debug, SLOs, incidents (baseline, not the differentiator)
- [../general/system-design.md](../general/system-design.md) — APIs, tenancy, failure modes
- [../general/behavioral.md](../general/behavioral.md) — influence without authority

## Sources

- [CNCF Platforms White Paper](https://tag-app-delivery.cncf.io/whitepapers/platforms/) — accessed 2026-08-24
- [Platform Engineer Interview Questions 2026 — KORE1](https://www.kore1.com/platform-engineer-interview-questions/) — accessed 2026-08-24
- [Platform engineer interview questions — LastRound AI](https://lastroundai.com/blog/platform-engineer-interview-questions) — accessed 2026-08-24
- [Platform Engineering vs SRE — Medium / mr-dops](https://medium.com/mr-dops/platform-engineering-vs-sre-the-real-difference-6d3472052080) — accessed 2026-08-24
