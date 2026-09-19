# AMD engineering track

Sits beside [intel.md](intel.md) and [nvidia.md](nvidia.md): **Ryzen / EPYC / Instinct / ROCm / (ex-Xilinx) adaptive**, not a generic SaaS DSA slate. Official [Careers](https://www.amd.com/en/corporate/careers.html): mission is **high-performance and adaptive computing**; tagline **together we advance**. Recruiter confirms **CPU vs GPU/ROCm vs Instinct vs FPGA/Versal vs driver/firmware**, C++ vs Python, and site (Austin, Santa Clara, Markham, Hyderabad, …).

Typical timeline **varies by team** (official FAQ; 2026 guides often quote **2–5 weeks**). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Systems: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Embedded: [../roles/embedded.md](../roles/embedded.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (five behaviors)

Do **not** invent extra pillars. Official careers “Our Culture”:

| Official behavior | What they score |
| --- | --- |
| **Push the Limits** | Challenge assumptions; complexity → a real breakthrough |
| **Drive Excellence** | Quality, precision, results — not slideware |
| **Be Direct and Humble** | Clarity; listen first; stay grounded |
| **Collaborate Deeply** | Cross silicon / firmware / software; shared goal |
| **Be Inclusive, Always** | Belonging; ideas can rise |

Lisa Su quote on the same page: how you work matters as much as what you build. “Why AMD?” that only says “not NVIDIA / cheaper GPUs” fails. Name a **hardware–software** problem you have lived (cache, occupancy, HIP/ROCm, bring-up, compiler).

## Official AI policy (do not guess)

Official careers FAQ, “Can I use AI tools like ChatGPT when applying or interviewing at AMD?”:

| Allowed | Not allowed |
| --- | --- |
| Learn about AMD / the industry; refine **your** materials; prep | Generate or **read** live-interview answers |
| Authenticity — your ideas and story | Submit AI-written **coding or written work** as yours |
| | Mask your identity |

Official process: apply on the careers account → recruiting reviews → **phone, video, or onsite** if there is a match. Timelines vary; they say **every** applicant gets a status update. Recruiters do **not** use personal email, ask for fees, or request ID docs during apply (scam note on the same page).

## Official + reported process

Official FAQ does **not** publish a SWE round list. Groups hire separately. 2026 guides (techinterview.org, Nora) — treat counts as **reported**.

| Stage | What they score |
| --- | --- |
| Apply (official) | Account on [careers.amd.com](https://careers.amd.com/careers-home/); JD match (ROCm vs RTL vs firmware) |
| Recruiter / HM (official + guides) | Background, team, motivation; some screens go into a resume project |
| Tech screen (guides: 60–90 min) | SWE: coding **plus** systems / locality; HW: digital / small RTL |
| Panel / onsite (guides: 3–6 × 60–90 min) | Coding with a **cache / SIMD** angle, domain depth, design, behaviors |
| Decision (guides) | Calibration; offer often **1–3 weeks** |

## How this track differs

| vs Intel | vs NVIDIA |
| --- | --- |
| Challenger x86 + **Instinct / ROCm** story, not foundry-first | No official “in-person before every offer” How-We-Hire gate |
| Official **written** AI apply/interview rules | Design is **telemetry, driver, HIP kernel, distributed train**, not “design Twitter” |
| Specialty depth over generalist LeetCode-only | Honest **CUDA gap** talk is expected on ROCm / ML loops |

## Coding and design flavor

Coding: arrays / graphs plus **“is this cache-friendly?”** Domain: wavefront / LDS occupancy, LLVM pass, PyTorch op → ROCm, firmware update. HLD: distributed train / infer on Instinct; host–device copies; bandwidth vs flops. Related: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** group (EPYC tools, Instinct, ROCm, Versal) — portable “I like AI silicon” is weak.
2. Live: an array medium, then how you would **tile** it for a cache line.
3. Domain: a perf cliff you measured (bandwidth, occupancy, lock) with a number.
4. Design (ML systems): data vs tensor vs pipeline parallel — where memory wins.
5. Direct and humble: you slipped a date, said so early, still delivered the next commit.

## Prep checklist

- [ ] Read [AMD Careers](https://www.amd.com/en/corporate/careers.html) (culture + AI FAQ) + the JD on [careers.amd.com](https://careers.amd.com/careers-home/)
- [ ] Recruiter: org, C++ vs Python, hybrid site, AI on the pad (official: no live copilot)
- [ ] One timed medium + locality story + STAR vs the **five** behaviors
- [ ] One **non-social** design mock: [../general/system-design.md](../general/system-design.md)
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [AMD Careers](https://www.amd.com/en/corporate/careers.html) — accessed 2026-09-19
- [AMD Jobs](https://careers.amd.com/careers-home/) — accessed 2026-09-19
- [AMD Student Programs (interview FAQ)](https://www.amd.com/en/corporate/careers/student-programs.html) — accessed 2026-09-19
- [AMD Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/amd-interview-guide/) — accessed 2026-09-19
- [AMD SWE Guide 2026 — Nora AI](https://interview.norahq.com/interview-guides/amd-software-engineer-interview-guide-2026) — accessed 2026-09-19
