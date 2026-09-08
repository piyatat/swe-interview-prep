# Capital One engineering track

Sits beside [product-companies.md](product-companies.md) and [bloomberg.md](bloomberg.md): **consumer bank that runs production on AWS**, not a generic FAANG slate. Official [What to expect during your Capital One interview](https://www.capitalonecareers.com/what-to-expect-during-your-capital-one-interview-students-101): interviews stay **virtual**; **video on for the whole session**; recruiter screen → optional **hour-long virtual test** → optional **30-min hiring-manager pre-screen** → **Power Day** (job fit, behavioral “tell me about a time,” case). Official [FAQ](https://www.capitalonecareers.com/faq): Zoom; recruiter tells you **which blocks you get**; case prep = communicate process, take feedback, structure the recommendation. Recruiter confirms **TDP vs experienced req**, **CodeSignal vs other OA**, **whether SWE Power Day includes a case**, and **location / hybrid**.

Typical timeline **2–6 weeks** (guides; campus can run longer). Coding: [../general/coding-patterns.md](../general/coding-patterns.md). OOP / machine coding: [../general/low-level-design.md](../general/low-level-design.md). Payments / ledger taste: [../answers/system-design-payment.md](../answers/system-design-payment.md). OA: [../general/online-assessments.md](../general/online-assessments.md).

## Official culture (careers)

Do **not** invent a leadership-principle list. Official pages score **job fit** (role, team, culture), **behavioral competencies** (problem solving, influence, results), and — when scheduled — **case** strategic + quantitative thinking.

IGotAnOffer (updated 2026-08): Capital One **exited its last data center in 2020** and runs on **AWS microservices**. That is why design/case hours talk **S3 / DynamoDB / Lambda / RDS / Kinesis** and **audit / consistency / fraud**, not “design Instagram.” “Why Capital One?” that only says “fintech is hot” fails. Name a **money-correctness or cloud-ops** problem.

## Official + reported process

Official careers do **not** list CodeSignal by name; SWE guides do. Confirm with the recruiter.

| Stage | What they score |
| --- | --- |
| Application + automated assessment (official, some reqs) | Job-related skills; not the SWE coding bar |
| CodeSignal / virtual test (guides: ~70 min, four tasks, often proctored) | Speed + correctness; all items visible — **pace** |
| Recruiter (~30 min) | Background, location, process |
| HM pre-screen (official, ~30 min, not always) | Fit for the req |
| **Power Day** (official final block; guides: 3–5 interviews, ~3–6 hours) | Switch gears between formats the same day |
| Power Day coding (guides) | Often **OOP / banking domain** (accounts, cards, limits) more than a trick algorithm |
| Power Day design (guides, mid+) | Banking app / ledger / fraud — **consistency, IAM, audit** |
| Power Day case (official type; common on SWE reports) | Structure, assumptions, light math, a **recommendation** |
| Job fit / behavioral (official) | STAR; influence and results |
| Team match (guides) | 2–3 managers after a pass |

Official student page: case / mini-case is **typical** for campus BA / PM / finance; **TDP lists technical interviews**. Experienced SWE reports still include a **business case** more often than FAANG. Do not skip it.

## How this track differs

| vs FAANG | vs Stripe / Coinbase |
| --- | --- |
| **Power Day** — one calendar day, independently scored blocks | Stripe: integration / bug-bash; Coinbase: crypto tenets / ledger |
| **Case interview for engineers** is the surprise fail | Money + **regulated bank** (audit, least privilege) from the first sketch |
| Coding often **class design**, not only Blind 75 | Confirm OA tool — official page says “virtual test” |

## Coding, design, and case flavor

OA: four CodeSignal-style tasks; three clean beats a heroic unfinished fourth. Power Day coding: model `Account` / `Card` / transfer with **invariants** (no negative without overdraft policy). Design: card auth, ledger, fraud scoring — pick AWS building blocks and say **what you would not build**. Case: state the objective, structure (profit, risk, customer, ops), compute out loud, end with **go / no-go + next data**. Related: [../general/hiring-manager.md](../general/hiring-manager.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Why a bank tech org — not a consumer app?” — reliability / regulation, not TC only.
2. OA-style: four timed tasks; skip-and-return discipline.
3. OOP: accounts + transfers; add a daily limit at minute 25.
4. Design card authorization with idempotency and an audit log.
5. Case: launch a student card in two cities — metrics, risk, recommendation.

## Prep checklist

- [ ] Read [What to expect](https://www.capitalonecareers.com/what-to-expect-during-your-capital-one-interview-students-101) + [FAQ](https://www.capitalonecareers.com/faq)
- [ ] Recruiter: **Power Day slate**, case yes/no, OA tool, TDP vs experienced, video rules
- [ ] One **proctored-style 70-min** four-task mock
- [ ] One **OOP banking** mock + one **AWS-flavored** design
- [ ] Two **timed cases** (structure → math → recommendation)
- [ ] STAR bank for job-fit / influence / results
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [What to expect during your Capital One interview — Capital One Careers](https://www.capitalonecareers.com/what-to-expect-during-your-capital-one-interview-students-101) — accessed 2026-09-08
- [Candidate FAQ — Capital One Careers](https://www.capitalonecareers.com/faq) — accessed 2026-09-08
- [7 tips to nail your virtual interview — Capital One Careers](https://www.capitalonecareers.com/7-tips-to-nail-your-virtual-interview-101-cul-cdev) — accessed 2026-09-08
- [Capital One Software Engineer Interview — IGotAnOffer](https://igotanoffer.com/en/advice/capital-one-software-engineer-interview) — accessed 2026-09-08
- [Capital One's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/capital-one-interview-process) — accessed 2026-09-08
