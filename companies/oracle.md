# Oracle engineering track

Sits beside [salesforce.md](salesforce.md) and [workday.md](workday.md): **enterprise software + OCI cloud**, not one FAANG-shaped loop. Official [careers](https://careers.oracle.com/) and recruiter write-ups: Oracle is several businesses — **Oracle Cloud Infrastructure (OCI)**, **Database**, **Fusion / ERP / HCM apps**, plus acquired lines (NetSuite, Cerner). Recruiter confirms **which org**, Java vs other languages, OA vs live, and AI policy.

Typical timeline **5–14 weeks** (2026 guides; official blogs do not publish a SLA). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). Cloud design: [../answers/system-design-key-value-store.md](../answers/system-design-key-value-store.md). SQL hour: [../general/sql-interviews.md](../general/sql-interviews.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (Code of Ethics values)

Do **not** recite posters. Map **your** stories. Official [Code of Ethics and Business Conduct](https://www.oracle.com/assets/cebc-176732.pdf) lists the values they expect employees to model:

| Official value | What they score |
| --- | --- |
| **Integrity / Ethics** | Honest path in deals and code reviews; do not pad the resume (official recruiter tip) |
| **Compliance** | Laws, policies, and customer data rules — not “move fast and hide it” |
| **Mutual respect / Fairness** | Dignity with teammates, vendors, customers |
| **Teamwork / Communication** | Share enough to ship; protect confidential customer detail |
| **Innovation / Quality** | New approach **and** excellence; continuous improvement |
| **Customer satisfaction** | Treat customer outcomes as a top priority |

Official [Life at Oracle](https://www.oracle.com/careers/life-at-oracle/): inclusion without barriers; intern → full-time paths exist. “Why Oracle?” that only says “I used Java at a bank” fails. Name a **multi-tenant, SQL, or reliability** problem you have lived, then say **OCI vs apps vs database**.

## Official + reported process

Official [Jobs at Oracle](https://blogs.oracle.com/jobsatoracle/applying-for-tech-jobs-tips-for-engineers-and-developers) (recruiters Piyush Agarwal and Nancy Dewan): **four rounds including recruiter pre-screening**. First two are **coding / problem-solving knockout** rounds (fundamentals + concepts; round two goes deeper on where you struggled). Third is **techno-managerial** with the hiring manager (revisit weak spots + collaboration / decisions). Official: **no cooling-off period** — you may apply to **other** Oracle groups after a reject; do **not** run parallel Oracle loops.

Official [Ace your technical interview](https://blogs.oracle.com/jobsatoracle/ace-your-technical-interview): language of choice unless noted; clarify vague specs; talk the plan before code; describe the algorithm; walk a test case; finishing the last line is **not** required if the approach is clear. Engineer-suggested refresh: arrays / trees / hash maps / graphs, DP, big-O, optional Paxos / CAP / REST.

2026 guides (Design Gurus, OphyAI) stretch the skeleton — treat extra stages as **reported**:

| Stage | What they score |
| --- | --- |
| Recruiter (official) | Fit; **which Oracle**; location / eligibility |
| OA (guides) | Timed HackerRank (easy–medium) **or** CS/SQL MCQs — confirm |
| Live coding (official) | Knockout problem-solving + fundamentals |
| Virtual onsite (guides) | More coding; OCI = distributed reliability; apps = Java / SQL / tenancy |
| **Bartender / BT** (guides) | Outside-team interviewer; Amazon bar-raiser analog — behavioral + sometimes design |
| Offer (guides) | References; written offer can lag verbal (SVP chain) |

## How this track differs

| vs Salesforce / Workday | vs FAANG |
| --- | --- |
| **Which Oracle** changes the hour: OCI vs Fusion vs Database | Algorithms bar is usually **medium**; volume of rounds and **SQL/Java** matter |
| Design is **multi-tenant SaaS, replication, tenancy isolation**, not “design Twitter” | Official knockout screens reward **communication + tests**, not puzzle hardness |
| No official cooling-off; other BUs still hire | Timeline is often **longer** than product-company loops |

## Coding and design flavor

DSA: medium arrays / trees / hash maps; official sample shapes include FizzBuzz and **BST LCA**. Apps orgs: Java collections, SQL joins / indexes. OCI: region fail-over, block storage vs object, IAM, noisy-neighbor tenancy. Related: [../answers/coding-lowest-common-ancestor.md](../answers/coding-lowest-common-ancestor.md), [../answers/system-design-distributed-cache.md](../answers/system-design-distributed-cache.md).

## Sample prompts (shapes, not leaked puzzles)

1. Recruiter: OCI vs Fusion vs Database — why **this** org.
2. Live: BST LCA or a hash-map medium; narrate; write one test.
3. Design (OCI): regional control plane with tenant isolation and a hung-API story.
4. Design (apps): multi-tenant job that must not leak row data across customers.
5. Techno-managerial: a time you owned a production miss and what you changed.

## Prep checklist

- [ ] Read [Ace your technical interview](https://blogs.oracle.com/jobsatoracle/ace-your-technical-interview) + the specific JD
- [ ] Recruiter: org, OA vendor, Java vs other, Bartender or not, AI (confirm; official page does not bless live overlays)
- [ ] One timed medium + one SQL/EXPLAIN sketch + one tenancy or replication design
- [ ] STAR bank mapped to **integrity, customer, teamwork** — not generic FAANG LPs
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Ace your technical interview — Jobs at Oracle](https://blogs.oracle.com/jobsatoracle/ace-your-technical-interview) — accessed 2026-09-15
- [Applying for tech jobs — Jobs at Oracle](https://blogs.oracle.com/jobsatoracle/applying-for-tech-jobs-tips-for-engineers-and-developers) — accessed 2026-09-15
- [Oracle Careers](https://careers.oracle.com/) — accessed 2026-09-15
- [Life at Oracle](https://www.oracle.com/careers/life-at-oracle/) — accessed 2026-09-15
- [Code of Ethics and Business Conduct — Oracle](https://www.oracle.com/assets/cebc-176732.pdf) — accessed 2026-09-15
- [What Is the Oracle Interview Process Like? — Design Gurus](https://www.designgurus.io/answers/detail/what-is-the-oracle-interview-process-like-round-by-round) — accessed 2026-09-15
- [Oracle Interview Process 2026 — OphyAI](https://ophyai.com/blog/company-guides/oracle-interview-guide) — accessed 2026-09-15
