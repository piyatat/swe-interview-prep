# HashiCorp engineering track

Sits beside [gitlab.md](gitlab.md) and [ibm.md](ibm.md): **Terraform, Vault, Consul, Nomad — multi-cloud infra automation**, now **an IBM company**, not a generic FAANG slate. Official [Hiring and interviewing](https://www.hashicorp.com/how-hashicorp-works/articles/hiring-and-interviewing-at-hashicorp): principles inform **who and how** they hire; **consistent** role-specific interview plans; inclusion. Recruiter confirms **product vs SRE vs customer-facing**, **Go vs Python**, pair vs review mix, and whether **IBM** steps sit after the loop.

Typical timeline **varies** (guides: IBM approval can add days). Review: [../general/code-review-rounds.md](../general/code-review-rounds.md). Pair: [../general/pair-programming.md](../general/pair-programming.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official principles (do not invent extra pillars)

Official [Our Principles](https://www.hashicorp.com/our-principles) — the hiring article says **integrity, kindness, and humility** are rarely negotiable (harder to coach than vision or communication). Map **your** stories.

| Official principle | What they score |
| --- | --- |
| **Integrity** | Words = actions; no exemption for a deal or a senior |
| **Kindness** | Assume good intent; do not “win” a review by being an ass |
| **Pragmatism** | Disagree, then **commit**; reality over theory |
| **Humility** | Incomplete knowledge; feedback → a plan (official sample question) |
| **Vision** | This change vs the longer direction |
| **Execution** | Action over consensus theater; effective **and** efficient |
| **Communication** | Shared context; concise, not terse |
| **Beauty works better** | Craft — HCL, APIs, docs — as a choice, not polish-last |
| **Reflection** | What we would undo; process that no longer serves |

Official [Careers](https://www.hashicorp.com/careers): **HashiCorp, an IBM company**; principles listed the same nine ways. “Why HashiCorp?” that only says “I use Terraform / IBM is stable” fails. Name a **state-file, secrets, or consensus** problem you have lived.

## Official hiring tenets

From the hiring article:

| Official tenet | What to do |
| --- | --- |
| **Principles inform hiring** | Behavioral examples, not “I value humility” |
| **Consistent process** | Same planned questions; they will redirect theory → a story |
| **Inclusive panels** | Debate in debrief is expected; one loud no gets dug into |

Official humility probe (published): feedback from a peer / stakeholder / manager that **changed your performance**, and the **actionable plan**. Kindness ≠ skipping the probe.

## Official + reported process

Official pages describe **philosophy and plans**, not a public stage list. Guides (TechPrep, techinterview.org, 2026) — treat counts as **reported**.

| Stage | Official / reported |
| --- | --- |
| Recruiter | Remote / hybrid (they are deliberate, not “remote-only forever”), Go, IBM/comp |
| HM / principles | Which principles you actually practice |
| Technical filter | Live or async — team-dependent |
| Pair (reported 60–90 min) | Stub + **failing tests**; make them pass (often Go) |
| Code review (reported) | Dummy PR; depth **and** tone |
| Design | Vault-shaped secrets, Terraform state, Raft / lock, or plugin OOD |
| Close | Offer; some 2025–26 reports of **IBM** approval latency |

Guides: they skip olympiad DSA; arrays / maps / Go concurrency still show up **inside** the practical task.

## How this track differs

| vs GitLab | vs IBM Software / Consulting |
| --- | --- |
| Official **principles + planned questions**; GitLab is CREDIT + MR handbook | Parent brand is IBM; **this** loop is still HashiCorp-shaped |
| Reported **pair + PR review**, not an async GitLab MR | Design is **operators + state + secrets**, not watsonx / z |
| Kindness is a **hire bar**, including in the review hour | “I only grind LeetCode” is the wrong sport |

## Coding and design flavor

Pair: in-memory FS, transactional KV, interfaces, `err != nil`, mutex vs channel. Review: missing tests, unsafe secret logs, unkind comments — they score **how** you say it. Design: lease a lock, replicate Vault, Terraform state consistency, provider plugin surface. Related: [../answers/system-design-key-value-store.md](../answers/system-design-key-value-store.md), [../answers/system-design-distributed-cache.md](../answers/system-design-distributed-cache.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** product (Terraform vs Vault vs Consul) — “I like infra” is weak.
2. Humility STAR: the feedback, the plan, what you measure now.
3. Pair: make the suite green without rewriting the README’s contract.
4. Review: one defect, one design note, one kind nit — not a dunk.
5. Design: secret lease + revoke when the worker dies; who is the source of truth?

## Prep checklist

- [ ] Read [Hiring and interviewing](https://www.hashicorp.com/how-hashicorp-works/articles/hiring-and-interviewing-at-hashicorp) + [Principles](https://www.hashicorp.com/our-principles)
- [ ] Recruiter: language, pair vs review, IBM timeline, AI policy
- [ ] One Go (or strongest lang) pair + one real PR review mock
- [ ] STAR bank: **integrity / kindness / humility** plus one execution story
- [ ] Comp after written offer (IBM stock / band): [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Hiring and interviewing at HashiCorp](https://www.hashicorp.com/how-hashicorp-works/articles/hiring-and-interviewing-at-hashicorp) — accessed 2026-09-22
- [Our Principles — HashiCorp](https://www.hashicorp.com/our-principles) — accessed 2026-09-22
- [Careers — HashiCorp](https://www.hashicorp.com/careers) — accessed 2026-09-22
- [HashiCorp’s Interview Process (2026) — TechPrep](https://www.techprep.app/blog/hashicorp-interview-process) — accessed 2026-09-22
- [HashiCorp Interview Guide 2026 — techinterview.org](https://www.techinterview.org/post/3233460312/hashicorp-interview-guide-2026-terraform-vault-raft-consensus-and-infrastructure-engineering/) — accessed 2026-09-22
