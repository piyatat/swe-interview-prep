# Anduril engineering track

Sits beside [quant.md](quant.md) and [tesla.md](tesla.md): **defense products + Lattice autonomy**, not a generic FAANG slate. Official [Careers](https://www.anduril.com/careers): hard problems in hard mode; **in-office or in the field**; proud to support **American warfighters**. Official [Mission](https://www.anduril.com/mission): core product is **Lattice** — an autonomous sensemaking platform connecting thousands of systems; they **privately fund R&D** and sell finished products, aiming for **months, not years**. Recruiter confirms **domain** (perception, backend, ML infra, applied ML, embedded), **clearance / US-person** rules on the req, and whether the loop is **Early Careers** vs team-matched.

Typical timeline **~3–4 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). OOD: [../general/low-level-design.md](../general/low-level-design.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official hiring signals (do not invent extra pillars)

From [Careers](https://www.anduril.com/careers) + [Early Careers](https://www.anduril.com/early-careers). Map **your** stories; do not recite a fake LP list.

| Official signal | What they score |
| --- | --- |
| **Self-starter / ownership** | “If you’re not a self-starter, that’s a non-starter”; hit the ground running |
| **Pace with quality** | Monday idea → Friday prototype; ship in months, not years; warfighter quality |
| **Mission alignment** | Work that **directly** affects U.S. / allied capabilities; not “I like hard tech” |
| **Rebuild the Arsenal** | Hyper-scale software-defined defense, not a consulting SOW |
| **Initiative + curiosity** | Early Careers: identify the problem, drive it without constant oversight |
| **Collaborative drive** | Mission is too critical to tackle alone |

“Why Anduril?” that only says “Palantir / SpaceX energy” or “I want to grow” fails. Name a **Lattice, autonomy, contested-network, or sensor-fusion** problem you have lived — and a **specific** reason you want to work in defense.

## Official + reported process

Official pages describe **mission and who they hire**, not a public stage list. Guides (Exponent / Aced, TechPrep, techinterview.org, 2026) — treat counts as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (~30–60 min) | Domain map + **why defense**; product awareness; clearance / US-person on the req |
| Tech screen (~60 min) | HackerRank or collab editor; **deliberately vague**, multi-phase prompt |
| Final (reported 4×60) | Two coding; **OOD you implement**; behavioral with a senior / staff leader |
| Early Careers | Official: not domain-specific; they match after they hear your interests |

Guides: first-contact → offer can be **days per stage**. Experienced hire is often **team-matched first**; C++ / perception / autonomy depth can replace generic DSA.

## How this track differs

| vs Palantir | vs Tesla / NVIDIA |
| --- | --- |
| Defense **products + Lattice**, not Dev vs Delta decomps | Mission hour is **weapons / warfighter comfort**, not cars or GPUs |
| Reported **ambiguous evolving** coding, not a named LC set | OOD is **write the class**, not only boxes on a whiteboard |
| Clearance / US-person is a **gating** question on many reqs | “I only grind LeetCode” misses the OOD + mission hours |

## Coding and design flavor

Screen: underspecified prompt; they score **clarifying questions**, then refactor as constraints arrive — working code per phase beats premature big-O. Onsite coding: graphs / spatial / pathfinding, sometimes **telemetry-shaped** parse. OOD: implement a structure (list, queue, sensor model) with **small methods** and edges (empty, head/tail); they will ask you to split a monolith. Design (team-dependent): command-and-control under **delay or jam**, local fallback, reconcile when the link returns. Related: [../general/low-level-design.md](../general/low-level-design.md), [../answers/system-design-key-value-store.md](../answers/system-design-key-value-store.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** product (Lattice vs air / maritime / counter-UAS) — “defense is important” is weak.
2. Screen: start from a tiny spec; ask volume, memory, duplicates, then extend when the constraint flips.
3. OOD: model a component with insert / query / fail-closed edges; decompose before they ask.
4. Design: agents decide locally when the link drops 30s; who is source of truth on reconnect?
5. Behavioral: honest resume walk — what you would undo, how a manager would rate you.

## Prep checklist

- [ ] Read [Careers](https://www.anduril.com/careers) + [Mission](https://www.anduril.com/mission) (Lattice, products vs traditional primes)
- [ ] Recruiter: domain, Early Careers vs team, clearance / citizenship, AI policy, onsite vs virtual
- [ ] One **ambiguous multi-phase** coding mock + one from-scratch OOD in a plain editor
- [ ] Defense-motivation story that survives a follow-up (not growth / prestige)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Anduril](https://www.anduril.com/careers) — accessed 2026-09-23
- [Mission — Anduril](https://www.anduril.com/mission) — accessed 2026-09-23
- [Early Careers — Anduril](https://www.anduril.com/early-careers) — accessed 2026-09-23
- [Anduril SWE Interview Guide — Exponent / Aced](https://www.tryexponent.com/guides/anduril-software-engineer-interview) — accessed 2026-09-23
- [Anduril's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/anduril-interview-process) — accessed 2026-09-23
- [What Anduril actually asks — techinterview.org](https://www.techinterview.org/post/3233476861/anduril-software-engineer-interview/) — accessed 2026-09-23
