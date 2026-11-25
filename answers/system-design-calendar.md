# Shared calendar / Google Calendar — system design outline

**Prompt:** Design a **shared calendar**: create events, invite attendees, repeating series, free/busy, reminders. Classic mid/senior prompt (Google / LinkedIn). Google Calendar API last updated **2026-09-11**.

**Not** [system-design-job-scheduler.md](system-design-job-scheduler.md) (cron / leases). **Not** [system-design-notification.md](system-design-notification.md) (you *are* the reminder sender, but the hard part is **time + series**). **Not** [system-design-ticketmaster.md](system-design-ticketmaster.md) (named-seat inventory). Here the new work is **RRULE + exceptions + fan-out + busy index**.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| CRUD events; wall-clock start/end + **named TZ** | Read-heavy; week view is a range read |
| Recurring series; edit **this / this-and-future / all** | Interactive free/busy (tens of calendars) |
| Invite + RSVP; each guest sees it on **their** calendar | Organizer edit reaches attendees (idempotent) |
| Free/busy over a window (no private titles) | Reminder on the minute, **once** |
| Reminder before an occurrence | DST-safe expansion |

Out of scope unless asked: rooms (calendar that cannot double-book), search, two-way sync with another vendor, offline merge.

## Estimation sketch (example)

~100M users, mostly **reads**. A weekly series with **no end date** must **not** be stored as one row per occurrence (Star Interview: writing those out explodes). Google Workspace has published large-meeting scale; Google Calendar API **Freebusy** is a first-class RPC — design for **≤ ~50 calendars** per query unless they raise it. Fan-out of a 100k-guest edit is a **queue**, not a synchronous PATCH.

## High-level — rule, not instances

```
Client → event service (partition by calendar_id)
           events: single | series head (RRULE + TZ)
           exceptions: moved / canceled occurrence (original start key)
           attendees: RSVP on each guest calendar
        → expander (window only) + TZ convert
        → busy index (UTC intervals, rolling weeks)
        → fan-out queue → guest copies (idempotent version)
        → reminder buckets by due minute → notify
```

Wikipedia [iCalendar](https://en.wikipedia.org/wiki/ICalendar) / [RFC 5545](https://www.rfc-editor.org/rfc/rfc5545): `VEVENT`, `RRULE`, `EXDATE`, `RDATE`. Google Calendar API: **Event**, **Calendar**, **ACL**, **CalendarList**, **Setting**. One **organizer-owned** event is source of truth.

## Deep dives

### Series + time zones

Store **one** series row: local start, named zone (`America/Los_Angeles`, not a fixed offset), `RRULE`. Expand only for `from..to`. `this` → exception keyed by original start. `following` → **split** the series (end old, start new) instead of N exceptions. Expand in the event zone, then convert for the viewer. Keep [IANA tz](https://www.iana.org/time-zones) data you can update when a government changes DST.

### Invites

Save on the organizer calendar; enqueue fan-out. Guests get an **attendee row** (yes / no / maybe / none). Organizer edits bump a **version**; workers are idempotent. External email is a branch, not a second source of truth. RSVP flows **back** without letting a guest move the meeting.

### Free/busy

Do **not** expand every series on the request. Maintain a rolling **UTC busy-interval** list per calendar; merge on query; return gaps, **no titles**. Working hours are a mask in the owner’s zone.

### Reminders

Bucket by **due minute** (shard hot 8:50 Mondays). Enqueue a **horizon**, not “forever.” At-least-once send + idempotency key `(event, occurrence, channel, user)`. Recheck the event before fire so a moved / canceled occurrence is silent. See [system-design-notification.md](system-design-notification.md) for the last mile.

## Common mistakes

- A row per occurrence of an endless weekly meeting.
- Storing a **fixed UTC offset** and breaking the DST week.
- Expanding series inside every free/busy call.
- Synchronous fan-out to 10k attendees in the PATCH.
- Promising exactly-once reminders without a dedupe key.
- Designing **rooms** first (locking) before events exist.

## Sources

- [Google Calendar API overview](https://developers.google.com/workspace/calendar/api/guides/overview) — accessed 2026-11-25
- [Recurring events — Google Calendar API](https://developers.google.com/calendar/api/guides/recurringevents) — accessed 2026-11-25
- [RFC 5545 — iCalendar](https://www.rfc-editor.org/rfc/rfc5545) — accessed 2026-11-25
- [iCalendar — Wikipedia](https://en.wikipedia.org/wiki/ICalendar) — accessed 2026-11-25
- [Time Zone Database — IANA](https://www.iana.org/time-zones) — accessed 2026-11-25
- [How to design Google Calendar — Star Interview](https://www.starinterview.io/learn/system-design/google-calendar) — accessed 2026-11-25
- [Design Google Calendar — Chirag Hasija](https://chiraghasija.cc/posts/design-google-calendar-system-design/) — accessed 2026-11-25
