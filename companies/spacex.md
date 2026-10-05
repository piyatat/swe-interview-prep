# SpaceX engineering track

Sits beside [anduril.md](anduril.md) and [tesla.md](tesla.md): **launch / Starlink / Starship software under physical limits**, not a generic FAANG slate. Official [Careers](https://www.spacex.com/careers): mission is **making humanity multiplanetary**; programs named on the page are crew vehicles, Earth-observation launches, **Starlink** broadband, and **Starship**. Culture copy: hire top talent and cultivate **merit**; “hard work and innovative solutions.” Recruiter confirms **org** (avionics vs Starlink vs ground / mission ops vs factory tools), **site** (Hawthorne, Starbase, Redmond, Bastrop, …), and **US-person / export-control** on the req.

Typical timeline **4–8 weeks** (2026 guides). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Embedded: [../roles/embedded.md](../roles/embedded.md). Debug: [../general/debugging-rounds.md](../general/debugging-rounds.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (mission + merit)

Do **not** invent Amazon-style LPs. SpaceX does **not** publish a numbered values table. Use careers language, then map **your** stories.

| Official / reported | What they score |
| --- | --- |
| **Multiplanetary mission** (careers) | Why **this** vehicle / constellation / factory — not “hard problems” |
| **Merit + hard work** (careers) | Concrete shipped work; launch-campaign hours are real — say the trade |
| **US-person / ITAR gate** (reported) | Recruiter confirms status on the req in the first minutes |
| **Org-specific physics** (reported) | Worst-case timing, degraded links, ugly telemetry — not average-case web |

“Why SpaceX?” that only says “I have always wanted to work there” fails. Name a **Falcon / Dragon / Starlink / Starship** engineering decision you have actually read, or a hardware bug you personally measured.

## Official + reported process

Careers lists openings and programs, **not** a full SWE stage list. 2026 guides (techinterview.org, TechPrep, CleverPrep). Treat stages as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (~20–30 min) | Mission fit; **org + site**; US-person / export-control |
| Hiring manager | Why **this** team; resume depth |
| Tech phone (~45–60 min) | Live coding + fundamentals; sometimes C++ / systems |
| Take-home / timed assess | Guides: **~3–4 hours**; telemetry parse, framing/checksum, small simulator — **code-review** grading, not Blind-75 |
| Onsite (4–6 rounds) | Project presentation; coding; design from **physical limits**; debug of code you did not write; director on senior |
| Offer | Private company: **tenders**, not public RSUs — price liquidity separately |

Ask the recruiter **which org** before you prep. Avionics (deterministic C++, no heap in the hot path) is not Starlink (constellation state, handover, degraded RF).

## How this track differs

| vs FAANG | vs Anduril / Tesla |
| --- | --- |
| Design is **bandwidth / power / time**, not load-balancer + Redis | Mission is **multiplanetary launch + Starlink**, not Lattice or cars |
| Take-home is often a **parser / protocol / physics** slice | Hours and private equity are part of the offer conversation |
| Debug round: race, wrap, watchdog, ISR — [../general/debugging-rounds.md](../general/debugging-rounds.md) | US-person gate is **earlier and harder** than most SaaS loops |

## Coding and design flavor

Guides: gold-plating a 300-line parser with DI containers **loses**. Build, survive truncated packets, tests on ugly input, readable at 2am. Onsite design: a satellite already out of view cannot retry forever; a 20 ms budget means you name which call you **cannot** afford. Related: [../answers/system-design-pubsub.md](../answers/system-design-pubsub.md), [../general/cs-fundamentals.md](../general/cs-fundamentals.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** org (Starlink vs Starship avionics vs ground tools) — “space is cool” is weak.
2. Take-home: parse a documented binary stream; do not crash on a short frame; add a test.
3. Debug: watchdog trips in the field, never on the bench — hypothesis, then what you **measure**.
4. Design: constellation handover when the link degrades (not fails cleanly).
5. Questions for them: org, site, take-home vs Codility, AI-in-pad, hours during a campaign.

## Prep checklist

- [ ] Read [Careers](https://www.spacex.com/careers) + current [Updates](https://www.spacex.com/updates) for the program you claim
- [ ] Recruiter: org, site, US-person, take-home vs live, AI policy
- [ ] One timed **parse / protocol** slice + one live debug of unfamiliar C++
- [ ] One measured hardware-or-link bug story (symptom → measurement → fix)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md) (private tenders ≠ public RSUs)

## Sources

- [Careers — SpaceX](https://www.spacex.com/careers) — accessed 2026-10-05
- [Updates — SpaceX](https://www.spacex.com/updates) — accessed 2026-10-05
- [Why the SpaceX interview feels nothing like a FAANG loop — techinterview.org](https://www.techinterview.org/post/3233476863/spacex-interview-vs-faang-loop/) — accessed 2026-10-05
- [SpaceX's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/spacex-interview-process) — accessed 2026-10-05
- [SpaceX Software Engineer Interview — CleverPrep](https://www.cleverprep.com/companies/spacex/software-engineer) — accessed 2026-10-05
