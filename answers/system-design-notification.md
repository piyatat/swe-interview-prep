# Notification system — system design outline

**Prompt:** Design multi-channel notifications (push, email, SMS, in-app) at scale: OTP and payment alerts must not wait behind a marketing blast. Mobile push as a *product* feature is also in [../roles/mobile.md](../roles/mobile.md); this is the **platform**.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Ingest event → resolve user/devices → send on allowed channels | At-least-once + **dedupe** (no double OTP) |
| Templates, locale, deep links | Transactional p99 seconds or less; marketing can batch |
| Preferences, quiet hours, opt-out / legal (SMS/email) | Provider outages; track sent / delivered / bounced |

**Priority classes:** transactional (OTP, security) vs operational (shipped) vs marketing. Transactional often **bypasses** marketing opt-out and quiet hours — confirm product/legal.

## Estimation sketch (example)

- Fan-out: one social event → millions of notifications (see [system-design-news-feed.md](system-design-news-feed.md) celebrity problem)
- Provider caps (APNs/FCM/SMS) are **first-class** rate limits, not an afterthought
- Payload size: APNs/FCM are small; don’t put the whole email body on push

## High-level components

```
Producer services → Notification API (validate, idempotency, 202)
                 → Kafka (topics by priority: critical / high / low)
                 → Orchestrator (prefs cache, devices, template)
                 → Per-channel queues + workers
                      Push → APNs / FCM
                      Email → SES / SendGrid
                      SMS  → Twilio / SNS
                      In-app inbox → DB
                 → Webhooks → delivery log
                 → DLQ + oncall
```

Decouple **ingest** from **providers**. A slow email ISP must not block SMS OTPs — **separate topics and worker pools**.

## Deep dives

### Idempotency and retries

- Client idempotency key; Redis/DB `(user, type, key)` with TTL
- At-least-once Kafka → workers must be **idempotent**
- Exponential backoff + jitter; exhaust → DLQ; don’t infinite-retry a hard bounce

### Preferences

- Matrix: event class × channel × opt-in; quiet hours in **user TZ**
- Hot path: cache (process LRU + Redis) with **immediate invalidate** on settings change
- Quiet hours: queue marketing; still send 2FA

### Push (official transport)

FCM: app server → FCM backend → **platform transport** (Android ATL, **APNs** for Apple, web push). Device **registration tokens** rotate; drop invalid tokens on provider error. One user, many devices.

### Email / SMS

- Transactional vs marketing on **separate** sending domains/IPs (reputation)
- SMS: E.164, TCPA/GDPR opt-in; fallback provider
- Honor unsubscribe; hard-bounce suppression

### Broadcast / fan-out

- Precompute audience lists; drip (100K/hour) so you can **pause** a bad campaign
- Per-user marketing cap (Redis daily counter)

## Failure / ops

- Priority starvation — isolate critical topic
- Provider 5xx — failover second vendor without burning retry budget on the first timeout
- Metrics: enqueue lag, per-channel success, p99 send latency, bounce/complaint, DLQ depth

## Startup vs FAANG angle

| FAANG | Startup |
| --- | --- |
| Custom Kafka + dual vendors + preference service | One vendor (Customer.io / Braze / SNS) + Postgres prefs |
| Celebrity fan-out pipeline | Per-user sends only |

## Common mistakes

- One queue for OTP and newsletter
- No idempotency → duplicate 2FA on redelivery
- Ignoring quiet hours / opt-out
- Treating FCM/APNs as a DB instead of a **best-effort** transport with receipts

## Sources

- [FCM Architectural Overview — Firebase](https://firebase.google.com/docs/cloud-messaging/fcm-architecture) — accessed 2026-08-25
- [Notification Service (Push, SMS, Email) — techinterview.org](https://www.techinterview.org/post/3233461699/system-design-notification-service/) — accessed 2026-08-25
- [Design a Notification System — Systems Explained](https://systeminternals.dev/system-design-interview/notification-system/) — accessed 2026-08-25
- [Notification HLD example — Abstract Algorithms](https://abstractalgorithms.dev/system-design-hld-notification-service-example) — accessed 2026-08-25
