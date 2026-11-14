# Garmin engineering track

Sits beside [texas-instruments.md](texas-instruments.md) and [analog-devices.md](analog-devices.md): **GPS + aviation / marine / outdoor / fitness consumer electronics** — not an MCU-vendor lab hour and not a phone SoC loop. Official careers: *We fuel people's passions*; mission is to be an **enduring company** by creating superior products for automotive, aviation, marine, outdoor and sports. Recruiter confirms **aviation vs marine vs fitness vs outdoor vs Connect IQ / mobile**, C vs C++ vs Java / Swift, **Olathe HQ vs Yarmouth / Chandler / Cluj / …**, and in-person vs virtual panel.

Typical timeline **~3–5 weeks** (Dataford). Embedded: [../roles/embedded.md](../roles/embedded.md). LLD: [../general/low-level-design.md](../general/low-level-design.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (no numbered LP list)

Do **not** invent Amazon LPs. Garmin does **not** publish a five-word leadership-principle list on careers. Use official language, then map **your** stories.

| Official language | What they score |
| --- | --- |
| **Fuel people's passions** | You use or care about the product domain (flight, boat, trail, race) |
| **Superior / essential products** | Quality + reliability over a clever demo |
| **Secure, reliable, high-quality software** (SWE JDs) | A ship you refused to send with a sensor lie |
| **Teamwork / cross-functional** (JDs) | Hardware + firmware + QA in the same argument |
| **Self-motivated, keep learning** (JDs) | A stack you picked up because the device needed it |

Official JDs (embedded Linux / marine C++): Yocto, FreeRTOS, IPC, collaboration with hardware and app teams. “Why Garmin?” that only says “I like watches / GPS” fails. Name an **ISR, GNSS, battery, or certified-avionics** problem you have lived.

## Official + reported process

No public numbered SWE stage list on careers. Dataford (2026) + TechPrep. Treat stages as **reported**. **Ask** HackerRank vs live.

| Stage | Official / reported |
| --- | --- |
| Apply | [Careers](https://www.garmin.com/en-US/careers/) / [job search](https://careers.garmin.com/jobs) |
| Recruiter / HR | Why Garmin, site, org (aviation vs fitness vs …), relocation |
| OA (some teams) | Guides: **HackerRank** arrays / strings / fundamentals — not contest-hard |
| Technical screen | C / C++ / Java mechanics, memory, OOP; often Microsoft Teams |
| Final panel | 3–4 hours on-site or virtual; coding + CS + project + HM; Olathe often **rotating 45–60 min** |

Guides: pointers, `volatile`, mutex vs semaphore, bit masks on a register, not “design Twitter.” Pair: [../general/cs-fundamentals.md](../general/cs-fundamentals.md), [../general/behavioral.md](../general/behavioral.md).

## How this track differs

| vs TI / ADI | vs FAANG |
| --- | --- |
| Product is a **device people fly / boat / run with**, not a catalog IC | Design is **battery / GNSS / ISR / display**, not a social feed |
| No official LP bingo; passion + reliability language on JDs | Coding is **C / embedded-adjacent**, not only Blind-75 |
| HQ **Olathe**; many desks expect on-site / lab | Confirm aviation (DO-178 flavor) vs fitness app — they diverge |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** product line — a safety or battery miss you owned.
2. Live: medium array / string **or** bit-mask a 16-bit register; working solution first.
3. Mutex vs binary semaphore protecting a sensor buffer; ISR rules.
4. Design: log GPS points on a watch that sleeps most of the second.
5. Questions: aviation vs marine vs fitness, site, HackerRank vs skip, AI-in-pad.

## Prep checklist

- [ ] Read [Careers](https://www.garmin.com/en-US/careers/) + current SWE JD for **your** segment
- [ ] Recruiter: org, language, Olathe vs other, OA vs live, AI policy
- [ ] Three STAR: quality bar, cross-functional hardware, a passion you can name
- [ ] One timed medium + one embedded (`volatile` / circular buffer / bits) sketch
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Garmin](https://www.garmin.com/en-US/careers/) — accessed 2026-11-14
- [Garmin Cluj careers (mission language) — Garmin](https://www.garmin.com/ro-RO/blog/careers/garmin-cluj-openings/) — accessed 2026-11-14
- [Embedded Linux Software Engineer (C++) — Garmin NZ JD](https://www8.garmin.com/en-NZ/Embedded%20Linux%20Software%20Engineer%20(C++).pdf) — accessed 2026-11-14
- [Garmin Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/garmin/software-engineer) — accessed 2026-11-14
- [Garmin Interview Process 2026 — Dataford](https://dataford.io/interview-guides/garmin) — accessed 2026-11-14
