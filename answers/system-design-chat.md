# Chat / messaging — system design outline

**Prompt:** Design WhatsApp/Slack-style 1:1 or group chat with history and online presence.

## Requirements

| Functional | Non-functional |
| --- | --- |
| Send/receive messages, history | Low delivery latency |
| 1:1 and group rooms | Ordered per conversation |
| Online/offline indicators | Millions concurrent connections |

## High-level

```
Mobile/Web → WebSocket gateway → Chat service → Message store
                      ↓                    ↓
                 Presence service      Push notifications
```

## Deep dives

### Real-time transport

- **WebSockets** on gateway tier; sticky sessions or user→node routing table in Redis
- Fallback: long polling for restrictive networks

### Message flow

1. Client sends msg → gateway → chat service validates membership
2. Persist to DB (partition by `conversation_id`)
3. Fan-out to online recipients via gateway; offline → push queue

### Storage

- **Write:** append-only messages table or Cassandra/Dynamo partition key = conversation
- **Read:** paginate history cursor by `(timestamp, id)`

### Ordering

- Per-conversation sequence number from DB or logical clock
- “Last write wins” for edits; show delivery receipts separately

### Group chat

- Fan-out on write (small groups) vs fan-out on read (large channels) — **tradeoff**

### Presence

- Heartbeats → presence service → subscribe friends’ status
- TTL for stale online state

## Scale talking points

- Shard gateways horizontally
- Hot celebrity channel — separate fan-out service (Kafka)

## Startup simplification

- Single monolith + Postgres + one WebSocket server + Redis pub/sub until 10K concurrent

## Common mistakes

- No persistence model before real-time
- Ignoring offline delivery
- Global ordering across all chats (unnecessary)

## Sources

- [System Design 2025 Guide — youngju.dev](https://www.youngju.dev/blog/culture/2026-03-22-system-design-interview-2025-complete-guide.en) — accessed 2026-08-22
