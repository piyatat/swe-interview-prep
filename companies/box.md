# Box engineering track

Sits beside [dropbox.md](dropbox.md): **enterprise content + governance + Box AI**, not consumer sync. Official [Interviewing at Box](https://careers.box.com/en/how-we-hire/) is the hire-process source of truth. Official mission on [Life at Box](https://careers.box.com/en/life-at-box/): a workplace where people bring their full selves — product is **secure content for how the world works**. Recruiter confirms **platform vs AI vs integrations**, Java vs Python, **3-day office** (Tue–Thu), and **AI-in-pad**.

Typical timeline **3–5 weeks** (2026 guides). File / ACL design: [../answers/system-design-file-storage.md](../answers/system-design-file-storage.md). Identity: [../roles/security.md](../roles/security.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (do not invent extra pillars)

Official [Life at Box](https://careers.box.com/en/life-at-box/). Map **your** stories.

| Official value | Life-at-Box one-liner |
| --- | --- |
| **Bring your (___) self to work** | Authentic perspectives, not a polished persona |
| **Be an owner. It's your company.** | Improve the business; resources to ship epic ideas |
| **Take risks. Fail fast. GSD.** | Big bets, iterate, learn |
| **Blow our customers’ minds** | Know the customer; deliver the unexpected |
| **Be candid and assume good intent** | Direct feedback; listen |
| **Make mom proud** | Safety, trust, do right by one another |
| **10x it!** | Dream big, then stretch the idea |

Official how-we-hire: Boxers work from the assigned office **at least 3 days/week**, focus **Tue / Wed / Thu**. “Why Box?” that only says “like Dropbox but enterprise” fails. Name a **permissions, compliance, or content-workflow** problem you have lived.

## Official + reported process

Official [Interviewing](https://careers.box.com/en/how-we-hire/): application review by a Boxer → optional **assessments** (video, writing, or coding) → phone with recruiter **and** hiring manager → **meet the team** (behavioral and/or technical). Official [AI in our hiring process](https://careers.box.com/en/how-we-hire/ai-in-our-hiring-process/): humans review resumes; AI may support scheduling / workflow; **live AI / LLMs are off** unless they say otherwise; disclose AI used on take-homes. 2026 guides (techinterview.org, TechPrep) — treat round *contents* as **reported**.

| Stage | Official / reported |
| --- | --- |
| Application | Official: apply to close fits, not spray |
| Assessment | Official, role-dependent coding / writing / video |
| Phone | Official recruiter + HM — experience, match |
| Team loop | Official virtual or onsite. Guides: 60-min coding screen, then ~4–5 hours (2 coding, design, craft deep-dive, behavioral) |
| AI policy | Official: no real-time assistance unless invited |

Guides (2026): coding is **medium DSA** (trees, maps, intervals). Design leans **ACL inheritance, audit logs, classification pipelines** — regulated-industry constraints, not “build consumer Drive.”

## How this track differs

| vs Dropbox | vs FAANG |
| --- | --- |
| Official **enterprise** content + compliance (HIPAA / FedRAMP flavor) | Official **3-day** office, not Virtual First |
| Values are **owner / candid / 10x**, not LP | Practical ACL / audit design over puzzle-hard DSA |
| Box AI roles are the growth slice (guides) | HM is on the **phone** stage, not only the last hour |

## Coding and design flavor

DSA: trees, hash maps, interval merge, graph reachability. Design: folder ACL cache, shared-link vs group perms, append-only audit with retention, upload + virus scan. Related: [../answers/coding-accounts-merge.md](../answers/coding-accounts-merge.md), [../general/low-level-design.md](../general/low-level-design.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **enterprise** content — a permission or retention story, not “I used Box at work.”
2. Live: medium; they score narration and Big-O as much as the last test.
3. Design: resolve access for a file under nested folders + groups + a shared link.
4. STAR: candid pushback that still **blew a customer’s mind**.
5. Questions for them: Box AI vs core content on *this* team, office days, assessment type.

## Prep checklist

- [ ] Read [Interviewing at Box](https://careers.box.com/en/how-we-hire/) + [Life at Box](https://careers.box.com/en/life-at-box/) + [AI in hiring](https://careers.box.com/en/how-we-hire/ai-in-our-hiring-process/)
- [ ] Recruiter: OA vs live, language, office site, AI policy
- [ ] One tree/map medium + one ACL / file-storage design
- [ ] One owner + one candid STAR
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Interviewing at Box](https://careers.box.com/en/how-we-hire/) — accessed 2026-09-27
- [AI in our hiring process — Box](https://careers.box.com/en/how-we-hire/ai-in-our-hiring-process/) — accessed 2026-09-27
- [Life at Box](https://careers.box.com/en/life-at-box/) — accessed 2026-09-27
- [Box Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/box-interview-guide/) — accessed 2026-09-27
- [Box's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/box-interview-process) — accessed 2026-09-27
