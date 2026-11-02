# Akamai engineering track

Sits beside [cloudflare.md](cloudflare.md) and [cisco.md](cisco.md): **CDN, cloud, and security at the edge** — protect and deliver life online, not a Workers-first product loop. Official [Careers](https://www.akamai.com/careers): **11,500+** employees; **95%** can work office, home, or both (2026 culture numbers). Official [Working at Akamai](https://www.akamai.com/careers/working-at-akamai) publishes the values. Recruiter confirms **CDN vs security vs cloud-native**, C/C++ vs Java vs Go, HackerRank vs skip, FlexBase site.

Typical timeline **~3–6 weeks** (guides; Glassdoor ~23 days average across titles). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Networking / OS: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). CDN / rate limit: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md), [../answers/system-design-video-streaming.md](../answers/system-design-video-streaming.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (do not invent extra pillars)

Official Working at Akamai lists eight values. Map **your** stories; do not recite the table.

| Official value | Prep one-liner |
| --- | --- |
| **Customer first** | Their success is the outcome you owned |
| **Giving back** | Community work you actually did, not a slogan |
| **Inclusion** | A different view that changed the design |
| **Innovation** | New product value with a customer metric |
| **Integrity and trust** | Ethics / transparency when it cost you time |
| **One Akamai** | Skills exchanged across teams, win-win |
| **Perpetual Learning** | You taught or applied a new way of working |
| **Urgency and persistence** | Danny Lewin-shaped: hard problem, you stayed |

Official [Emerging Talent pack](https://www.akamai.com/site/en/documents/corporate/emerging-talent-candidate-pack.pdf): **STAR** for behavioral; research interviewers; unique questions; thank-you via the recruiter. FlexBase is official: choose home / office / blend. “Why Akamai?” that only says “CDN / Cloudflare but enterprise” fails. Name a **cache, TLS, DNS, or edge-failure** problem you have lived.

## Official + reported process

Official careers does **not** publish a SWE stage list. Recruiter is the map. Treat the funnel as **reported** (2026 TechPrep, Glassdoor, discuss).

| Stage | Reported |
| --- | --- |
| Recruiter | 15–30 min: background, band, location |
| HackerRank OA | 2 easy–medium coding + ~8–10 OS / net / DB MCQs; 2026 reports add SQL / strings |
| HM / tech screen | Resume + Linux / stack follow-ups |
| Virtual loop | 3–4 rounds over one or two days: coding, systems / networking, design, behavioral |
| Close | Manager / HR; FlexBase and team |

Guides: coding is **medium + complexity narration** (lists, LRU, parentheses), not puzzle-hard DP. A whole hour can be **TCP vs UDP, DNS, TLS handshake, paging, `netstat`**. Design is **CDN component / rate limiter / metadata+object store**, not a social feed.

## How this track differs

| vs Cloudflare | vs FAANG web |
| --- | --- |
| Official **eight values** + FlexBase; no Orange Cloud hour | Medium DSA **and** a TLS handshake on the same loop |
| OA MCQs can fail you after green coding | Design is **cache hierarchy / Anycast / origin shield** |
| Project deep-dive: why it failed, what you would redo | “I only grind LeetCode” misses the reported **infra debug** hour |

## Coding and design flavor

Talk like someone who has been on a packet path: cache hit ratio, purge, TLS offload, POP failure, origin stampede. Related: [../roles/devops-sre.md](../roles/devops-sre.md), [../roles/security.md](../roles/security.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** Akamai surface (delivery, App & API security, cloud-native) — portable “I like CDNs” is weak.
2. OA: two mediums **and** the MCQ block; guess-and-go is a fail.
3. Loop: reverse a list / LRU — then “what happens under memory pressure.”
4. Design: cache a video segment globally without stampeding origin; where purge lives.
5. STAR: urgency + perpetual learning on the same incident; what you would do differently.

## Prep checklist

- [ ] Read [Careers](https://www.akamai.com/careers) + [Working at Akamai](https://www.akamai.com/careers/working-at-akamai) + [Emerging Talent pack](https://www.akamai.com/site/en/documents/corporate/emerging-talent-candidate-pack.pdf)
- [ ] Recruiter: org, OA vs skip, language, FlexBase site, recorder
- [ ] One list/medium + OSI/TCP/TLS drill + one CDN design
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Careers — Akamai](https://www.akamai.com/careers) — accessed 2026-11-02
- [Working at Akamai — values and FlexBase](https://www.akamai.com/careers/working-at-akamai) — accessed 2026-11-02
- [Emerging Talent Candidate Pack — Akamai](https://www.akamai.com/site/en/documents/corporate/emerging-talent-candidate-pack.pdf) — accessed 2026-11-02
- [Akamai's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/akamai-interview-process) — accessed 2026-11-02
- [Akamai Interview Experience & Questions (2026) — Glassdoor](https://www.glassdoor.com/Interview/Akamai-Interview-Questions-E9219.htm) — accessed 2026-11-02
- [Akamai Technologies thread — r/leetcode](https://www.reddit.com/r/leetcode/comments/1lvjpf1/akamai_technologies/) — accessed 2026-11-02
