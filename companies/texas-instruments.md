# Texas Instruments engineering track

Sits beside [qualcomm.md](qualcomm.md) and [intel.md](intel.md): **analog / embedded semiconductor software** (MCU firmware, drivers, RTOS, TI.com tools), not a GPU-kernel loop and not an EDA desktop ([synopsys.md](synopsys.md), [cadence.md](cadence.md)). Official [careers](https://careers.ti.com/): apply on the TI career site. Recruiter confirms **embedded firmware vs applications vs cloud/tools**, C vs C++, Dallas / other sites, and intern vs experienced loop.

Typical path (official career-prep video): resume review → invitation to interview. **Interns and new college graduates** (US and most countries): **two virtual interviews**. **Experienced hires:** about **two to four** virtual interviews. Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture

Do **not** invent Amazon LPs. Official [Living our values](https://www.ti.com/lit/ml/szzb178/szzb178.pdf). Map **your** stories.

| Official value | Careers one-liner |
| --- | --- |
| **Trustworthy** | Integrity; do the right thing; honest and dependable |
| **Inclusive** | Unlock potential; respect; put ideas on the table |
| **Innovative** | Smaller, cheaper, faster, lower power; curiosity + persistence |
| **Competitive** | Challenge yourselves; know the score; attract and keep the best |
| **Results-oriented** | Customer- and market-driven; deliver commitments; urgency |

“Why TI?” that only says “Dallas / analog is stable” fails. Name a **register, ISR, power, or protocol** problem you have lived — they ship silicon **and** the firmware that talks to it. Interns: official [behind-the-chip intern path](https://www.ti.com/en-us/about-ti/behind-chip/articles/the-future-starts-here-3-insights-on-the-journey-from-intern-to-full-time-tier).

## Official process

Official [application and interview process](https://www.ti.com/bin/ti/transcripts/6265474659001_en-us.txt) (TI career-prep). Recruiter stays the guide for next steps.

| Stage | Official |
| --- | --- |
| Resume | Reverse-chronological; **keywords** from the job description |
| Screen | Hiring team reviews; fit → interview invite |
| Intern / new grad | **Two virtual interviews** (US and most countries) |
| Experienced | Average **two to four** virtual interviews |
| Content | Typically **behavioral (STAR)**; technical roles also **assess technical skills** |
| Virtual setup | Test the tool; quiet, well-lit; interviews are **two-way** — bring questions |
| Follow-up | Recruiter on next steps |

Reports (Dataford 2026; campus): aptitude / domain OA; then C / bits / ISR / SPI vs I2C / memory map; some loops add a project presentation. Treat extra OA and round **count** as **reported**. Pair: [../roles/embedded.md](../roles/embedded.md), [../general/behavioral.md](../general/behavioral.md).

## How this track differs

| vs Qualcomm / NVIDIA product silicon | vs Cadence / Synopsys EDA |
| --- | --- |
| Product is **TI analog + MCU silicon + firmware**, not a modem or GPU | Software **on or next to the chip**, not a designer’s place-and-route suite |
| Official **five values** + STAR in every loop | Official intern/new-grad **two** virtuals vs experienced 2–4 |
| Bits, ISRs, and protocols beat social-feed design | C on a constrained MCU more than C++ graph geometry |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** analog house — a power, timing, or driver constraint, not “I like embedded.”
2. C: pointers vs arrays, stack vs heap on an MCU, what you **must not** do in an ISR.
3. Set / clear / toggle a bit in a control register; count set bits — [../answers/coding-number-of-1-bits.md](../answers/coding-number-of-1-bits.md).
4. SPI vs I2C vs UART: clocking, who is master, when you pick which.
5. Values: a time you delivered under a date (Results-oriented) or pushed back on an unsafe shortcut (Trustworthy).

## Prep checklist

- [ ] Read [Living our values](https://www.ti.com/lit/ml/szzb178/szzb178.pdf) + [career-prep transcript](https://www.ti.com/bin/ti/transcripts/6265474659001_en-us.txt) + [careers.ti.com](https://careers.ti.com/)
- [ ] Recruiter: firmware vs tools, C vs C++, OA vs live, intern vs experienced count, AI policy
- [ ] One C / ISR story + one protocol or bit-twiddle sketch + two STAR values
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Living our values — TI ambitions, values and code of conduct (PDF)](https://www.ti.com/lit/ml/szzb178/szzb178.pdf) — accessed 2026-11-09
- [TI application and interview process — official transcript](https://www.ti.com/bin/ti/transcripts/6265474659001_en-us.txt) — accessed 2026-11-09
- [Careers at TI](https://careers.ti.com/) — accessed 2026-11-09
- [The future starts here: intern to full-time TIer](https://www.ti.com/en-us/about-ti/behind-chip/articles/the-future-starts-here-3-insights-on-the-journey-from-intern-to-full-time-tier) — accessed 2026-11-09
- [Texas Instruments Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/texas-instruments/software-engineer) — accessed 2026-11-09
