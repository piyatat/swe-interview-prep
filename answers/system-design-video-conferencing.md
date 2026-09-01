# Video conferencing (Zoom / Meet) — system design outline

**Prompt:** Design a **multi-party video call**: join by meeting id, live A/V, screen share; optional chat, recording, large webinar. Classic mid/senior prompt. **Not** [system-design-video-streaming.md](system-design-video-streaming.md) (VOD / ABR / CDN, seconds of delay). Here the SLA is **interactive**: lost packets beat late packets.

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| 1:1 and group (say 2–25 gallery; webinar is a different mode) | Mouth-to-ear target ~200–400 ms; prefer audio when the network dies |
| Mute, camera, screen share, roster | NAT / corporate firewalls; many clients on Wi-Fi |
| Optional: chat, raise-hand, cloud record | 1M concurrent meetings (example) — shard by meeting, not one mega-box |

Non-goals unless asked: PSTN, full live-stream to millions (that becomes SFU + CDN / HLS).

## Estimation sketch (example)

- 4-person call, 720p: each uplink ~1–2 Mbps; **mesh** would upload **N−1** copies → dies by ~4 people.
- SFU: **one** uplink per sender; downlink is a **subset** of others (active speaker + tiles).
- Signaling is tiny (SDP / roster). **Media** is the cost: UDP + encode CPU on the client.

## High-level components

```
Client (capture → encode → RTP)
    ↔ Signaling (WebSocket): join, SDP offer/answer, ICE candidates, roster
    ↔ ICE: host → STUN (server-reflexive) → TURN relay if both NATs lose
    ↔ Media plane: SFU / SFM (forward, do not mix)  |  MCU (decode + mix) only if you must
    → Optional: recorder bot as a subscriber; object storage + VOD later
```

WebRTC (MDN / webrtc.org): `getUserMedia` / `getDisplayMedia` + `RTCPeerConnection`. **Signaling is not in the spec** — you provide it. Media is typically **RTP/SRTP over UDP**; TCP/TLS is the fallback when UDP is blocked.

## Deep dives

### Mesh vs MCU vs SFU (RFC 7667)

| Topology | What the server does | Interview default |
| --- | --- | --- |
| **Mesh** | Nothing (N² paths) | 1:1 or 3-person toy |
| **MCU** (mixer) | Decode, compose, re-encode **one** stream per receiver | Easy clients, **brutal** CPU + extra latency |
| **SFU / SFM** | Select and **forward** packets; client decodes N streams | Group calls — Zoom-style writeups call this a multimedia router |

RFC 7667 names **Selective Forwarding Middleboxes** for simulcast / SVC. Say **why** you skip the MCU: encode is the expensive step; push it to the endpoints.

### Simulcast / SVC

Sender uploads **2–3 layers** (or SVC layers). SFU forwards **low** tiles and **high** for the active speaker. Zoom’s public reliability note: adapt frame rate / resolution from bandwidth, loss, jitter, **and local CPU**; keep audio when video must drop.

### NAT and TURN

ICE gathers host / srflx / relay. STUN is a cheap “what is my public mapping?” TURN **relays all media** — expensive; only some calls need it (symmetric NAT, locked-down offices). Do not pretend every packet is P2P.

### Recording and webinar

Recorder is a **privileged subscriber** (or a silent client) writing to object storage — do not make the SFU also remux on the hot path unless you have to. Webinar / “300M daily participants” (2020-era public peak) is **fan-out + extra capacity**, still not VOD CDN as the live path.

## Failure / ops

- Packet loss → FEC / PLC / request keyframe; **do not** TCP-retransmit a dead frame
- SFU death → remigrate the meeting to a paired router; show a 1–2 s glitch, not a silent tomb
- Metrics: join time, RTT, loss, jitter, freeze rate, TURN share, encode time, active-speaker switches

## Startup vs FAANG angle

| FAANG / Zoom-like | Startup |
| --- | --- |
| Regional SFU pools, simulcast, TURN fleet, recorders | Daily.co / LiveKit / Twilio; one region; mesh for ≤3 |
| Custom media stack (Zoom historically not “browser WebRTC only”) | Stock WebRTC in the browser |

## Common mistakes

- Drawing the [video-streaming](system-design-video-streaming.md) HLS pipeline for a **meeting**.
- “P2P scales to 50 people.”
- MCU as the first architecture without saying CPU.
- Forgetting signaling ≠ media, or forgetting TURN.
- “Exactly-once frames” — real-time is **best-effort** + conceal.

## Sources

- [WebRTC API — MDN](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API) — accessed 2026-09-01
- [Getting started with WebRTC — webrtc.org](https://webrtc.org/getting-started/overview) — accessed 2026-09-01
- [RFC 7667 — RTP Topologies](https://datatracker.ietf.org/doc/html/rfc7667) — accessed 2026-09-01
- [Zoom: Architected for Reliability](https://library.zoom.com/admin-corner/architecture-and-design/zoom-architected-for-reliability) — accessed 2026-09-01
- [Design Zoom (SFU) — System Design Academy](https://www.systemdesign.academy/interview/design-zoom) — accessed 2026-09-01
- [System Design: Design Zoom — techinterview.org](https://www.techinterview.org/post/3233474320/system-design-design-zoom-video-conferencing-webrtc-sfu-mcu-screen-sharing-recording-breakout-rooms-scaling/) — accessed 2026-09-01
