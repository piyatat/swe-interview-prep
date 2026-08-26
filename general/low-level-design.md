# Low-level design / OOP / machine coding

The interviewer hands you a **small system** (parking lot, elevator, vending machine, trip lifecycle) and watches you turn vague requirements into **classes, interfaces, and state**. Same round is often called **OOD** or **machine coding**. Distinct from [system-design.md](system-design.md) (services, scale, data stores — almost no class diagrams) and from [coding-patterns.md](coding-patterns.md) (one algorithm, one file).

Ask the recruiter: **pseudocode vs compiling code**, language, and whether they want named GoF patterns. US big-tech often wants partial real language; some India / APAC loops want structured pseudocode plus pattern vocabulary.

## HLD vs LLD (say this once)

Ride-sharing **HLD**: matching service, location store, trip DB, queues — see [../answers/system-design-ride-sharing.md](../answers/system-design-ride-sharing.md).  
Ride-sharing **LLD**: `Trip`, `TripState`, `PricingCalculator`, invalid-transition errors — methods and ownership, not QPS.

Hello Interview’s map: **system design is the map; LLD is the blueprint for one building.**

## 45–60 minute delivery

1. **Clarify (5 min)** — actors, must-have flows, non-goals (no billing UI, no 1M spots). Lock 3–5 use cases.
2. **Entities (5 min)** — nouns that own state. Kill the god class early (`ParkingLot` that prices *and* assigns *and* prints receipts).
3. **Contracts (5–10 min)** — method signatures, who calls whom, which axis of change is an **interface** (pricing, dispatch, payment).
4. **Code / pseudocode (20–25 min)** — happy path + one invalid transition. Composition over deep inheritance.
5. **Extend (5–10 min)** — interviewer adds EV spots, SCAN vs FCFS elevators, surge pricing. A good design absorbs this in **one new type**, not five edits.

## What they score

| Signal | Strong | Weak |
| --- | --- | --- |
| **Scope** | Questions before types | Types before “who parks” |
| **Responsibilities** | One job per class | God object + anemic DTOs |
| **State** | Explicit enum + guarded transitions | Booleans (`isMoving` + `isOpen`) that conflict |
| **Change** | Strategy / state behind an interface | `if vehicleType == TRUCK` in five files |
| **Patterns** | Name only when it earns its keep | Catalog dump (Singleton parking lot) |
| **Talk** | Narrate tradeoffs | Silent UML |

Modern production LLD in interviews favors **composition, simple state machines, and pragmatism** — not textbook 23-pattern worship.

## Patterns that actually recur

| Pattern | Typical prompt |
| --- | --- |
| **Strategy** | Pricing, spot assignment, elevator dispatch |
| **State** | Elevator / trip / vending lifecycle |
| **Factory** | Ticket / vehicle construction without `switch` in the lot |
| **Observer** (light) | Floor displays; don’t overbuild |

Concurrency follow-up (two gates park at once): name a **lock grain** (per spot vs per floor) or a single assigner thread — do not wave “synchronized” on the whole lot.

## Canonical prompts (drill three)

1. **Parking lot** — Vehicle vs Spot types, ticket in/out, Strategy for fees, concurrent gates.
2. **Elevator** — per-car state machine; **Dispatcher** chooses a car (SCAN / nearest / zone).
3. **Vending / library / rate limiter** — inventory + money, or token-bucket **objects** (cousin of [../answers/system-design-rate-limiter.md](../answers/system-design-rate-limiter.md) HLD).

## Strong answer shape (parking lot)

- Types: `ParkingLot` → `Floor` → `Spot`; `Vehicle`; `Ticket`; `PricingStrategy`.
- Mapping: motorcycle → motorcycle spot; car → compact; truck → large (or “smallest fit”).
- Park: find spot, occupy, issue ticket. Unpark: fee from **duration + strategy**, free spot.
- Follow-up: EV / handicapped / hourly vs daily — new strategy or spot subtype, not a rewrite.

## Common mistakes

- Jumping to code before entities.
- Inheritance trees for every vehicle *and* every spot with copy-paste logic.
- Promising distributed scale in an LLD (wrong interview).
- No invalid-state handling (`complete()` from `REQUESTED`).
- Pattern names without a seam they protect.

## Sources

- [Low Level Design in a Hurry — Hello Interview](https://www.hellointerview.com/learn/low-level-design/in-a-hurry/introduction) — accessed 2026-08-26
- [Low-Level Design Interview — PracHub](https://prachub.com/resources/low-level-design-interview-what-lld-is-and-how-to-crack-it) — accessed 2026-08-26
- [LLD Questions: Parking Lot, Elevator — PhantomCodeAI](https://www.phantomcodeai.com/blogs/lld-questions) — accessed 2026-08-26
- [Design a Parking Lot — InterviewLoop](https://interviewloop.app/learn/low-level-design/6-design-a-parking-lot-oop-design-patterns-interview-guide) — accessed 2026-08-26
- [Top 20 LLD Interview Questions (2026) — Low Level Design Mastery](https://www.lowleveldesignmastery.com/blog/low-level-design-interview-questions/) — accessed 2026-08-26
