# Staff+ / L6 interview loop

**Staff** (Google L6, Meta IC6, Amazon Principal-adjacent IC — labels drift) is the first level where the job is **not personal output**. Interviewers score **multiplicative impact**: architecture that lasts, seniors you lifted, strategy the org actually ran.

Rough test: if you vanished for a quarter, would **only your projects** stall (senior) or also **people you unblocked and a direction that would drift** (staff)?

Title inflation is common. Ask the recruiter what **scope** the seat owns (one-team tech lead vs cluster voice). Pair with [downleveling.md](downleveling.md) — staff stories that sound like “I shipped the ticket” get leveled down.

## Loop shape (typical 5–8 weeks)

| Round | What they score |
| --- | --- |
| Recruiter | Comp + **scope** calibration (heavier than senior) |
| Hiring manager | Leverage, 30/60/90, how you work with directors |
| Coding | Often shorter; sometimes **review/pair** posture, not L5 grind |
| System design ×1–2 | Multi-region, cost, **migration**, evolving requirements |
| Project deep-dive | 60–90 min on a **real** system you owned 6+ months |
| Cross-team / ambiguity | Influence without authority; blob → sequenced work |
| Exec / bar-raiser | Strategy, judgment, consistency with the packet |

## Four layers in design (staff vs senior)

Senior can draw boxes. Staff also covers:

1. **Technical** — data flow, consistency, APIs
2. **Operational** — who is on-call, deploys, what pages
3. **Evolutionary** — what you expect to replace in 18 months
4. **Organizational** — team seams, ownership after the next reorg

After the target architecture, spend minutes on **phased rollout** (dual-write, compare, rollback). Clean-sheet designs with no migration read mid-level.

## Scope & ambiguity (often disguised as behavioral)

Prompt sounds like STAR: “unclear requirements.” Rubric is: shrink the blob (spikes, straw-man RFC, data), **make decisions you could have deferred**, bring people along, result = **org capability** that did not exist.

Weak: a hard but well-specified project a directed senior could have executed.

## Cross-team leadership

Score: identify real decision-makers; translate costs into **their** language; accept a directionally right compromise. “I won the political fight” fails; **dissolve** the conflict into a shared problem.

## Mentorship evidence

“I mentored three people” is empty. Prefer artifacts + outcomes: office hours → two promotions; onboarding doc → time-to-first-PR halved.

## Will Larson archetypes (know which seat)

| Archetype | Shape |
| --- | --- |
| **Tech lead** | One team / cluster; partners with EM; delegates the hardest code |
| **Architect** | Enduring domain (API, storage, frontend platform) |
| **Solver** | Dropped on knotty org-priority fires; then leaves |
| **Right hand** | Scales an exec; rare until very large orgs |

## Prep checklist

- [ ] 1–2 CV projects rehearsed **cold**: choices you would reverse
- [ ] 8–10 STARs tagged: strategy, reverse a decision, raise the bar, failed bet
- [ ] Design practice with **$ / latency / migration**, not only QPS
- [ ] Recruiter: confirm if coding is grind vs review-hybrid

## Related

- [behavioral.md](behavioral.md) and [../answers/behavioral-leadership.md](../answers/behavioral-leadership.md)
- [system-design.md](system-design.md)
- [../companies/faang-big-tech.md](../companies/faang-big-tech.md)

## Sources

- [Staff archetypes — Will Larson / staffeng.com](https://staffeng.com/guides/staff-archetypes/) — accessed 2026-08-22
- [Staff Software Engineer interview prep — Calibrd](https://www.calibrd.com/interview-prep/staff-software-engineer) — accessed 2026-08-22
- [Staff Engineer Interview Guide: The L6 Loop — PhantomCodeAI](https://www.phantomcodeai.com/blogs/staff-engineer-interview-guide) — accessed 2026-08-22
- [Staff Engineer Interview Questions (2026) — ShadeCoder](https://articles.shadecoder.com/staff-engineer-interview-questions-2026-complete-guide-answers-and-prep-plan) — accessed 2026-08-22
