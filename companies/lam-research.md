# Lam Research engineering track

Sits beside [asml.md](asml.md) and [nvidia.md](nvidia.md): **wafer-fab equipment software** (etch, deposition, clean — the tools that **build** the chip), not lithography scanners and not a designer’s EDA desktop ([synopsys.md](synopsys.md), [cadence.md](cadence.md)). Official [Careers overview](https://www.lamresearch.com/careers/careers-overview/): create equipment that drives semiconductor advancement; **prove what’s possible**. Recruiter confirms **tool-control / embedded vs diagnostics vs enterprise**, C++ vs Python, Fremont / Tualatin / Asia sites, and On-site vs Flex.

Typical path (official FAQ on the same page): initial screening → hiring-manager or team interview → optional technical assessment or presentation → additional stakeholder interviews. Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture

Do **not** invent Amazon LPs. Official careers tagline plus intern [core values / guiding principles](https://www.lamresearch.com/content/dam/lamresearch/2026/02/Learn-About-Lam-Research-Internships.pdf?v=11). Map **your** stories.

| Official line | Careers / intern one-liner |
| --- | --- |
| **Customer trust** | Be number one in customer trust; think customer, company, individual |
| **Ownership** | Ownership and accountability on the tool in the fab |
| **Honesty and integrity** | Open and honest as an organization (careers) |
| **Teamwork** | Limitless collaboration; innovation comes from everywhere |
| **Innovation** | Innovation and continuous improvement; curiosity creates breakthroughs |
| **Purpose** | Act with purpose for a better world |
| **Inclusion** | Inclusion and diversity; every voice has value |

“Why Lam?” that only says “semiconductors / Fremont” fails. Name a **real-time control, sensor-log, or equipment-debug** problem you have lived — they write the software that **runs the machine** next to the wafer.

## Official process

Official [Careers overview](https://www.lamresearch.com/careers/careers-overview/) FAQ. Stages **vary by team, location, and position**.

| Stage | Official |
| --- | --- |
| Initial screening | Hiring-team conversation: experience, career goals, **culture / core values / work environment** |
| Hiring manager or team | Match → HM interview, or a **group** interview with the hiring team |
| Technical assessment or task | **Some** roles: task, assessment, or short **presentation** before or during sessions |
| Additional interviews | Top candidates: more team members / group stakeholders, then offer |
| Work location | **On-site** (full-time at Lam or customer/supplier); **On-site Flex** (3+ days on-site); **Virtual Flex** (1–2 days on-site) |
| University | Dashboard events / career fairs; internships + mentorship for graduate hires |

Reports (Dataford 2026; campus): C/C++ OA (coding + debug + aptitude); then DSA / OOP / OS plus **I2C, SPI, UART** and a vacuum-chamber / sensor-log design sketch. Treat extra OA and puzzle lists as **reported**. Pair: [../roles/embedded.md](../roles/embedded.md), [../general/pair-programming.md](../general/pair-programming.md).

## How this track differs

| vs ASML lithography | vs Synopsys / Cadence EDA |
| --- | --- |
| Product is **etch / deposition / clean tools**, not the scanner | Software **on the tool** in the fab, not a designer’s suite |
| Official four-stage FAQ + Flex location models | Control loops, sensors, and field-service debug |
| “Prove what’s possible” + intern guiding principles | C++ on the machine; Python more on diagnostics / data |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** equipment house — a control, vacuum, or yield-data constraint, not “I like chips.”
2. C++: pass-by-value vs reference, pointers, a race between an ISR-shaped loop and the main thread.
3. Design a pipeline that logs chamber sensors in real time; say what you drop under load.
4. SPI vs I2C vs UART on a board you have actually shipped — or say you have not and talk tradeoffs.
5. Questions: embedded vs diagnostics, On-site vs Flex, presentation vs live code, AI-in-pad.

## Prep checklist

- [ ] Read [Careers overview](https://www.lamresearch.com/careers/careers-overview/) (process + Flex) + intern [values PDF](https://www.lamresearch.com/content/dam/lamresearch/2026/02/Learn-About-Lam-Research-Internships.pdf?v=11)
- [ ] Recruiter: cluster, C++ vs Python, site / Flex, assessment vs presentation, AI policy
- [ ] One C++ / concurrency story + one sensor-log or protocol sketch + two value STARs
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers Overview — Lam Research](https://www.lamresearch.com/careers/careers-overview/) — accessed 2026-11-09
- [Learn About Lam Research Internships (PDF)](https://www.lamresearch.com/content/dam/lamresearch/2026/02/Learn-About-Lam-Research-Internships.pdf?v=11) — accessed 2026-11-09
- [Lam Research Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/lam-research/software-engineer) — accessed 2026-11-09
- [Lam Research careers (opportunities)](https://opportunities.lamresearch.com/) — accessed 2026-11-09
- [Lam Research — company](https://www.lamresearch.com/) — accessed 2026-11-09
