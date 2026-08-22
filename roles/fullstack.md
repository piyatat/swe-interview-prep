# Full-stack engineer

Full-stack loops combine **frontend depth, backend/API design, and end-to-end product thinking**. Expect coding from either side plus at least one **E2E system design** prompt.

## Typical round mix

| Round | Focus |
| --- | --- |
| Frontend coding | JS/React, DOM, async, UI state |
| Backend coding | APIs, data modeling, SQL |
| System design | Feature spanning client → API → DB → cache |
| Behavioral | Ownership across stack, tradeoffs with designers/PMs |

## Sample questions

### End-to-end design

1. Design a **todo app** with real-time sync across devices.
2. Design **file upload** with progress, resume, and virus scan pipeline.
3. Design a **multi-tenant SaaS** admin dashboard (auth, RBAC, audit log).
4. Design **search** across user-generated content (indexing, ranking).

### Integration & API

1. How do you structure a Next.js app (RSC vs client components)?
2. BFF pattern — when add a backend-for-frontend?
3. GraphQL vs REST for a mobile + web client.
4. How do you handle auth across SPA and mobile?

### Data & consistency

1. Optimistic UI — when safe vs dangerous?
2. Offline-first strategies (service worker, conflict resolution).
3. Pagination across FE and BE — cursor contract.

### Debugging cross-stack

1. User reports “slow save” — how do you bisect FE vs BE vs DB?
2. CORS error in production — causes and fixes.
3. Race on double-submit — idempotency on client and server.

## Prep strategy

1. Master [../general/coding-patterns.md](../general/coding-patterns.md) (still common).
2. Split time **40% FE / 40% BE / 20% design** unless job description skews.
3. Build one portfolio project you can whiteboard end-to-end.

## Pointers

- [frontend.md](frontend.md)
- [backend.md](backend.md)
- [../general/system-design.md](../general/system-design.md)

## Sources

- [Software Engineer Interview Guide — Interview Pilot](https://www.interviewpilot.app/interview-guides/software-engineer) — accessed 2026-08-22
- [Frontend Interview Experience (5 YOE) — LinkedIn post](https://www.linkedin.com/posts/abhinav-gautam-ds-dev_mernstack-fullstackdeveloper-softwareengineering-activity-7450520895695130624-tfjh) — accessed 2026-08-22
