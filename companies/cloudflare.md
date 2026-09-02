# Cloudflare engineering track

Sits beside [product-companies.md](product-companies.md) and [roles/devops-sre.md](../roles/devops-sre.md): **edge / network / Workers**, not a generic FAANG slate. Official [Careers](https://www.cloudflare.com/careers/): mission **help build a better Internet**; published **Principled / Curious / Transparent** plus six **Capabilities**; hiring stages include an **Orange Cloud** values hour. Recruiter is the source of truth for **team** (Workers, R2, network, security), **take-home vs live screen**, and AI policy.

Typical timeline **3–5 weeks** (guides). Confirm **level** and whether your loop is **distributed / hybrid / in-hub**. Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Systems: [../general/cs-fundamentals.md](../general/cs-fundamentals.md). Take-homes: [../general/take-homes.md](../general/take-homes.md).

## Official culture (Careers)

Use these, not a stale “no-bullshit only” slogan. Do **not** recite the table; map **your** stories to the behaviors.

| Official label | Careers one-liner |
| --- | --- |
| **Principled** | Mission is serious; global mindset; democratize sophisticated tech |
| **Curious** | Desire to learn; empathy; tackle hard Internet problems |
| **Transparent** | Clear communication; do not withhold vital information; accountable |
| **Be curious to learn and grow** | Ask questions; improve the work |
| **Communicate clearly and transparently** | Direct feedback; keep the team in the loop |
| **Do the right thing** | Integrity; principled decisions |
| **Embrace diversity** | Different perspectives make the product better |
| **Get your work across the finish line** | Ownership; follow-through |
| **Lead with empathy** | Assume good intent |

## Official process (Careers)

| Official stage | Takeaway |
| --- | --- |
| **Initial conversations** | Recruiter: background, what excites you, mutual fit |
| **Team panel interviews** | Prospective manager + peers — how you think, problem-solving, skills |
| **Executive calls** | Senior leadership + **Orange Cloud Interview** on the behaviors they value |
| **Offer** | They say they move quickly once they have the right person |
| **Orientation** | First weeks: team, systems, contribute |

Work modes on the same page: **In-Hub**, **Hybrid**, or **Distributed** (country of employment; some roles fully remote). Confirm on the **req**, not a blog.

## How this track differs (guides; confirm)

| vs FAANG | vs late-stage product |
| --- | --- |
| **HM early** — team-fit before a long onsite | Design is **Anycast, POP, isolate, anti-abuse** — not “design Twitter” |
| Screen is often a **small realistic take-home** (HTTP client, parser, protocol) + review | Coding is **systems-framed**: partial reads, rate limits, concurrent cache |
| Orange Cloud is a **named** values hour | Networking (DNS, TLS, TCP/QUIC) is a **baseline**, not a stretch |

TechScreen / TechPrep (2026): recruiter → HM → live or take-home → virtual onsite (coding, edge design, often anti-abuse, behavioral). Treat round lists as **reported**.

## Coding and design flavor

Problems arrive as **packets and isolates**. Name **partial failure**, **adversarial input**, and **cost to the attacker** before drawing seven boxes.

Design shapes (not leaked puzzles): Workers KV consistency; global rate limit across POPs; DDoS classify-and-mitigate; Durable Object single-writer; log ship from every edge. Related: [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md), [../answers/system-design-key-value-store.md](../answers/system-design-key-value-store.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why Cloudflare / this team?” — a product you used (Workers, 1.1.1.1, R2) plus a systems opinion.
2. Parse an HTTP stream that arrives in **chunks**; say what a slowloris client does.
3. Token bucket or sliding window **per key** with expiration under contention.
4. Design a global limit or KV at the edge — consistency vs POP-local speed.
5. Orange Cloud: told a hard truth; finished something messy; explained a protocol simply.

## Prep checklist

- [ ] Read [Cloudflare Careers](https://www.cloudflare.com/careers/) (values + hiring stages)
- [ ] Recruiter: take-home vs live, Orange Cloud timing, AI policy, hub vs distributed
- [ ] One **debug-in-repo** mock and one **tiny HTTP/protocol** build with tests
- [ ] Refresh DNS / TLS / TCP — [../general/cs-fundamentals.md](../general/cs-fundamentals.md)
- [ ] Five STAR stories mapped to Capabilities — never name the values out loud
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Cloudflare Careers](https://www.cloudflare.com/careers/) — accessed 2026-09-02
- [The Cloudflare Technical Interview Process in 2026 — TechScreen](https://techscreen.app/articles/cloudflare-technical-interview-process-2026) — accessed 2026-09-02
- [Cloudflare's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/cloudflare-interview-process) — accessed 2026-09-02
- [Cloudflare Interview Prep 2026 — JobsByCulture](https://jobsbyculture.com/blog/cloudflare-interview-prep-2026) — accessed 2026-09-02
