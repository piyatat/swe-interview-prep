# Behavioral: production failure — STAR outline

**Prompt:** “Tell me about a production incident or mistake you caused. What happened?”

## Probes

- Ownership vs blame?
- Customer impact?
- What changed afterward (postmortem, guardrails)?

## Strong STAR skeleton

| Part | Content |
| --- | --- |
| **Situation** | Service, severity, detection method (alert/user report) |
| **Task** | Your role on-call or as author of change |
| **Action** | Triage timeline: mitigate → root cause → fix → comms → postmortem |
| **Result** | MTTR, impact bounded, preventive items shipped |

## Action checklist to mention

1. **Mitigate first** — rollback, feature flag, scale up
2. **Communicate** — status page / stakeholders
3. **Root cause** — 5 whys, not witch hunt
4. **Follow-up** — runbook, alert, test, canary

## Metrics that land

- “Restored in 23 minutes; error rate 0.1% → 0”
- “Added integration test; no recurrence in 12 months”

## Weak vs strong

| Weak | Strong |
| --- | --- |
| Hide your role | “I merged the change that…” |
| No systemic fix | Concrete guardrail added |
| Villain story | Blameless + learning |

## Amazon LP mapping

**Ownership**, **Dive Deep**, **Customer Obsession** (if user-facing).

## Sources

- [Behavioral Questions — onlinejobs.tech](https://onlinejobs.tech/behavioral-interview-questions-for-tech-roles-answers-for-ics-leads-and-managers) — accessed 2026-08-22
