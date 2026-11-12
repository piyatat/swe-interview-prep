# CoreWeave engineering track

Sits beside [groq.md](groq.md), [digitalocean.md](digitalocean.md), and [nvidia.md](nvidia.md): **AI Hyperscaler GPU cloud** (Kubernetes / fleet / inference) — not an LPU compiler house and not a commodity hyperscaler trivia loop. Official [culture](https://www.coreweave.com/coreweave-company-culture) + [careers](https://www.coreweave.com/careers): engineers design the stack from the ground up; execute with excellence; take ownership. Recruiter confirms **Kubernetes / inference / fleet / Weave (W&B) / security infra**, Go vs Python vs C++, and office (NY / NJ / Sunnyvale / Bellevue / London / …).

Typical timeline **~2–3 weeks** (Dataford 2026). Systems: [../roles/devops-sre.md](../roles/devops-sre.md). LLM serving: [../answers/system-design-llm-serving.md](../answers/system-design-llm-serving.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (five values)

Do **not** invent Amazon LPs. Official SWE JDs (e.g. Weave / Security Infra, 2026) print the five:

| Official value | What they score |
| --- | --- |
| **Be Curious at Your Core** | You dug into a scheduler / GPU / control-plane unknown |
| **Act Like an Owner** | You ran the pager outcome, not just the ticket |
| **Empower Employees** | You unblocked someone else in hyper-growth |
| **Deliver Best-in-Class Client Experiences** | AI-lab / enterprise customer, not “GPUs are cool” |
| **Achieve More Together** | Cross-team (DC ops, kernel, control plane) |

“Why CoreWeave?” that only says “AI cloud is hot” fails. Name a **GPU scheduling, Kubernetes operator, or fleet-reboot** problem you have lived. Culture page: challenge the status quo, then **ship**.

**Fraud:** official [notice](https://www.coreweave.com/careers/notice-on-recruitment-fraud) — recruiters only from **`@coreweave.com`**; never WhatsApp / Telegram interviews; never payment or equipment purchase; LinkedIn listings must route to the careers site. Report to `careers@coreweave.com`.

## Official + reported process

Careers is apply; **no** public SWE stage list. Dataford (updated 2026-09) + Glassdoor / Jointaro 2026. Treat stages as **reported**.

| Stage | Official / reported |
| --- | --- |
| Apply | [Careers](https://www.coreweave.com/careers) / Greenhouse; confirm **@coreweave.com** |
| Recruiter | Background, team (K8s vs inference vs fleet vs Weave), location |
| OA / take-home (some) | Linux / Kubernetes fundamentals **or** ~60 min CoderPad (Go OK; docs search sometimes allowed) |
| Tech screen | Practical API / CLI / concurrency — not Blind-75 bingo |
| Panel | System design (cloud / IAM / fleet); project deep-dive; incident / ops; HM / director |
| Offer | Base + bonus + equity + ESPP (US); hyper-growth — ask **level vs scope** |

Glassdoor Nov 2026: HR → coding → four talks (manager, skip, director, design). Jointaro Jul 2026 SWE III: recruiter then **1-hour Golang CoderPad**. Pair: [../general/debugging-rounds.md](../general/debugging-rounds.md), [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md) — **ask** whether the pad is AI-on.

## How this track differs

| vs Groq / NVIDIA | vs FAANG / DigitalOcean |
| --- | --- |
| Product is **GPU cloud + Kubernetes + bare metal**, not an LPU or CUDA kernel shop | Design is **fleet / CRD / GPU pack**, not Droplets-simple or “design Instagram” |
| Official values on the **JD**; fraud page is explicit | Practical API coding beats a memorized graph puzzle |
| W&B / Weave is **inside** the same careers board | Incident hour is real: `Pending` pods, OOM, node drains |

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** GPU cloud — a packing, interconnect, or control-plane constraint you have lived.
2. CoderPad: CLI that POSTs serials to `/reboot` and parses JSON errors — [../roles/devops-sre.md](../roles/devops-sre.md).
3. Design: drain / reboot thousands of GPU nodes without emptying the cluster.
4. Debug: pod `Pending` — events, taints, GPU resource requests, then the node.
5. Values: owner + curious on the same outage; questions: AI-in-pad, team, on-call.

## Prep checklist

- [ ] Read [culture](https://www.coreweave.com/coreweave-company-culture) + [fraud notice](https://www.coreweave.com/careers/notice-on-recruitment-fraud) + current JD values block
- [ ] Recruiter: team, language (Go / Python / C++), OA vs CoderPad, **AI-in-pad**, office
- [ ] One practical API / concurrency mock + one K8s incident walk + one GPU-pack design sketch
- [ ] Close after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Company Culture — CoreWeave](https://www.coreweave.com/coreweave-company-culture) — accessed 2026-11-12
- [Careers — CoreWeave](https://www.coreweave.com/careers) — accessed 2026-11-12
- [Recruitment Fraud Notice — CoreWeave](https://www.coreweave.com/careers/notice-on-recruitment-fraud) — accessed 2026-11-12
- [Senior Software Engineer, Weave — CoreWeave (values on JD)](https://coreweave.com/careers/job?gh_jid=4696621006) — accessed 2026-11-12
- [CoreWeave Software Engineer Interview Guide 2026 — Dataford](https://dataford.io/interview-guides/coreweave/software-engineer) — accessed 2026-11-12
