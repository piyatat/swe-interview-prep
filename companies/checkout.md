# Checkout.com engineering track

Sits beside [adyen.md](adyen.md) and [stripe.md](stripe.md): **global acquiring / payment processing (CKO)**, not a consumer wallet and not Adyen’s Formula-board closer. Official [Technology](https://www.checkout.com/departments/technology): platforms that connect businesses, customers, and financial networks. Recruiter confirms **gateway / issuing / fraud / Fabric tooling**, language (Java / .NET / Go / Python on the public challenge), hub (London hybrid), and **live vs take-home**.

Typical timeline **four to six weeks** (official jobs FAQ; sometimes less). Take-homes: [../general/take-homes.md](../general/take-homes.md). Payments: [../answers/system-design-payment.md](../answers/system-design-payment.md). Comp: [../general/offer-negotiation.md](../general/offer-negotiation.md).

## Official culture (Aspire / Excel / Unite)

Do **not** invent Amazon-style LPs. Official [mission](https://www.checkout.com/mission) + [Life at Checkout](https://www.checkout.com/life-at-checkout): three values (**Aspire, Excel, Unite**) and **twelve operating principles**. Map **your** stories.

| Official principle | What they score |
| --- | --- |
| **Customer first** | Merchant outcome, not a local hack |
| **Run lean** | ROI on every choice |
| **Better every day** | Same mistake twice is a fail |
| **Never give up** | Resilience without drama |
| **Athlete mindset** | Rigorous plan; no finish line |
| **Be the owner** | Accountable to customers and colleagues |
| **No room for approximation** | Detail + data |
| **Pace matters** | Urgency and responsiveness |
| **Talk straight** | Honest, respectful challenge |
| **One team** | Rally after the decision |
| **Fundamentally positive** | Trust compounds |
| **Being together** | Official hybrid: **Tue–Thu in office** (jobs FAQ, from 1 Aug) |

“Why Checkout?” that only says “fintech / London / payments” fails. Name an **auth, capture, idempotent retry, or acquirer-timeout** problem you have lived.

## Official process (Technology + jobs)

Official [jobs](https://www.checkout.com/jobs) four stages (task may move or skip). Official **Technology** page is the SWE skeleton.

| Stage | Official |
| --- | --- |
| Talent Partner | Experience, what you want next |
| Team screen | Tech-led: breadth, depth, engineering approach |
| Coding assessment | **Live or take-home — your choice**; core coding |
| Onsite | **Separate** system design + **values / Operating Principles** |
| Offer | Jobs FAQ: written feedback **after the recruiter screen**; ~**4–6 weeks** |

Jobs FAQ still says tech interviews “involve a take-home.” Technology is more specific for SWE: **candidate-chosen live vs take-home**. Recruiter wins. Official public sample: [cko-recruitment payment-gateway-challenge-java](https://github.com/cko-recruitment/payment-gateway-challenge-java) (also .NET / Go / Python). Shape: validate a card payment, talk to a **simulated acquirer**, return Authorized / Declined / Rejected, **GET by id**. Do not paste the spec; ship a **narrow complete path** you can defend (validation, timeouts, no double-charge).

## How this track differs

| vs Stripe / Adyen | vs FAANG |
| --- | --- |
| Official **live or take-home choice**, then design + values | Product is **gateway / acquirer**, not “design Twitter” |
| Twelve named principles under Aspire / Excel / Unite | Hybrid **three office days** is published |
| Public **payment-gateway** challenge repos | “I only grind LeetCode” misses the gateway task |

## Coding and design flavor

Official Technology: high-scale payments, proprietary **Fabric**. Live work looks like request validation, acquirer I/O, idempotency keys, PCI-shaped storage (don’t log PAN). Design: auth → capture, timeout with unknown result, multi-acquirer fallback. Related: [../answers/system-design-payment.md](../answers/system-design-payment.md), [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md).

## Sample prompts (shapes, not leaked puzzles)

1. Why **this** PSP — a correctness call that protected a merchant.
2. Gateway task: invalid expiry is **Rejected** (no bank call); bank says no → **Declined**.
3. Same POST after a timeout — what is stored, what is charged.
4. Values: talk straight — you challenged a number with data, then rallied.
5. Questions for them: live vs take-home, language, Fabric vs gateway team, AI-on-assessment.

## Prep checklist

- [ ] Read [Jobs / How we hire](https://www.checkout.com/jobs) + [Technology hiring process](https://www.checkout.com/departments/technology) + [mission / principles](https://www.checkout.com/mission)
- [ ] Recruiter: live vs take-home, language, hub, AI / recording
- [ ] One gateway-shaped API (validate → call bank → persist) you can walk line by line
- [ ] Comp after written offer: [../general/offer-negotiation.md](../general/offer-negotiation.md)

## Sources

- [Work alongside amazing people — Checkout.com Jobs](https://www.checkout.com/jobs) — accessed 2026-10-18
- [Technology at Checkout.com](https://www.checkout.com/departments/technology) — accessed 2026-10-18
- [Mission — Checkout.com](https://www.checkout.com/mission) — accessed 2026-10-18
- [Life at Checkout](https://www.checkout.com/life-at-checkout) — accessed 2026-10-18
- [cko-recruitment/payment-gateway-challenge-java](https://github.com/cko-recruitment/payment-gateway-challenge-java) — accessed 2026-10-18
