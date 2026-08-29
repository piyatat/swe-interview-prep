# Payment / ledger — system design outline

**Prompt:** Design a payment service: charge a card, refund, show status. Classic #10 in [../general/system-design.md](../general/system-design.md). Domain flavor also appears on [../companies/product-companies.md](../companies/product-companies.md) (Stripe).

This is **correctness under retries**, not QPS theater. Money must not be lost, doubled, or stuck without an audit trail.

Confirm: you are the **merchant** (talk to a PSP) vs you **are** the processor. v1 is almost always merchant + Stripe-class PSP.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Create payment, get status, refund | No double charge on client retry |
| Async final state (bank / 3DS) | Ledger balances; nightly reconcile vs PSP |
| Webhook → mark paid / failed / dispute | PCI: never store raw PAN (tokens only) |

Non-goals unless asked: full card network, FX, payout split, marketplace escrow.

## Estimation sketch (example)

- 10M users, 5% pay / day → ~6 payments/s average, **100×** holiday burst
- State is small (rows + ledger lines). Bottleneck is **PSP latency + webhook storms**, not disk.

## High-level

```
Client → API (Idempotency-Key)
       → Payments DB  (intent + status machine)
       → Outbox → worker → PSP (tokenized PAN)
PSP ──webhook──→ verify sig → apply event (dedupe event.id) → ledger
Finance ← settlement file vs ledger (recon)
```

**PaymentIntent-shaped state:** `requires_action` → `processing` → `succeeded` | `failed`. Capture may be separate from authorize.

## Deep dives

### Idempotency (Stripe API)

Official: client sends `Idempotency-Key` (UUID, ≤255 chars, **not PII**) on **POST**. Server stores status + body of the **first** execution (≥24 h) and replays it, **including 5xx**. Same key + **different params** → error. GET/DELETE do not need the key.

Implementation sketch: unique `(account, key)` row; **claim** with `INSERT … ON CONFLICT` (no check-then-act); store request hash; in-flight → `409` / `202 + Retry-After`, not a second charge.

### Ledger (Stripe engineering)

Stripe’s Ledger is an **immutable** log of money movement: double-entry **debits and credits** that balance; accounts + events; reconstruct state by replay. Interview version:

- Integer **cents**, never float.
- Append-only lines grouped by `txn_id`; never UPDATE a posted amount — post a reversal.
- Invariant: sum(debits) = sum(credits) per transaction.
- Clearing accounts should drain; leftover balance = a bug you can query.

### Webhooks (Stripe docs)

PSP result is **async**. Register HTTPS endpoint; verify **signing secret**. Official model: events can be **delivered more than once**, out of order. Dedupe on `event.id` before side effects. On success return 2xx quickly; do heavy work via outbox. Treat the webhook as a **signal** — optionally **GET the PaymentIntent** before crediting.

### Dual-write / outbox

Do not `UPDATE payments` then `publish Kafka` in two hops. Same DB txn: status + outbox row; relay publishes at-least-once; consumers idempotent.

## Failure / ops

| Failure | Response |
| --- | --- |
| Client timeout after PSP charged | Retry **same** idempotency key |
| Webhook lost | PSP retries days; recon file is backstop |
| Worker dies mid-PSP call | Key still `processing`; do not start a new charge |
| Chargeback | New ledger entries; do not rewrite history |

Metrics: intent success, duplicate-key replay rate, webhook lag, **recon break $**.

## Common mistakes

- “Just call Stripe” with no key, no state machine, no ledger.
- Crediting the user on every webhook retry.
- Floats; mutable balances as source of truth.
- 2PC across your DB and the card network.
- Designing fraud ML before the money path is safe.

## Sources

- [Idempotent requests — Stripe API](https://docs.stripe.com/api/idempotent_requests) — accessed 2026-08-29
- [Receive Stripe events (webhooks) — Stripe Docs](https://docs.stripe.com/webhooks) — accessed 2026-08-29
- [Ledger: tracking and validating money movement — Stripe](https://stripe.dev/blog/ledger-stripe-system-for-tracking-and-validating-money-movement) — accessed 2026-08-29
- [Design a Payment System — InterviewLoop](https://interviewloop.app/learn/system-design/design-a-payment-system-stripe) — accessed 2026-08-29
- [Design a Payment System (Stripe / PayPal) — HLD Handbook](https://hld.handbook.academy/curriculum/case-studies/payment-system/) — accessed 2026-08-29
