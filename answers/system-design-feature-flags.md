# Feature flags / toggle service — system design outline

**Prompt:** Design a **feature-flag** (toggle) service: create / target / evaluate flags so teams can ship dark, ramp %, kill a feature, and run experiments **without a redeploy**. LaunchDarkly / Unleash / AppConfig shaped.

**Not** [system-design-job-scheduler.md](system-design-job-scheduler.md) (time + workers) and not [system-design-distributed-lock.md](system-design-distributed-lock.md) (mutex). Here the hot path is **evaluate in microseconds**, with a **stale-but-available** config plane. Wikipedia [feature toggle](https://en.wikipedia.org/wiki/Feature_toggle).

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Boolean / multivariate flags; targeting (user, account, attr); % rollout | Eval **local** on the request path — no RPC per check |
| Sticky assignment while ramping; kill switch; default when offline | Control-plane strongly consistent; data-plane **AP** |
| Audit: who changed what, why, which revision | Fail-open vs fail-closed is a **product** choice per flag |
| Server SDK vs browser/mobile SDK | Propagation SLA (seconds), not ms worldwide lockstep |

Pete Hodgson / Fowler: **release, experiment, ops, permissioning** toggles have different lifetimes. Treating a 2-year entitlement flag like a 2-day release flag is how you get **toggle debt**.

## Estimation sketch (example)

- 5k flags × 50 environments; 20k server SDK processes; eval QPS is **in-process** (not the flag service’s QPS)
- Config publish: tens–hundreds/s globally; payload small (rules, not user lists of millions)
- Telemetry (which variant served) is **async** and droppable — never on the eval path

## High-level

Split **control plane** (authoring) from **data plane** (distribution + eval). Unleash and LaunchDarkly both do this; AWS AppConfig names the split in the API.

```
Admin UI / API
  → immutable revision + audit (Postgres)
      → publisher → CDN snapshot + stream (SSE / streaming)
          → Server SDK: full rules, eval locally
          → Client SDK: pre-evaluated values only (do not ship allowlists)
```

Server SDK: fetch rules, cache in memory, eval with context. Client SDK: **must not** download “user X is in the internal allowlist.” Unleash: frontend eval on **Edge / server**; LaunchDarkly: streaming to SDKs, polling only when streams are a bad fit (mobile data).

## Deep dives

### Deterministic buckets (no flicker)

`bucket = hash(flag_key + salt + user_id) % 10000`. Compare to the % threshold. Same user, same flag, same salt → same variant after a restart. Changing salt **reshuffles** — say that out loud. Stickiness across devices needs a stable id, not a cookie that rotates.

Rule order (interview default): prerequisites → explicit targets → attribute rules → % rollout → default.

### Fail-open vs fail-closed

A marketing banner should fail **open** (default off is fine). An authz / entitlement / fraud flag should fail **closed** (deny / old path). Store the default **in the SDK** so a cold start with no network still has an answer. LaunchDarkly: in-memory store never expires; optional persistent store / Relay Proxy if init can miss the network.

### Who evaluates

| SDK | Eval where | Why |
| --- | --- | --- |
| Backend | Local, full ruleset | Privacy + ns latency (Unleash / LD server SDKs) |
| Frontend | Edge or server, return **values** | Rules would leak targeting |

Do not put PII in flag keys. Telemetry: sample, buffer, drop — **never block** `if (flags.on("x"))`.

## Failure / ops

- Publisher / CDN down: SDKs keep last snapshot; new processes use code defaults
- Bad revision: checksum + staged publish + one-click rollback to previous immutable rev
- Kill switch is an **ops** flag with a short propagation SLO, not a deploy
- Metrics: publish lag p99, SDK stream reconnects, eval errors, % of defaults-used
- Cleanup: flags that are 100% on for N weeks are **debt** — owner, expiry, delete

## Common mistakes

- `GET /flags/{key}` on every request (you designed a latency and outage magnet).
- Shipping the full targeting ruleset to the browser.
- Random() for % rollout (flicker; not sticky).
- One “flag type” for release, experiment, and permissioning.
- Making eval wait on the analytics pipeline.
- No audit / no rollback on a production targeting change.

## Sources

- [Feature Toggles (aka Feature Flags) — Hodgson / Fowler](https://www.martinfowler.com/articles/feature-toggles.html) — accessed 2026-11-22
- [Feature toggle — Wikipedia](https://en.wikipedia.org/wiki/Feature_toggle) — accessed 2026-11-22
- [Unleash architecture overview](https://docs.getunleash.io/get-started/unleash-overview) — accessed 2026-11-22
- [LaunchDarkly architecture](https://launchdarkly.com/docs/home/getting-started/architecture) — accessed 2026-11-22
- [Feature Flag System Design Interview Guide — PracHub](https://prachub.com/resources/feature-flag-system-design-interview-guide-rollouts-consistency-and-auditability) — accessed 2026-11-22
