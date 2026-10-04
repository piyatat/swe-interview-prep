# Vercel engineering track

Sits beside [cloudflare.md](cloudflare.md) and [digitalocean.md](digitalocean.md): **frontend cloud / Next.js / agentic infra**, not a generic CDN trivia loop. Official [About](https://vercel.com/about): **agentic infrastructure for every app and agent** — the platform where humans and agents build software together. Official [Careers](https://vercel.com/careers) + [job posts](https://vercel.com/careers/software-engineer-next-js-6137958004) are the product source of truth. Recruiter confirms **Next.js vs CDN vs Compute vs Agent / AI SDK**, language (TypeScript is the default), **hub vs remote**, and take-home vs live pad.

Typical timeline **2–4 weeks** (2026 guides). Pair / AI: [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md). Frontend: [../roles/frontend.md](../roles/frontend.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (ship + iterate)

Do **not** invent Amazon-style LPs. Vercel does **not** publish a numbered values table. Use the phrases they actually print.

| Official phrase | What they score |
| --- | --- |
| **You can just ship things** | Job-post mission line — bias to a working change, not a design-doc stall |
| **Iterate to greatness (ITG)** | Official intern blog: ship a first version, then tighten quality fast |
| **Work in public** | Post blockers and updates; OSS / RFC writing is the remote habit |
| **Urgency + iteration velocity** | Blog calls these **core values** — hackathon pace with safeguards |
| **Customer / DX obsession** | You have used Next.js / the platform; you have an opinion, not a slogan |

Official [intern interview note](https://vercel.com/blog/summer-internship-at-vercel): the loop **mimics the job** — break down a problem, reason aloud, **Google and clarifying questions are encouraged**; it is **not** a LeetCode trap. “Why Vercel?” that only says “I deploy on it / DX is nice” fails. Name a **cache, RSC, or deploy** problem you have lived.

Job posts: **remote-first**; if you live within commuting distance of **SF, NY, London, or Berlin**, expect **Mon / Tue / Fri** office days. Recruiter confirms **your** persona.

## Official + reported process

Vercel does **not** publish a full SWE stage list. Official blog + 2026 guides. Treat extra hours as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter (~30 min, reported) | Motivation, what you shipped, first “why Vercel” |
| Technical screen (60–90 min, reported) | Live **applied TypeScript**, or a take-home + review |
| React / frontend deep-dive (reported) | Hydration, streaming SSR, RSC, Suspense — often a small live component |
| System design (reported) | Edge / CDN / serverless: ISR, multi-region, per-route cache |
| HM / behavioral (reported) | Ambiguity, async collaboration, a deeper “why Vercel” |
| Intern / new-grad (official blog) | Job-shaped problem; search + questions OK |

Guides disagree on “3 vs 5 rounds” because some loops **merge** the React hour and design into one onsite block. Confirm with the recruiter. Coding is **retries, streams, state machines, parsers** — not Blind-75 theater.

## How this track differs

| vs Cloudflare / DigitalOcean | vs FAANG |
| --- | --- |
| Product is **Next.js + deploy + agents**, not Workers-only or Droplets | Official intern write-up: **not** a LeetCode shop |
| Design is **ISR / RSC / edge cache**, not “design Twitter” | OSS maintainers and public RFCs are a real signal |
| 2026 postings lean **Agent / AI SDK / AI Gateway** | Ask hub days vs fully remote |

## Coding and design flavor

Reported coding: TypeScript with honest types, error handling, and a short written explanation. Design: rendering model + cache invalidation, not a generic load-balancer sketch. Related: [../general/pair-programming.md](../general/pair-programming.md), [../answers/system-design-object-storage.md](../answers/system-design-object-storage.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** frontend cloud — a cache or hydration miss you owned.
2. Live: retries with backoff + jitter + abort; say what is **not** retryable.
3. Design: per-route cache that must stay correct after a CMS publish.
4. Culture: ITG — a first version you shipped, then what you measured.
5. Questions for them: Next.js vs CDN vs Agent team, TypeScript vs Rust/Go, office days, AI-in-pad.

## Prep checklist

- [ ] Read [About](https://vercel.com/about) + [Careers](https://vercel.com/careers) + [intern interview note](https://vercel.com/blog/summer-internship-at-vercel)
- [ ] Recruiter: team, live vs take-home, language, hub days
- [ ] One timed applied TS medium + one ISR / edge-cache sketch
- [ ] STAR: ship in public, iterate, pair, a DX bug you fixed
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [About — Vercel](https://vercel.com/about) — accessed 2026-10-04
- [Careers — Vercel](https://vercel.com/careers) — accessed 2026-10-04
- [Software Engineer - Next.js — Vercel](https://vercel.com/careers/software-engineer-next-js-6137958004) — accessed 2026-10-04
- [Deploying dreams: a summer internship with Vercel](https://vercel.com/blog/summer-internship-at-vercel) — accessed 2026-10-04
- [Vercel Software Engineer Interview (2026) — Interview Coder](https://www.interviewcoder.co/blog/vercel-software-engineer-interview) — accessed 2026-10-04
- [Vercel Interview Process — FinalRound AI](https://www.finalroundai.com/blog/vercel-interview-process) — accessed 2026-10-04
