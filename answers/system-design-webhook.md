# Webhook delivery — system design outline

**Prompt:** Design a **webhook delivery platform** (you *are* Stripe / GitHub): merchants register HTTPS URLs; your system pushes events at-least-once with signatures, retries, and isolation. Classic product-company prompt ([../companies/stripe.md](../companies/stripe.md), [../companies/twilio.md](../companies/twilio.md)).

**Not** [system-design-payment.md](system-design-payment.md) (you are the **merchant** receiving a PSP). **Not** [system-design-notification.md](system-design-notification.md) (push/email/SMS to humans). **Not** [system-design-pubsub.md](system-design-pubsub.md) (internal log). Here the new work is **untrusted customer HTTP**.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Register HTTPS endpoint + event types + signing secret | At-least-once; **never lose** a committed event |
| POST JSON; HMAC signature; attempt log + replay | One slow merchant must not stall the fleet |
| Retry failed deliveries; disable a dead endpoint | p99 enqueue small; delivery SLA minutes, not ms |

Out of scope unless asked: producing the business event (outbox of the source service), ordered delivery, non-HTTPS transports.

## Estimation sketch (example)

Stripe-class: tens of k events/s, fan-out = events × endpoints. Bytes are small; **tail latency and retries** dominate. GitHub docs: fail the attempt if the receiver is not **2xx within 10 s**. Plan connection pools, timeouts, and a queue — not a thread per POST.

## High-level — control vs data plane

```
Source service  → outbox / event log (id, type, payload, created_at)
                     → dispatcher (match subscriptions)
                          → per-endpoint queue (fairness)
                               → workers: sign + POST + timeout
                                    2xx → delivered
                                    5xx / timeout / 429 → retry schedule
                                    other 4xx → fail attempt, keep replay
                          → attempt log (status, latency, body prefix)
```

Wikipedia [webhook](https://en.wikipedia.org/wiki/Webhook): HTTP callback, subscriber exposes the URL. You own **auth of the sender**, not the receiver’s app.

## Deep dives

### Sign and verify (Stripe + GitHub)

- **HTTPS only.** Secret is high-entropy, stored hashed-at-rest on your side; merchant sees it once (`whsec_…` in Stripe).
- Stripe: `Stripe-Signature` with `t=` timestamp and `v1=` **HMAC-SHA256** over `{t}.{raw body}`. Reject if `|now - t|` exceeds tolerance (~5 min) — replay window. **Raw body**; parsed JSON will not match.
- GitHub: `X-Hub-Signature-256`; compare MAC in **constant time**. Delivery id `X-GitHub-Delivery` for dedupe (same id on manual redeliver).
- Rotate: accept **two** secrets for a window. IP allowlists are extra, not a substitute for HMAC ([HMAC](https://en.wikipedia.org/wiki/HMAC)).

### At-least-once + retries

Stripe live mode: exponential backoff **up to ~3 days**; sandbox is shorter. GitHub: **no** automatic retry — merchant or API redelivers. In an interview, pick one and say the other. Document duplicates; receivers dedupe on `event.id`. **No order** (Stripe: subscription create vs `invoice.paid` can swap). 2xx must be **fast** — enqueue work, then ACK, or *you* will retry a slow 200.

### Isolation

Per-endpoint **concurrency cap** and its own retry clock. A 30 s hung socket on merchant A must not eat workers for B. Fair queue / shuffle sharding. After N days of zero success: **disable** + email; replay is paced so recovery does not DDoS them.

## Failure / ops

- Poison JSON / huge body: cap payload; fail closed.
- Signing bug ships: dual-write old/new scheme; metrics on verify fail.
- Metrics: enqueue lag, attempt success, p99 POST, disable rate, replay backlog.
- Manual replay must **not** cancel Stripe-style automatic retries unless you treat 2xx as delivered (Stripe: a dashboard resend does not stop the retry schedule — receivers still dedupe).

## Common mistakes

- Signing the **parsed** JSON (whitespace / key order).
- Processing before 2xx, then timing out — infinite duplicate side effects on the receiver.
- One global worker pool (noisy neighbor).
- Promising **exactly-once** or total order.
- Retrying `401`/`404` forever (fix the URL; keep replay).

## Sources

- [Receive Stripe events in your webhook endpoint — Stripe Docs](https://docs.stripe.com/webhooks) — accessed 2026-11-24
- [Best practices for using webhooks — GitHub Docs](https://docs.github.com/en/webhooks/using-webhooks/best-practices-for-using-webhooks) — accessed 2026-11-24
- [Handling failed webhook deliveries — GitHub Docs](https://docs.github.com/en/webhooks/using-webhooks/handling-failed-webhook-deliveries) — accessed 2026-11-24
- [Webhook — Wikipedia](https://en.wikipedia.org/wiki/Webhook) — accessed 2026-11-24
- [HMAC — Wikipedia](https://en.wikipedia.org/wiki/HMAC) — accessed 2026-11-24
- [Design a Webhook Delivery System — Ironclad Academy](https://ironclad.academy/system-design/articles/design-webhook-system) — accessed 2026-11-24
