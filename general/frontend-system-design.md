# Frontend system design

Not the same hour as [system-design.md](system-design.md). Backend SD scores load balancers, shards, and write paths. **Frontend SD** scores **component boundaries, client state, rendering, network from the browser, accessibility, and empty/error/loading states**. Meta, Google, and Stripe (GreatFrontEnd, 2026) now run this as a distinct mid/senior round. Role flavor: [../roles/frontend.md](../roles/frontend.md).

Ask the recruiter: **UI-component** hour (autocomplete, modal, table) vs **application** hour (news feed, chat, Pinterest masonry) vs a backend design they mislabeled “frontend.”

## RADIO (45–60 min)

Yangshun Tay’s [RADIO](https://www.greatfrontend.com/front-end-system-design-playbook/framework) is the structure interviewers expect. It is a **coverage checklist**, not a rigid script — iterate when a new requirement lands.

| Step | ~time | Do |
| --- | --- | --- |
| **R**equirements | 10% | Users, devices, core flows, non-goals, a11y, i18n, offline |
| **A**rchitecture | 20% | Components, owners, data flow (props / store / URL / server) |
| **D**ata model | 10% | Entities + which layer holds them (URL, memory, cache, server) |
| **I**nterface | 20% | Component props and client/server APIs (params, errors, pagination) |
| **O**ptimizations | 40% | Perf, a11y, virtualization, rendering strategy, failure modes |

Start with **R**. Drawing boxes before constraints is the #1 fail ([cheatsheet](https://www.greatfrontend.com/front-end-system-design-playbook/cheatsheet)).

## What they score

| Axis | Strong signal |
| --- | --- |
| Problem exploration | Scope cut; “not in v1”; asked about keyboard, empty, lag |
| Architecture | Independent parts with names; who owns fetch vs render |
| FE proficiency | LCP/INP, focus trap, SSR vs CSR, cache keys — not slogans |
| Tradeoffs | Two approaches + a pick; “best” with no cost is weak |
| Product / UX | Loading, error, empty, retry, optimistic UI unprompted |
| Communication | Narrate; take a hint; do not go silent for five minutes |

## Two shapes

| UI component | Application |
| --- | --- |
| Autocomplete, modal, carousel, dropdown, data table, date picker | News feed, chat, photo grid, e-commerce, booking, video player |
| Deep dive: keyboard, focus, list virtualization, a11y tree | Deep dive: routing, auth, realtime, feed pagination, SEO |
| API is small (search, page) | API is a product surface (feed, presence, upload) |

Do **not** spend the component hour on CDN + Kafka. Do **not** spend the application hour on `useMemo`.

## Talking points that actually land

- **Rendering:** CSR vs SSR vs RSC vs streaming — pick from **TTFB / SEO / interactivity**, not fashion.
- **State:** URL for shareable filters; server cache (React Query–class) for remote; local UI state stays local.
- **Lists:** windowing when N is thousands; “just map 50k rows” fails.
- **Network:** debounce search; abort in-flight; cursor pagination; optimistic send with rollback.
- **a11y:** keyboard path, focus restore, `aria-live` for async results, reduced-motion.
- **Perf:** LCP image, INP (main-thread), CLS (reserve space); measure, don’t guess.

## Classic prompts (shapes, not scripts)

1. **Autocomplete** — debounce, keyboard, abort, empty/error, cache, a11y listbox.
2. **News feed** — virtualize, cursor page, new-post banner vs jump, media lazy-load.
3. **Chat UI** — WS reconnect, optimistic send, read receipts, message windowing.
4. **Data table** — sticky header, sort/filter in URL, cell renderers, 100k rows.
5. **Modal** — focus trap, scroll lock, stack, Escape, return focus to opener.

Backend twins if they pivot: [../answers/system-design-autocomplete.md](../answers/system-design-autocomplete.md), [../answers/system-design-news-feed.md](../answers/system-design-news-feed.md), [../answers/system-design-chat.md](../answers/system-design-chat.md).

## Common mistakes

- Jumping to a component tree with no requirements.
- One “best” stack (Redux + GraphQL) with no alternative.
- Ignoring keyboard, empty, and error until asked.
- Buzzwords (virtual DOM, hydration) you cannot apply to **this** prompt.
- Designing the CDN instead of the UI.

## Prep checklist

- [ ] Recruiter: component vs app vs backend SD; whiteboard vs Figma vs pad
- [ ] One RADIO mock (autocomplete or feed) out loud, 45 min
- [ ] One a11y pass: Tab through your design; name the live region
- [ ] Still grind DSA: [coding-patterns.md](coding-patterns.md)

## Sources

- [Front End System Design Playbook — GreatFrontEnd](https://www.greatfrontend.com/front-end-system-design-playbook) — accessed 2026-11-20
- [The RADIO Framework — GreatFrontEnd](https://www.greatfrontend.com/front-end-system-design-playbook/framework) — accessed 2026-11-20
- [Cheatsheet for Front End System Design Interviews — GreatFrontEnd](https://www.greatfrontend.com/front-end-system-design-playbook/cheatsheet) — accessed 2026-11-20
- [awesome-front-end-system-design — GitHub](https://github.com/greatfrontend/awesome-front-end-system-design/) — accessed 2026-11-20
- [System design interviews aren't just for backend engineers — GreatFrontEnd](https://www.linkedin.com/posts/greatfrontend_system-design-blogs-for-frontend-devs-activity-7450060353809330177-E5sf) — accessed 2026-11-20
