# Analog Devices engineering track

Sits beside [texas-instruments.md](texas-instruments.md) and [qualcomm.md](qualcomm.md): **analog / mixed-signal silicon plus software at the Intelligent Edge** (converters, power, RF, firmware, edge AI) — not a GPU house and not a digital-only SoC modem loop. Official [software careers](https://www.analog.com/en/careers/software-jobs.html): analog + digital software + AI/ML from the sensor to insight. Recruiter confirms **embedded firmware vs validation vs cloud/tools vs Analog Garage**, C vs C++ vs Python, site (Wilmington / Ireland / Bangalore / …), and intern vs experienced loop.

Typical path (official student tips): phone, video, or in person; technical rounds want you to **show your work**; talk projects with challenges, outcomes, and takeaways. Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture

Do **not** invent Amazon LPs. Official values in ADI’s [Code of Business Conduct and Ethics](https://investor.analog.com/static-files/6ed4abc2-4db5-4bc7-a3b5-50ae0ac42301) (“Living our Values”). Careers also uses *Ahead of What’s Possible*. Map **your** stories.

| Official value | Code one-liner |
| --- | --- |
| **Innovation** | Create the future |
| **Agility** | Sense & adapt |
| **Leadership** | Act with courage |
| **Learning** | Evolve with a changing world |
| **Community** | Succeed together |
| **Balance** | Think holistically |
| **Impact** | Play to win |
| **Respect** | Embrace humanity |

“Why ADI?” that only says “analog is stable / Wilmington” fails. Name a **register, ISR, converter, or edge-software** problem you have lived — they ship the **signal chain** and the software that makes the silicon usable.

Software desks: official page highlights EV battery management, industrial automation, clinical-grade wearables, and **edge AI** (“algorithms meet atoms”). **Analog Garage** (Boston) is the internal incubator for software / data / hardware in a startup-shaped shop with ADI behind it — ask if your req is Garage vs product BU.

## Official process

Official [Student Resources](https://www.analog.com/en/careers/student-resources.html) interview tips. Experienced stages **vary by team**.

| Stage | Official |
| --- | --- |
| Apply | [Career opportunities](https://www.analog.com/en/careers/career-opportunities.html) / software jobs; intern and co-op listings on the career site |
| Format | Phone, **video**, or in person — ask for accommodations early |
| Technical | Practice from the **job description**; be ready to **show work** (not only narrate) |
| Projects | Specific: what you owned, challenges, successes, takeaways (work, class, or extra-curricular) |
| Intern / co-op | 500+ interns globally; official **>60%** intern→full-time conversion; paid; relocation / housing / transit for eligible interns |
| Intern shape | Summer ~12–14 weeks; spring/fall co-ops ~6–12 months |

Reports (Dataford 2026): recruiter screen → possible OA → technical discussions (live coding and/or embedded C) → manager / panel. Domain mix: `volatile` / ISR / SPI vs I2C, plus some loops a little analog literacy (ADC, sampling). Treat extra OA and round **count** as **reported**. Pair: [../roles/embedded.md](../roles/embedded.md), [../general/behavioral.md](../general/behavioral.md).

## How this track differs

| vs TI analog / MCU | vs Qualcomm modem / Snapdragon |
| --- | --- |
| Product is **converters, power, RF, and edge software**, not a TI MCU catalog | Mixed-signal **plus** Intelligent Edge software, not a cellular SoC |
| Official eight values in the Code + student interview tips | Analog Garage is a real fork — confirm the desk |
| Show-your-work technicals and project depth | C on a constrained node more than social-feed design |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** analog house — a converter, power, or edge-ML constraint, not “I like embedded.”
2. C: `volatile` on an ISR flag; circular buffer full vs empty — [../roles/embedded.md](../roles/embedded.md).
3. SPI vs I2C vs UART: clocking, who is master, when you pick which.
4. Values: a time you adapted a spec (Agility) or pushed an unsafe shortcut (Leadership / Respect).
5. Questions: firmware vs Garage vs cloud, C vs Python, OA vs live, AI-in-pad.

## Prep checklist

- [ ] Read [Student Resources](https://www.analog.com/en/careers/student-resources.html) + [software careers](https://www.analog.com/en/careers/software-jobs.html) + [Code of Conduct values](https://investor.analog.com/static-files/6ed4abc2-4db5-4bc7-a3b5-50ae0ac42301)
- [ ] Recruiter: firmware vs Garage vs tools, language, site, OA vs live, AI policy
- [ ] One C / ISR story + one protocol or signal-chain sketch + two STAR values
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Student Resources — Analog Devices](https://www.analog.com/en/careers/student-resources.html) — accessed 2026-11-10
- [Software Career Opportunities — Analog Devices](https://www.analog.com/en/careers/software-jobs.html) — accessed 2026-11-10
- [Career Opportunities — Analog Devices](https://www.analog.com/en/careers/career-opportunities.html) — accessed 2026-11-10
- [Integrity Powers Growth — ADI Code of Business Conduct and Ethics (PDF)](https://investor.analog.com/static-files/6ed4abc2-4db5-4bc7-a3b5-50ae0ac42301) — accessed 2026-11-10
- [Analog Devices Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/analog-devices/software-engineer) — accessed 2026-11-10
