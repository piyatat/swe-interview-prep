# Marvell Technology engineering track

Sits beside [broadcom.md](broadcom.md) and [qualcomm.md](qualcomm.md): **data-infrastructure silicon** (ethernet, storage, custom ASIC, CXL / UALink, optical) plus firmware and platform software — not a phone-modem house and not VMware-scale infrastructure software. Official [careers](https://www.marvell.com/company/careers.html): *infrastructure powers progress*; move, store, process, and secure the world’s data. Recruiter confirms **firmware / drivers vs SDK vs emulation / QEMU vs cloud-platform software**, C/C++ vs Python/Go, site (Santa Clara / India / Taiwan / …), and intern vs experienced loop.

Typical path (official): apply on the career site; **extensive interview process always includes virtual and/or in-person interviews**. Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture

Do **not** invent Amazon LPs. Official [Life at Marvell](https://www.marvell.com/company/careers.html) culture lines:

| Official line | Use it as |
| --- | --- |
| **Respect, integrity, transparency** | “fundamental to the way we do business” |
| **Execute with thoroughness** | Finish the bring-up / validation, not a demo |
| **Help others achieve their objectives** | Cross-team with hardware, design, and software |
| **Shared collaboration and diversity** | Community / intern programs; hundreds of interns yearly |

“Why Marvell?” that only says “AI networking is hot” fails. Name a **PHY, firmware bring-up, storage controller, or interconnect** problem you have lived — they ship **the chips under the data center**, not a social feed.

## Official process + AI rule

Official [recruitment-fraud](https://www.marvell.com/company/careers/recruitment-fraud-protection.html) page: offers only in person or from **`@marvell.com` / `marvell@workday.com`**; they never ask for payment. Apply on the career site.

**Interview Integrity** (printed on 2026 software intern / firmware reqs): candidates **may not** use AI tools during interviews — transcription apps, real-time generators (ChatGPT / Copilot), or note-taking bots. Interviews score **your** experience, thought process, and live communication. Uninstructed AI use → **disqualification**. Ask if any hour is an exception.

| Stage | Official / reported |
| --- | --- |
| Apply | [Careers](https://www.marvell.com/company/careers.html) / Workday |
| Screen (reported) | Recruiter or senior engineer — resume, domain, location |
| OA (reported) | Some loops; C / fundamentals — treat as **reported** |
| Technical | Deep-dives with peers / leads: C, Linux, firmware, debugging; intern reqs also name DSA / OS / distributed systems |
| Behavioral | Thoroughness, helping others, project history |
| Close | HM / director fit; intern programs with managers and mentors |

Reports (Dataford 2026): ~2–4 weeks on many SWE loops; some packets run longer with OA + manager. Pair: [../roles/embedded.md](../roles/embedded.md), [../general/debugging-rounds.md](../general/debugging-rounds.md), [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md) (here: **AI-off live** unless they say otherwise).

## How this track differs

| vs Broadcom silicon + VMware | vs Qualcomm Snapdragon / modem |
| --- | --- |
| Product is **ethernet / storage / custom ASIC / CXL**, not a hypervisor suite | Data-center interconnect and storage, not a phone SoC |
| Official **no-live-AI** on current SWE reqs | Culture lines are respect / integrity / thoroughness, not Qualcomm Way |
| Firmware + platform software on **other people’s clouds** | Ask firmware vs SDK vs emulation vs k8s-on-silicon |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** data-infra house — a link, firmware, or storage constraint, not “AI clusters need NICs.”
2. C / Linux: circular buffer with ISR vs thread; `volatile`; spinlock vs mutex — [../roles/embedded.md](../roles/embedded.md).
3. Debug a non-reproducible bring-up fail — [../general/debugging-rounds.md](../general/debugging-rounds.md).
4. Culture: a time you executed thoroughly under a spec change, or unblocked another team.
5. Questions: firmware vs SDK vs emulation, language, OA vs live, **confirm the AI ban**.

## Prep checklist

- [ ] Read [Careers](https://www.marvell.com/company/careers.html) + [recruitment-fraud / offer channels](https://www.marvell.com/company/careers/recruitment-fraud-protection.html)
- [ ] Recruiter: firmware vs SDK vs platform, language, site, OA vs live, **AI-in-pad (expect off)**
- [ ] One C / Linux or bring-up story + one interconnect or storage sketch + two STAR culture lines
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers \| Life at Marvell](https://www.marvell.com/company/careers.html) — accessed 2026-11-11
- [Recruitment Fraud Protection — Marvell](https://www.marvell.com/company/careers/recruitment-fraud-protection.html) — accessed 2026-11-11
- [Intern, Software Engineer — Marvell (Interview Integrity)](https://marvell.wd1.myworkdayjobs.com/en-US/MarvellCareers2/job/Intern--Software-Engineer_2604241) — accessed 2026-11-11
- [Marvell Technology Software Engineer Interview Questions 2026 — Dataford](https://dataford.io/interview-guides/marvell-technology/software-engineer) — accessed 2026-11-11
- [Marvell Technology Interview Process 2026 — Dataford](https://dataford.io/interview-guides/marvell-technology) — accessed 2026-11-11
