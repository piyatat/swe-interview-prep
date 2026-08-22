# Frontend engineer

Focus: **JavaScript/TypeScript depth, React (or framework), CSS, browser performance, accessibility, and UI-scale system design**.

## What interviewers probe

| Area | Signals |
| --- | --- |
| JS runtime | Event loop, microtasks, closures, async |
| React | Reconciliation, hooks, memoization, state shape |
| CSS | Layout (flex/grid), specificity, responsive |
| Performance | Core Web Vitals (LCP, INP, CLS), bundle size |
| a11y | Keyboard nav, ARIA, focus management |
| UI design | Component boundaries, data flow, edge states |

## Sample questions

### JavaScript

1. Explain the event loop — microtasks vs macrotasks.
2. What is a closure? Common interview bug patterns.
3. Implement **debounce** or **throttle**.
4. Implement a **promise pool** (concurrency limiter).
5. Hoisting — `var` vs `let`/`const`.

### React

1. What causes a re-render? How to reduce unnecessary renders?
2. `useMemo` vs `useCallback` vs `React.memo`.
3. Stale closure in `useEffect` — how to fix?
4. Controlled vs uncontrolled components.
5. Server Components vs Client Components (Next.js) — when which?
6. React 19: Actions, `useActionState`, optimistic updates (high level).

### CSS & layout

1. Explain specificity; solve a cascade puzzle.
2. Flexbox vs Grid — choose for a dashboard layout.
3. Mobile-first vs desktop-first; `clamp()` and container queries.
4. How do you debug a layout overflow?

### Performance

1. What are Core Web Vitals? How would you improve LCP on a SPA?
2. Walk through diagnosing a slow page load (network waterfall).
3. Code splitting and lazy loading tradeoffs.

### Frontend system design

Not the same as backend design — focus on **components, state, network, a11y**:

1. Design an **autocomplete** (keyboard, debounce, API, empty states).
2. Design an **infinite scroll feed** (virtualization, caching).
3. Design a **real-time chat UI** (WebSocket, optimistic UI, reconnect).
4. Design a **date picker** (a11y, time zones, validation).

Evaluation: component breakdown first, data flow before pixels, loading/error/empty states unprompted.

### Coding (frontend-flavored)

1. Render a nested comment tree efficiently.
2. Flatten deep JSON; implement immutable update.
3. Parse URL query params with edge cases.

## Also study

- [../general/coding-patterns.md](../general/coding-patterns.md) — many companies still run DSA
- [../general/system-design.md](../general/system-design.md) — for full-stack design prompts (chat at scale)

## Sources

- [Frontend Developer Interview Questions 2026 — OnlyFrontendJobs](https://www.onlyfrontendjobs.com/blog/frontend-developer-interview-questions-2026) — accessed 2026-08-22
- [Frontend Engineer Interview Questions — GhOst](https://www.ghostai.one/blog/frontend-engineer-interview-questions) — accessed 2026-08-22
- [Frontend Interview Questions — Craqly](https://craqly.com/blog/frontend-interview-questions-react-js-css/) — accessed 2026-08-22
- [React Interview Questions — GreatFrontEnd](https://www.greatfrontend.com/blog/100-react-interview-questions-straight-from-ex-interviewers) — accessed 2026-08-22
