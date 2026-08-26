# Online assessments (OA / GCA / Karat)

Timed **front-door screens** before a human loop: a link, a clock, and a browser IDE. Distinct from [take-homes.md](take-homes.md) (multi-hour artifact + debrief) and from onsite live coding (an interviewer in the room). Recruiter logistics live in [recruiter-screen.md](recruiter-screen.md). **Ask which vendor and which rules** — certified CodeSignal GCA ≠ a custom HackerRank test ≠ Karat live.

## What the vendor is actually scoring

| Format | Who watches | Typical signal |
| --- | --- | --- |
| **Async OA** (CodeSignal GCA, HackerRank Test, Codility) | Proctoring + auto tests | Correctness under a timer; sometimes a reusable score |
| **Live interview-as-a-service** (Karat) | Trained Interview Engineer | Code **and** narration; report to the company |
| **Company custom** | Mix | Follow the **invite PDF**, not a blog’s default |

Karat’s 2026 hiring survey: async **code tests and take-homes lose signal fastest** under AI (output without process). Many companies still use them as volume filters. Your job is to pass **this** screen under **this** invite’s rules — not to argue the industry trend in the IDE.

## CodeSignal GCA (certified default)

Official structure (company may override duration):

- **Four** implementation / problem-solving tasks, **all visible** when the timer starts.
- Standard **70 minutes**, one sitting, **no pause**.
- Work in **CodeSignal’s editor**, not your local IDE.
- Submit as often as you want; **highest-scoring submission per task is kept**.
- Setup (camera / ID) is **before** the scored clock — use it to fix permissions.

Certified rules commonly: **no AI**, including for syntax; web search limited to **syntax** references. Identity / webcam / screen share may apply. Read the checkbox list in setup; a previous company’s custom test does not transfer.

**Time box:** 5 min scan all four → bank the two you can finish cleanly → one harder attempt → last 5 min protect green tests. Three complete solves usually beat a heroic unfinished fourth. Practice **in CodeSignal** so submit / test / history tabs are muscle memory.

## HackerRank / Codility (company tests)

HackerRank **Tests** are typically the first screen; passing them may unlock a **HackerRank Interview** (live collab). Question mix follows the **role** (frontend vs backend vs DSA). Time limit, language list, and whether you can leave and return are **setter-defined**. Use in-IDE Help / FAQ; do not assume LeetCode’s editor shortcuts.

## Karat (live, not an OA)

~**60 min** video + Karat editor. A human Interview Engineer runs a structured rubric; the company gets a scorecard, not just tests-passed. Problems often have **progressive parts**. Treat it like an onsite coding round: clarify, narrate, test out loud. Silent perfect code is a weak Karat signal.

## 2026 AI policy (do not guess)

| Invite says | Do |
| --- | --- |
| Certified GCA / “no AI” | Unaided. Detection risk > any speed gain. See [ai-assisted-rounds.md](ai-assisted-rounds.md). |
| Custom OA allows AI | Use it; still **verify** tests yourself. |
| Karat / live | Follow the interviewer; many still want **your** reasoning on camera. |

Leaders in Karat’s survey still often **ban** AI in interviews while estimating candidates use it anyway. That is their problem; **your** problem is the rule you acknowledged.

## Practice and test-day

- Same language you will use on the real test.
- Timed **four-question** mocks, not only single LeetCode mediums.
- Close notes, second monitors, and chat apps before screen share.
- Submit a **correct slow** solution before rewriting for elegance.

Product loops (Uber, some AI labs) still gate on OA scores — see [../companies/product-companies.md](../companies/product-companies.md) and [../companies/ai-labs.md](../companies/ai-labs.md).

## Sources

- [Taking an assessment on CodeSignal — CodeSignal KB](https://support.codesignal.com/hc/en-us/articles/360045953873-Taking-an-assessment-on-CodeSignal) — accessed 2026-08-26
- [GCA Rules and Setup — CodeSignal KB](https://support.codesignal.com/hc/en-us/articles/360051960134-General-Coding-Assessment-GCA-Rules-and-Setup) — accessed 2026-08-26
- [What to expect on the GCA — CodeSignal KB](https://support.codesignal.com/hc/en-us/articles/360040370853-What-should-I-expect-when-I-take-the-General-Coding-Assessment-GCA-and-how-is-it-structured) — accessed 2026-08-26
- [CodeSignal GCA Guide for 2026 — Control](https://trycontrol.app/blog/codesignal-general-coding-assessment-guide-2026) — accessed 2026-08-26
- [Engineering Interview Trends in 2026 — Karat](https://karat.com/engineering-interview-trends-2026/) — accessed 2026-08-26
- [Technical Assessments in the Age of AI — Karat](https://karat.com/technical-assessments-age-of-ai/) — accessed 2026-08-26
- [FAQs before the test — HackerRank candidate support](https://candidatesupport.hackerrank.com/articles/6145743949-frequently-asked-questions-before-the-test) — accessed 2026-08-26
- [Online Interview Assessment Platforms in 2026 — InterviewChamp.AI](https://interviewchamp.ai/learn/online-interview-assessment-platforms-2026) — accessed 2026-08-26
