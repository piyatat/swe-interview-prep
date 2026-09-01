# NVIDIA engineering track

Sits beside [product-companies.md](product-companies.md) and [ai-labs.md](ai-labs.md): **GPU / systems / CUDA**, not a generic FAANG slate. Official [How We Hire](https://www.nvidia.com/en-us/about-nvidia/careers/how-we-hire/): you interview with the **team you would join**; an **onsite, in-person** interview at an NVIDIA office is required **before an offer**. Recruiter is the source of truth for **CUDA vs platform vs DL infra vs driver** and AI policy.

Typical timeline **a matter of weeks** from first interview (official FAQ). Guides often quote **4–8 weeks** once scheduling and calibration stack. Confirm **level** and whether your team still runs a proctored OA.

Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Systems: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official process (How We Hire)

Three published stages: **Search & Apply → Let’s Meet → Join**.

| Official note | Takeaway |
| --- | --- |
| Apply to the **top 3–5** roles that match (FAQ: no hard cap; focus beats spray) | Tailor the resume to **that** JD (CUDA, networking, compilers — not “SWE generalist”) |
| Meet hiring manager, teammates, and people from **other groups** (phone, video, **in person**) | Domain depth with the hiring team; some cross-org calibration |
| **Onsite in-person at the office** before you can be considered for an offer | Budget travel; interns are the exception (phone interviews only) |
| Technical coding usually **HackerRank on a whiteboard or a laptop they provide** | Practice **without** your IDE / Copilot muscle memory |
| **Unapproved tools (ChatGPT named) → disqualification** | Treat the live hour as AI-free unless the recruiter writes otherwise |
| Optional **Insider Chat** (15 min, Community Resource Group) in the final stage | **Does not** influence the hire decision — culture Q&A only |
| Referrals: employee submits on the **internal** board **before** you apply | Then wait for NVIDIA-HR email to complete the application |
| Interviewing multiple teams: **feedback may be shared** | Another reason not to open six weakly matched reqs |

Dress: they say NVIDIANS lean **business casual**; wear what is comfortable.

## How this track differs

| vs FAANG | vs AI labs / product |
| --- | --- |
| **Team-owned** loop — no Google-style HC pool / post-bar matching | Design is **GPU pipeline, scheduler, memory, interconnect** — not “design Twitter” |
| Official **in-person** gate before offer | Live coding is often **C++ / systems**, not only Python LeetCode |
| Official **ChatGPT ban** in the exercise | OA (HackerRank / Codility) is common for **portal / new-grad**, not always for referrals |

Guides (Exponent, ResumeAdapter): recruiter → optional OA → peer technical screen → HM → ~4-round onsite (coding, systems/design, **domain**, behavioral). Some writeups mention a later calibration packet. Treat that as **reported**, not the careers page.

## Coding and design flavor

Problems arrive in **performance** costume: cache lines, occupancy, PCIe/NVLink vs a pretty class diagram. Name **memory hierarchy** (registers → shared → HBM), **occupancy vs latency hiding**, and **host/device** copies before drawing boxes.

Design shapes (not leaked puzzles): kernel launch + stream overlap; a **batching / paging** path for inference; a job queue over a GPU pool; “one kernel is 10× slower on the new SKU.”

## Sample prompts (shapes, not leaked puzzles)

1. Why this **team** (compute, networking, CUDA-X, autonomous, Omniverse) — portable “I like AI” is weak.
2. Live code on their HackerRank / laptop: arrays + pointers + complexity; narrate; no silent paste.
3. Domain: occupancy, warp divergence, or a host/device race you actually shipped.
4. Design: schedule heterogeneous GPU work with isolation and a hung-kernel story.
5. Behavioral: disagreed on a ship date; taught a systems idea; owned a perf regression.

## Prep checklist

- [ ] Read [How We Hire](https://www.nvidia.com/en-us/about-nvidia/careers/how-we-hire/) + the specific JD
- [ ] Recruiter: in-person site, OA, language (C++ vs Python), AI policy (official default is **ban**)
- [ ] Two weeks of **C++ / systems** in a plain editor; one CUDA or perf story with numbers
- [ ] One design mock that is **not** a social feed ([../general/system-design.md](../general/system-design.md))
- [ ] Referral path if you have an NVIDIAN — internal board **first**

## Sources

- [How We Hire — NVIDIA Careers](https://www.nvidia.com/en-us/about-nvidia/careers/how-we-hire/) — accessed 2026-09-01
- [NVIDIA Software Engineer Interview Guide — Exponent](https://www.tryexponent.com/guides/nvidia-software-engineer-interview) — accessed 2026-09-01
- [NVIDIA Interview Process, Stage by Stage (2026) — ResumeAdapter](https://www.resumeadapter.com/companies/nvidia/interview-process) — accessed 2026-09-01
- [Nvidia Senior Software Engineer Interview — SpaceComplexity](https://spacecomplexity.ai/blog/nvidia-senior-software-engineer-interview) — accessed 2026-09-01
