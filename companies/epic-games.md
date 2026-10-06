# Epic Games engineering track

Sits beside [unity.md](unity.md) and [roblox.md](roblox.md): **Unreal Engine + Fortnite / UEFN**, **not** [epic-systems.md](epic-systems.md) (Verona EHR). Official [Careers](https://www.epicgames.com/site/en-US/careers): **innovation, quality, community**; collaborative and creative. Official [early-career programming](https://www.epicgames.com/site/en-US/earlycareers/career-paths): **C++ house**; Unreal familiarity is **essential** for engine / game internships; they **value a technical portfolio**. Recruiter confirms **engine / rendering vs Fortnite gameplay vs online / EOS vs store vs Verse**, language (C++ vs Go / Python backend), and Cary vs other studios.

Typical timeline **~2–4 weeks** (2026 guides). Take-homes: [../general/take-homes.md](../general/take-homes.md). LLD / C++: [../general/low-level-design.md](../general/low-level-design.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (engine + community)

Do **not** invent Amazon-style LPs. Epic does **not** publish a numbered values table. Use careers + early-career language.

| Official signal | What they score |
| --- | --- |
| **Innovation, quality, community** (careers) | Do right by players **and** licensees — not “I play Fortnite” |
| **C++ first** (early careers) | Ownership, RAII, move, cache layout — not a Java web loop |
| **Unreal familiarity** (early careers) | Engine as a **system** (UObject / tick / modules), not a black-box editor |
| **Portfolio over cover letter** (early careers) | Cover letters optional; GitHub / shipped feature they can open |
| **Truthful skills** (early careers) | They will uncover a fake C++ / UE line in the loop |

“Why Epic?” that only says “AAA games” fails. Name a **frame-time, memory, live-service, or toolchain** problem you have lived. Engine vs Fortnite vs backend loops **diverge** — confirm the req.

## Official + reported process

Careers / early-career pages describe **who they hire**, not a numbered SWE stage list. 2026 guides (techinterview.org, TechPrep, FinalRound). Treat stages as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (~30 min) | Motivation; **engine vs game vs backend**; C++ / UE depth |
| Tech screen (60–90 min) | Guides: live coding or theory + project dive; some tracks a **C++ take-home** |
| Virtual onsite | Guides: 4–6 panels — practical C++, domain (UE / graphics / online), design, cross-discipline behavioral |
| Offer | Private equity + tenders — ask **liquidity**, not paper marks |

Guides: this is **not** a Blind-75 shop. Coding still exists — clean C++ under a **frame / alloc budget** beats a memorized graph puzzle. Confirm AI-in-pad with the recruiter.

## How this track differs

| vs Unity / Roblox | vs Epic Systems (EHR) |
| --- | --- |
| Product is **UE + a live game + store / EOS**, not Editor-for-the-masses or a UGC OS | Completely different company — Verona campus / OA logic test is the **other** Epic |
| Official early-career page is **C++ + Unreal + portfolio** | No Wonderlic-style gate here |
| Domain hour is **Nanite/Lumen/Chaos or Fortnite online**, not mobile UI | If the req says “healthcare EHR,” you opened the wrong page |

## Coding and design flavor

Engine: smart pointers vs raw, vtable / slicing, `std::move`, fragmentation, tick order, UObject GC vs non-UObject. Gameplay / live: season content without breaking old clients. Online: matchmaking, accounts, anti-cheat — related [../answers/system-design-chat.md](../answers/system-design-chat.md). Creator / UEFN: tools + **Verse** only if that is the req.

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** engine company — a time you did not blow the frame budget.
2. C++: when you keep a raw pointer; what RAII would have prevented.
3. Walk a shipped gameplay / engine / online change; what you measured.
4. Design: matchmake across skill + ping on a live title; what you relax last.
5. Questions for them: engine vs Fortnite vs EOS, take-home vs live, C++ standard, AI-in-pad.

## Prep checklist

- [ ] Confirm you mean **Epic Games**, not [epic-systems.md](epic-systems.md)
- [ ] Read [Careers](https://www.epicgames.com/site/en-US/careers) + [programming path](https://www.epicgames.com/site/en-US/earlycareers/career-paths); put a **C++ repo** on the resume
- [ ] Recruiter: team, language, take-home, studio / hybrid
- [ ] One timed practical C++ + one UE-architecture or live-ops sketch
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Epic Games Careers](https://www.epicgames.com/site/en-US/careers) — accessed 2026-10-06
- [Epic Career Paths — Programming](https://www.epicgames.com/site/en-US/earlycareers/career-paths) — accessed 2026-10-06
- [Engine Programmer — Epic Games](https://www.epicgames.com/careers/jobs/6102277004) — accessed 2026-10-06
- [Epic Games Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/epic-games-interview-guide/) — accessed 2026-10-06
- [Epic Games's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/epic-games-interview-process) — accessed 2026-10-06
- [Epic Games Interview Process — FinalRound AI](https://www.finalroundai.com/blog/epic-games-interview-process) — accessed 2026-10-06
