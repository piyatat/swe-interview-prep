# ASML engineering track

Sits beside [nvidia.md](nvidia.md) and [intel.md](intel.md): **lithography equipment software** (EUV / DUV scanners, metrology, computational lithography), not a GPU-kernel loop and not a chip-design EDA hour ([synopsys.md](synopsys.md)). Official [Working at ASML](https://www.asml.com/en/careers/working-at-asml): **challenge, collaborate, and care**. Recruiter confirms **D&E cluster** (embedded software vs scanner metrology vs applications), C++ / Python / Java / C#, site (Veldhoven, Wilton, San Diego, Hsinchu, …), and hybrid vs on-site.

Typical path (official interview tips): apply → Talent Acquisition review → first interview (usually virtual, HM + teammate) → optional talent-exploration questionnaire → second interview (often on-site, drivers / culture) → optional HR → offer. Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture

Do **not** invent Amazon LPs. Official [Working at ASML](https://www.asml.com/en/careers/working-at-asml). Map **your** stories.

| Official value | Careers one-liner |
| --- | --- |
| **Challenge** | Cutting-edge problems; ecosystem keeps moving; the work changes what chips can do |
| **Collaborate** | You will not solve EUV in a silo; speak up; multidisciplinary |
| **Care** | Mutual respect; flexibility and trust; unique points of view |

Official SWE page: **~3,000** software engineers; English is the company language; 120 nationalities. Ideal candidate: CS (or related) degree, communication, team play, **complexity and unpredictability**. “Why ASML?” that only says “semiconductors / Netherlands” fails. Name a **real-time control, calibration, or metrology-data** problem you have lived — they write the software that **runs the machine**.

## Official process

Official [Interviewing at ASML](https://www.asml.com/en/careers/interview-tips). Stages **vary by job and country**.

| Stage | Official |
| --- | --- |
| Apply | Career portal only (not email); recruiter reviews |
| First contact | Recruiter within **two weeks** if they have questions or want to talk |
| First interview | Usually **virtual**; hiring manager + a team member; education, experience, **motivation** |
| Questionnaire | Optional **talent exploration** before interview two — conversation starter; finish **≥2 days** before |
| Second interview | Often **on-site**; drivers, ambitions, culture match; may be a project lead / architect / other teammate |
| Third | Sometimes **HR** |
| Feedback | Generally within **five working days** |
| Scheduling | Virtual assistant **Rex** (email / WhatsApp / SMS) |
| Two reqs | If both reach second round, **pick one** to continue |
| Hybrid | In-person preferred for collaboration; WFH blend exists; **work-from-abroad generally not** (tax / social security) |

Campus / intern flavor (official NL internships): HireVue recorded questions, then interview, then offer. Treat HireVue as **common for early-career**, not every experienced SWE loop.

Reports (Dataford 2026): C++ memory / vtable / smart pointers; Python for logs and calibration; debug a low-level snippet. Treat puzzle lists as **reported**. Pair: [../general/pair-programming.md](../general/pair-programming.md), [../roles/embedded.md](../roles/embedded.md).

## How this track differs

| vs NVIDIA / Intel product silicon | vs Synopsys EDA |
| --- | --- |
| Product is the **scanner + metrology**, not a GPU or CPU | Software **on the tool** in the fab, not a designer’s desktop suite |
| Official **challenge / collaborate / care** | Second interview is **drivers + culture**, often on-site |
| Multidisciplinary: optics, mechatronics, software | C++ on the machine; Java/C# more on applications / YieldStar |

Official clusters (SWE FAQ): **software development** (embedded modules — C/C++/Python/Java/MATLAB); **scanner metrology** (orchestrate modules, physics + C++/Python); **applications** (on-product / YieldStar — C# / Java).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** lithography house — a control, calibration, or yield-data constraint, not “I like chips.”
2. C++: stack vs heap, RAII, unique vs shared ptr, a segfault you actually chased.
3. Design a module that talks to a sensor with a hard latency budget; say what you log.
4. Collaborate: a time you aligned software with hardware/physics when the spec was incomplete.
5. Questions: cluster, language, Veldhoven vs US/TW, HireVue vs live, AI-in-pad.

## Prep checklist

- [ ] Read [interview tips](https://www.asml.com/en/careers/interview-tips) + [working at ASML](https://www.asml.com/en/careers/working-at-asml) + [SWE FAQ](https://www.asml.com/en/careers/technical-fields/computer-science-jobs-software-engineering)
- [ ] Recruiter: cluster, site, C++ vs Python vs Java, on-site day, AI policy
- [ ] One C++ memory story + one real-time / calibration sketch + two value STARs
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Interviewing at ASML: Tips and tricks](https://www.asml.com/en/careers/interview-tips) — accessed 2026-11-08
- [Working at ASML](https://www.asml.com/en/careers/working-at-asml) — accessed 2026-11-08
- [Computer science & software engineering jobs — ASML](https://www.asml.com/en/careers/technical-fields/computer-science-jobs-software-engineering) — accessed 2026-11-08
- [ASML internships in the Netherlands](https://www.asml.com/en/careers/students-new-graduates/netherlands/internships) — accessed 2026-11-08
- [ASML Software Engineer Interview Questions & Guide 2026 — Dataford](https://dataford.io/interview-guides/asml/software-engineer) — accessed 2026-11-08
