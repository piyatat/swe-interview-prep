# GitLab engineering track

Sits beside [github.md](github.md) and [atlassian.md](atlassian.md): **all-remote DevSecOps platform** (git, CI, security, a large Rails monolith), not a GitHub clone loop. Official [Candidate Handbook](https://handbook.gitlab.com/handbook/hiring/candidate-faq/): apply → screen → optional assessment → technical → team interviews → references / optional TMRG chat → offer + background. Official [Technical Interviews](https://handbook.gitlab.com/handbook/hiring/interviewing/technical/): a **self-contained merge request** ≥72 hours before a **90-minute** walkthrough + pair, not a live GitLab.com issue. Recruiter confirms **backend Rails vs frontend Vue vs Go/SRE**, written quiz vs MR, and AI (official: **encouraged** — still confirm the live policy).

Typical timeline **~5 weeks** (2026 guides). Review: [../general/code-review-rounds.md](../general/code-review-rounds.md). Pair: [../general/pair-programming.md](../general/pair-programming.md). CI design: [../answers/system-design-job-scheduler.md](../answers/system-design-job-scheduler.md).

## Official culture (CREDIT + 2026 operating principles)

Do **not** recite posters. Map **your** stories. Official [Values](https://handbook.gitlab.com/handbook/values/) still spell **CREDIT** (the credit we give by assuming good intent):

| Official value | What they score |
| --- | --- |
| **Collaboration** | Work together; collaboration is **not** consensus |
| **Results for Customers** | Ship promised outcomes, not activity |
| **Efficiency** | Global optimum; boring technology when it works |
| **Diversity, Inclusion & Belonging** | Seek diverse perspectives; everyone can contribute |
| **Iteration** | Smallest valuable change; feedback over a perfect v1 |
| **Transparency** | Public by default; admit mistakes |

Official [Operating Principles](https://handbook.gitlab.com/handbook/company/operating-principles/) (AI-era): **Speed with Quality**, **Ownership Mindset**, **Customer Outcomes**, on a **Culture of Excellence**. The page **acknowledges CREDIT** as the first-decade framework — not retired, no longer the primary operating lens. Prepare CREDIT stories **and** “how I used an agent, then verified.”

“Why GitLab?” that only says “I want remote” fails. Name a **CI, review, or async-writing** problem you have lived.

## Official + reported process

Official candidate FAQ + backend job descriptions (handbook, 2026) are the skeleton. Guides add flavor — treat extra DSA rounds as **reported**.

| Stage | What they score |
| --- | --- |
| Application (official) | Fit vs posting; some roles: short written / technical questionnaire |
| Screening call 30–40 min (official) | Why GitLab, skills, location, visa (GitLab generally **does not sponsor** except limited NL cases — handbook), salary **range vs history** |
| Technical (official) | Async MR review (~1 hour, comments **≥24 hours** before) + 90 min video: walk the review, then **improve the MR** |
| Team / behavioral (official JDs) | EM values / remote; often a director conversation |
| References (official) | Typically three; ≥1 past manager when possible; optional TMRG connection |
| Offer (official) | Background screen by location |

Official: interviews after screen are **on camera** (conducting-a-gitlab-interview). No-show on the recruiter Zoom without notice can disqualify; they unreject when the miss was beyond your control.

## How this track differs

| vs GitHub | vs FAANG |
| --- | --- |
| Official **MR review is the coding hour**; GitHub is take-home / pair / Actions | Puzzle DSA is **not** the brand; writing quality is |
| **All-remote + handbook**; location-factored pay is public culture | Same collaboration bar; GitLab is **async issues / MRs** |
| Design stays **monolith-compatible** (Postgres, Sidekiq, runners) | Microservices-everywhere answers fight the product |

## Coding and design flavor

Official MR: bugs, tests, N+1 / indexes, tone of comments (kind + specific). Live: fix tests or a small feature in **that** repo. Guides: Rails / Vue / Go match the posting. Design: CI fan-out, container registry, merge-request validation, audit logs. Related: [../answers/system-design-file-storage.md](../answers/system-design-file-storage.md), [../general/ai-assisted-rounds.md](../general/ai-assisted-rounds.md).

## Sample prompts (shapes, not leaked puzzles)

1. “Iteration — you shipped a thin slice instead of waiting for perfect.”
2. Async: review an MR; comment on a missing test and a query that will not scale.
3. Live: make the MR’s failing spec pass without expanding scope.
4. Design CI for tens of thousands of concurrent pipelines — start from runners + queues, not a new mesh.
5. Transparency: a mistake you documented in public (issue, postmortem, handbook-style note).

## Prep checklist

- [ ] Read [Candidate FAQ](https://handbook.gitlab.com/handbook/hiring/candidate-faq/), [Technical Interviews](https://handbook.gitlab.com/handbook/hiring/interviewing/technical/), [Values](https://handbook.gitlab.com/handbook/values/), [Operating Principles](https://handbook.gitlab.com/handbook/company/operating-principles/)
- [ ] Recruiter: MR timing, language, camera, AI (official: encouraged), country eligibility
- [ ] Practice a real code review + one small pair fix; skip olympiad graphs unless they say otherwise
- [ ] STAR bank: all six CREDIT values + one operating-principle story
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Candidate Handbook — GitLab](https://handbook.gitlab.com/handbook/hiring/candidate-faq/) — accessed 2026-09-14
- [Technical Interviews — GitLab Handbook](https://handbook.gitlab.com/handbook/hiring/interviewing/technical/) — accessed 2026-09-14
- [GitLab Values](https://handbook.gitlab.com/handbook/values/) — accessed 2026-09-14
- [Operating Principles — GitLab Handbook](https://handbook.gitlab.com/handbook/company/operating-principles/) — accessed 2026-09-14
- [Intermediate Backend Engineer (hiring process) — GitLab](https://handbook.gitlab.com/job-description-library/engineering/development/backend/intermediate/) — accessed 2026-09-14
- [GitLab Interview Prep 2026 — jobsbyculture](https://jobsbyculture.com/blog/gitlab-interview-prep-2026) — accessed 2026-09-14
- [GitLab Interview Guide 2026 — techinterview.org](https://www.techinterview.org/companies/gitlab/) — accessed 2026-09-14
