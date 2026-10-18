# Arm engineering track

Sits beside [qualcomm.md](qualcomm.md), [intel.md](intel.md), and [amd.md](amd.md): **CPU / GPU / NPU IP and the Arm ISA** (Cortex, Neoverse, Ethos), not a Snapdragon SoC loop and not a foundry. Official [About](https://www.arm.com/company): compute from milliwatts at the edge to megawatts in the datacenter; licensees include the large cloud and phone vendors. Recruiter confirms **CPU vs GPU vs tools vs software / BSP vs performance modeling**, C/C++ vs Python, **HireVue vs live phone**, and site (Cambridge, Austin, Bangalore, …).

Typical timeline **varies by group**. Embedded / C: [../roles/embedded.md](../roles/embedded.md). Systems: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (10x Mindset)

Do **not** invent Amazon-style LPs. Use the official **10x Mindset** on [Life at Arm](https://careers.arm.com/life-at-arm) (ten factors under **One Arm** and **Accelerate Impact**). Map **your** stories.

| Official factor | What they score |
| --- | --- |
| **Passion for the mission** | Care about the IP, customers, and compute/AI strategy |
| **Deliver as One Arm** | Cross-function; collaboration is not always consensus |
| **Build extraordinary teams** | High bar; candid feedback; inclusive teams |
| **Challenge skillfully** | Disagree with a reason; then decide |
| **Root out inefficiencies** | Simplify; respect real silicon / legal constraints |
| **Relentlessly push boundaries** | “How can this be better?” without infinite polish |
| **Move with urgency and find a way** | Bias for action under uncertainty |
| **Own it** | Outcome, not a ticket; bring a solution |
| **Be decisive in ambiguity** | Vague idea → a concrete plan |
| **Optimize for endurance** | Pace you can sustain; Day of Care / hybrid exists |

Official [hiring process](https://careers.arm.com/hiring-process): hybrid working is **team-set** inside a face-to-face framework. “Why Arm?” that only says “phones run ARM” fails. Name a **pipeline, cache, ISA, power, or firmware** problem you have lived.

## Official + reported process

Official hiring-process page is the skeleton. Steps **differ by location and role**; the recruiter explains yours. Digital first-round detail is on that page (HireVue **or** telephone).

| Stage | Official / reported |
| --- | --- |
| Apply | Experienced JD or Emerging Talent program |
| First round | Official: **HireVue digital or telephone** — interests + **day-to-day technical skills** |
| Follow-up | Official: deeper technical with **teams, potential teammates, people who grew here**; Talent Acquisition + HM + future teammates |
| Offer | Benefits / equity on the careers site |

2026 reports (Calibrd, Glassdoor, intern write-ups): recorded **why-Arm + CV project**, spoken **cache / pipeline / coherency**, short **C/C++** (strings, pointers, NULL). Treat extra coding hours as **reported**. Ask whether **your** HireVue includes a timed coding panel.

## How this track differs

| vs Qualcomm / Intel / AMD | vs FAANG |
| --- | --- |
| Product is **ISA / IP licensed into other chips**, not a phone SKU you ship | Official first hour is often **async HireVue**, not a live pad |
| 10x Mindset is **ten named factors**, not LPs | Design is **CPU pipeline, cache, firmware, tools**, not “design Twitter” |
| Weak **C + architecture talk** fails even if a medium passes | Emerging Talent path is a first-class official track |

## Coding and design flavor

Live / HireVue coding: C pointers, in-place strings, arrays, bit ops — narrate UB and tests. Domain: five-stage pipeline + load-use hazard, tag/index/offset, MESI in one sentence, `volatile` vs memory-mapped IO. Senior: performance model, interconnect, compiler / codegen. Related: [../answers/coding-linked-list.md](../answers/coding-linked-list.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Arm group (CPU, GPU, tools, performance) — portable “I like chips” is weak.
2. HireVue: walk one CV project in **two minutes** with a number (latency, power, coverage).
3. Spoken: address split for a tiny direct-mapped cache; what a miss does.
4. C: reverse a buffer in place; what happens on `NULL` or a string literal.
5. 10x: challenge skillfully — you pushed back, then owned the decision.

## Prep checklist

- [ ] Read [Hiring process](https://careers.arm.com/hiring-process) + [Life at Arm / 10x](https://careers.arm.com/life-at-arm) + [About Arm](https://www.arm.com/company)
- [ ] Recruiter: org, HireVue vs phone, C vs Python, hybrid site, AI-on-pad
- [ ] One timed C easy + cache/pipeline aloud + STAR vs several **10x** factors
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Our Hiring Process — Arm Careers](https://careers.arm.com/hiring-process) — accessed 2026-10-18
- [Life at Arm](https://careers.arm.com/life-at-arm) — accessed 2026-10-18
- [About Arm](https://www.arm.com/company) — accessed 2026-10-18
- [Arm Careers](https://careers.arm.com/) — accessed 2026-10-18
- [Arm Interview: HireVue, Graduate Software Engineer — Calibrd](https://www.calibrd.com/interview-prep/arm-interview) — accessed 2026-10-18
