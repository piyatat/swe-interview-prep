# Optum / UnitedHealth Group engineering track

Sits beside [epic-systems.md](epic-systems.md) and [veeva.md](veeva.md): **payer / care-delivery technology** (claims, EHR adjacency, pharmacy, analytics) — not an EHR-house loop and not “another Java bank.” Official [Mission & values](https://www.unitedhealthgroup.com/uhg/mission-values.html) apply across **UnitedHealth Group, UnitedHealthcare, and Optum**. Recruiter confirms **Optum vs UHC vs corporate**, Java / .NET / Python, U.S. vs GCC, and whether the first gate is CodeSignal.

Typical timeline **days to several weeks** (campus TDP can be faster). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). SQL: [../general/sql-interviews.md](../general/sql-interviews.md). AI-in-the-loop: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). OA: [../general/online-assessments.md](../general/online-assessments.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (UHG values)

Do **not** invent Amazon LPs. Official [values](https://www.unitedhealthgroup.com/uhg/mission-values.html) (same six on [Careers at Optum](https://www.unitedhealthgroup.com/careers/en/work-at-optum.html)). Map **your** stories.

| Official line | What they score |
| --- | --- |
| **Integrity** | Right thing + follow-through; PHI / Quality, not a slogan |
| **Compassion** | Listen, advocate, **act with urgency** for a member or colleague |
| **Inclusion** | All voices heard — you made space, not “diverse team” |
| **Relationships** | Cross-clinic / vendor / payer collaboration with a named outcome |
| **Innovation** | Learned from a miss; next version was better |
| **Performance** | Quality the first time; a metric you actually moved |

Mission: **help people live healthier lives** and **make the health system work better for everyone**. “Why Optum?” that only says “healthcare is huge / WFH” fails. Name **access, affordability, outcomes, or PHI-safe data**.

## Official + reported process

Official [job seeker resources](https://www.unitedhealthgroup.com/careers/en/job-seeker-resources.html): apply → **assessment if applicable** → recruiter review (days–weeks) → phone / video / in-person → offer. Official interview types: in-person, **virtual live**, or **digitally recorded**. Official line: **all digital interviews are reviewed by a team member, not AI**. Official [interview tips](https://www.unitedhealthgroup.com/careers/en/job-seeker-resources/interview-tips.html): practice question does not go to recruiters; ~3 min per answer; usually up to **3 rerecords**.

| Stage | Official / reported |
| --- | --- |
| Apply | UHG dashboard — filter Optum vs UnitedHealthcare |
| Assessment | Some roles; TDP / SWE reports: **CodeSignal** 1–2 h, often **AI-assisted** debug / implement in an existing repo (Java/Spring + Angular, or other) |
| Recruiter | Fit, location, stack; recorded digital vs live |
| Tech | 45–90 min: Java / SQL / resume systems; some loops add live DSA |
| HM / onsite | Project deep-dive + scale (1 → 1M) + values |

Campus TDP (takeUforward / Glassdoor 2026): AI-assisted OA → short HR → 1 h technical. Experienced full-stack reports add a virtual Java/Spring hour then a face-to-face design. Dataford (2026, mixed roles): recruiter → OA / tech screen → SQL/Python or coding → architecture → HM / behavioral. **Ask** which of those you actually have.

Live coding: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Official “humans review recorded interviews” ≠ “paste Copilot in a live CoderPad.” Confirm the **CodeSignal AI-user** vs AI-off live rule.

## How this track differs

| vs Epic Systems | vs FAANG |
| --- | --- |
| Official **six** UHG values, not a Verona generalist OA | Medium DSA **or** AI-in-repo, then **Java + SQL + PHI** |
| Design is **claims / eligibility / EHR-adjacent**, with HIPAA in v1 | Recorded digital screen is a **human** review, not a model |
| Optum vs UHC vs corporate is a **real** org split | Comp is healthcare-tech bands — confirm RSUs vs cash |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Optum tech org — Integrity when a PHI boundary and a delivery date disagreed.
2. CodeSignal-style: four tickets in an unfamiliar Spring + UI repo; you steer the agent and **verify**.
3. Live: longest palindrome / hashmap; SQL join; `@Component` vs `@Bean`.
4. Design: eligibility or claims ingest — at-least-once vs exactly-once, audit trail, fail-closed on authz.
5. Compassion + Performance: you paged for a member-facing outage and still hit Quality.

## Prep checklist

- [ ] Read [mission / values](https://www.unitedhealthgroup.com/uhg/mission-values.html) + [Optum careers](https://www.unitedhealthgroup.com/careers/en/work-at-optum.html) + [hiring steps](https://www.unitedhealthgroup.com/careers/en/job-seeker-resources.html) + [interview tips](https://www.unitedhealthgroup.com/careers/en/job-seeker-resources/interview-tips.html)
- [ ] Recruiter: CodeSignal vs none, AI-in-OA, live AI, Optum vs UHC, Java vs Python
- [ ] Six STAR mapped to the values; one **PHI / Quality** story
- [ ] One AI-assisted debug in a strange repo + SQL + one eligibility / claims sketch
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Mission & Values — UnitedHealth Group](https://www.unitedhealthgroup.com/uhg/mission-values.html) — accessed 2026-11-22
- [Careers at Optum — UnitedHealth Group](https://www.unitedhealthgroup.com/careers/en/work-at-optum.html) — accessed 2026-11-22
- [Job seeker resources (hiring process) — UHG Careers](https://www.unitedhealthgroup.com/careers/en/job-seeker-resources.html) — accessed 2026-11-22
- [Interview tips — UHG Careers](https://www.unitedhealthgroup.com/careers/en/job-seeker-resources/interview-tips.html) — accessed 2026-11-22
- [Optum Interview Process 2026 — Dataford](https://dataford.io/interview-guides/optum) — accessed 2026-11-22
- [Optum TDP Intern interview experience — takeUforward](https://takeuforward.org/community/interview-experiences/optum-tdp-intern-interview-experience) — accessed 2026-11-22
