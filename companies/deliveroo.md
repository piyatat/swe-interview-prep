# Deliveroo engineering track

Sits beside [doordash.md](doordash.md) and [instacart.md](instacart.md): **three-sided food / grocery marketplace** (consumer, restaurants / shops, riders), not DoorDash’s official AI working session and not Instacart’s grocery CodeSignal loop. Official [interview guide for engineers](https://careers.deliveroo.co.uk/interview-guide-for-engineers/) + [how we hire](https://careers.deliveroo.co.uk/how-we-hire/): 2025 mission is **transform the way you shop and eat, bringing the neighbourhood to your door**. Recruiter confirms **Deliveroo vs DoorDash vs Wolt** (DoorDash group; values pages now mention shared operating principles — **loops are not automatically the same**), backend vs frontend vs infra, and AI.

Typical timeline **varies by team** (official). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Architecture: [../general/system-design.md](../general/system-design.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (six values)

Do **not** invent DoorDash Dasher LPs. Official [backend](https://careers.deliveroo.co.uk/our-interview-guide-backend-engineering/) / [frontend](https://careers.deliveroo.co.uk/our-interview-guide-frontend-engineering/) guides publish **six values**. Map **your** stories. STAR is the published shape.

| Official value | Careers one-liner |
| --- | --- |
| **Live and breathe our marketplace** | All sides + each neighbourhood, not only the app |
| **Play to win** | Bold targets; tenacity, creativity, grit |
| **Celebrate difference** | Respect and fairness; unique journeys |
| **Champion big and small innovations** | Innovate in any role; celebrate small wins |
| **Obsess about operational excellence** | Leave it better; invest where customers care |
| **Be curious and intellectually honest** | Deep think; debate with respect; check bias |

“Why Deliveroo?” that only says “I order takeaway / London / DoorDash bought it” fails. Name a **dispatch, ETA, or partner-inventory** problem you have lived.

## Official process

Company-wide [how we hire](https://careers.deliveroo.co.uk/how-we-hire/): Application → ~30 min recruiter → interviews (often HM + technical / case) → decision (feedback call if no). **Engineer** path is more specific. Official engineer guide: Prescreen **20–45 min** → HackerRank **60–90 min** → Full loop **2–3 × 60 min** → **Hiring Committee** → **Allocation** (team match after the bar). Google Meet is the published video tool; no formal dress code.

### Backend / full-stack (official)

| Stage | Official |
| --- | --- |
| HackerRank (backend) | **90 min** take-home; section 1 **20 min** (15 MCQs: testing, design, microservices, REST, problem-solving) then **70 min** for two coding sections (DSA + REST). **No going back** after a section |
| HackerRank (full-stack) | **90 min**, two problems (React + REST); jump between them; HR runs tests (no debugger) |
| Full loop coding | **Option 1:** submit a home task **≥48 h** before; 10–15 min walkthrough + 25–30 min live **extensions**. Tests on happy/sad paths. **AI-generated submissions rejected.** **Option 2:** 50 min live HackerRank pair on a simplified real problem |
| Architecture | ~45 min design from a product brief; hand-off quality; draw.io / Excalidraw |
| Behavioural | Communication, leadership, flexibility, decisions vs the six values |

### Frontend (official)

HackerRank **~70 min** (React debug + REST). Loop coding is **pair on a provided React ZIP** (JS/TS), not a take-home. Architecture is **production UI** from a screenshot (a11y, audience / browsers, security, performance).

## Official AI policy

Official [GenAI guide](https://careers.deliveroo.co.uk/using-generative-ai-in-your-interview-process/): polish the CV (content must be yours). Take-homes: **allowed unless the recruiter says otherwise** — **disclose tool + how**. Live interviews (virtual or onsite): **no GenAI**. Backend/FE coding pages: no ChatGPT / Copilot in the live hour. They are **exploring** a future AI-assisted live coding format — do not assume it.

## How this track differs

| vs DoorDash / Instacart | vs FAANG |
| --- | --- |
| Official **six values** + **HC + allocation** | Published **HackerRank then 3×60**, not a six-hour Superday |
| Design is **dispatch / ETA / three-sided marketplace** | Backend OA mixes **MCQ + REST**, not only Blind 75 |
| Live coding is **AI-off**; DoorDash runs an official AI session | “I only grind hards silently” misses STAR vs values |

## Coding and design flavor

Official groups: Consumer, Delivery, Restaurants, Platforms, Grocery / retail, Deliveroo for Work. Stack color (guides): Go / Ruby, Postgres / Dynamo / Kafka / Redis. Live DSA often wears a **logistics costume**. Design: rider–order matching, ETAs, catalog freshness, fraud. Related: [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md), [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md).

Narrate. Official architecture hour: start high-level, iterate, name production failure modes. They do **not** expect a finished feature in the live coding slot.

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** marketplace side (rider, restaurant, grocery) — a neighbourhood friction, not “I like food.”
2. HackerRank: finish the function; REST edges; do not burn section 1.
3. Coding option 1: walk the submission, then extend it under time.
4. Design: match riders to stacked grocery + restaurant orders when rain doubles ETAs.
5. Intellectually honest: you changed your mind when the data disagreed.

## Prep checklist

- [ ] Read [engineer guide](https://careers.deliveroo.co.uk/interview-guide-for-engineers/) + the **backend or frontend** hub + [how we hire](https://careers.deliveroo.co.uk/how-we-hire/) + [GenAI](https://careers.deliveroo.co.uk/using-generative-ai-in-your-interview-process/)
- [ ] Recruiter: Deliveroo vs DoorDash / Wolt, OA shape, coding option 1 vs 2, AI, allocation
- [ ] One timed 90-min HackerRank + one 45-min marketplace design you **talk through**
- [ ] STAR bank mapped to the **six** values
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Interview guide for engineers — Deliveroo](https://careers.deliveroo.co.uk/interview-guide-for-engineers/) — accessed 2026-10-24
- [Interview guide for backend / full-stack — Deliveroo](https://careers.deliveroo.co.uk/our-interview-guide-backend-engineering/) — accessed 2026-10-24
- [Interview guide for frontend — Deliveroo](https://careers.deliveroo.co.uk/our-interview-guide-frontend-engineering/) — accessed 2026-10-24
- [Hiring process — Deliveroo](https://careers.deliveroo.co.uk/how-we-hire/) — accessed 2026-10-24
- [Using Generative AI in Your Interview Process — Deliveroo](https://careers.deliveroo.co.uk/using-generative-ai-in-your-interview-process/) — accessed 2026-10-24
