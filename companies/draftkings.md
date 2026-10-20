# DraftKings engineering track

Sits beside [fanduel.md](fanduel.md): **US sports entertainment / DFS + sportsbook + iGaming**, not FanDuel’s Flutter-parent sportsbook and not a brokerage. Official [How we hire](https://careers.draftkings.com/working-here/how-we-hire/): process length **varies by role**; recruiter walks the panel. Most interviews are **virtual**; they name **HackerRank** for technical assessment. Recruiter confirms **DFS vs Sportsbook vs iGaming vs Marketplace vs DK Network**, hub (Boston / NYC / …), language, and AI policy.

Typical official path: **apply → recruiter / panel (virtual) → optional online or in-person assessment → offer conversation**. Coding: [../general/coding-patterns.md](../general/coding-patterns.md). OOP / machine coding: [../general/low-level-design.md](../general/low-level-design.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (five values)

Do **not** invent Amazon-style LPs. Official [Working here / values](https://careers.draftkings.com/working-here/) are the playbook. Map **your** stories.

| Official value | What they score |
| --- | --- |
| **Champion the Customer** | Outstanding customer experience first |
| **Care Deeply** | Debate, align, commit; empathy and integrity |
| **Compete Fiercely** | Highest stakes; win and lose as one team |
| **Take Calculated Risks** | Miss some shots; analysis, then action |
| **Own the Outcome** | Start-to-finish accountability; urgency without junk |

Official How we hire: show you understand **products**, not only “I like sports” — Daily Fantasy, Sportsbook, iGaming, Marketplace, DK Network. Official hiring-manager note (Nehal, Engineering): **sports knowledge is not required**; they hire engineers who can learn the domain.

Official How we hire: tailor the CV to the JD; cover letter optional; they aim to update applications within **~10 business days** for most roles; post-interview feedback in **a few days** (longer if a slate is open). Remote is **JD-specific**.

## Official process (company-wide)

Official [How we hire](https://careers.draftkings.com/working-here/how-we-hire/). SWE flavor sits inside “technical skills assessment” — ask.

| Stage | Official |
| --- | --- |
| Application | Tailored CV; optional cover letter |
| Screen | Recruiter / team members; experience, skills, valued behaviors |
| Technical | Virtual; **HackerRank** named; some roles add an online or in-person assessment |
| Panel | Team you are applying to; HM named by recruiter |
| After | Recruiter on benefits (location-specific); reapply + talent community if no |

Official [Advice from hiring managers](https://careers.draftkings.com/life-at-draftkings/our-culture/advice-from-hiring-managers-before-your-interview/) (Jan 2025): Engineering Manager Nehal — technical hours often **OOP + high-level design**; **behavioral is scored equally** and is the usual miss. Situation bank; admit when you do not know. Ask how you would excel in the **first 90 days**.

**Reported SWE overlay** (candidate notes; confirm): recruiter screen (sometimes OOP trivia), **HackerRank pair** (practical assignment), then **class design / OOD**, project deep-dive, and manager fit — often three later hours before a single decision. Treat “discount assignment / robot restaurant” write-ups as **shapes**, not a leaked bank.

## How this track differs

| vs FanDuel | vs FAANG |
| --- | --- |
| Official **five values** (not FanDuel’s ten principles) | Product is **DFS + sportsbook + iGaming** |
| Official HM: **OOP + HLD**, not only DSA | HackerRank named; practical / OOD common |
| Sports fandom is **not** the bar | “I only grind Blind 75” misses wallet / slate / compliance |

## Coding and design flavor

Official engineering note: user-facing products at **millions** of users; decisions are fast with long-term impact. Live work: peak-slate traffic, wallets, odds, geo / RG rules. Design: accept a bet when the line moves, idempotent wallet debit, DFS lineup lock. Related: [../answers/system-design-payment.md](../answers/system-design-payment.md), [../answers/system-design-ticketmaster.md](../answers/system-design-ticketmaster.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** sports-entertainment stack — a customer-trust call, not “I watch games.”
2. Values: own the outcome or calculated risk after a bad ship.
3. Design: bet or DFS lock when price / roster changes mid-click.
4. Coding: OOP model you can extend (new robot / new discount rule).
5. Questions: HackerRank vs live OOD, hub, AI, first-90-days bar.

## Prep checklist

- [ ] Read [How we hire](https://careers.draftkings.com/working-here/how-we-hire/) + [values](https://careers.draftkings.com/working-here/) + [HM advice](https://careers.draftkings.com/life-at-draftkings/our-culture/advice-from-hiring-managers-before-your-interview/)
- [ ] Recruiter: assessment type, language, hub, AI, sportsbook vs DFS
- [ ] STAR bank mapped to **a few** values; one wallet / slate design sketch
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [How We Hire — DraftKings Careers](https://careers.draftkings.com/working-here/how-we-hire/) — accessed 2026-10-20
- [Working Here / values — DraftKings](https://careers.draftkings.com/working-here/) — accessed 2026-10-20
- [Advice from Hiring Managers — DraftKings](https://careers.draftkings.com/life-at-draftkings/our-culture/advice-from-hiring-managers-before-your-interview/) — accessed 2026-10-20
- [DraftKings Careers](https://careers.draftkings.com/) — accessed 2026-10-20
- [Software Engineer Interview at DraftKings — r/DevelEire](https://www.reddit.com/r/DevelEire/comments/1cndojz/software_engineer_interview_at_draftkings/) — accessed 2026-10-20
