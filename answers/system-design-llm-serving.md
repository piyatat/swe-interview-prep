# LLM serving / chat inference — system design outline

**Prompt:** Design a **ChatGPT-class inference service**: users send a prompt (plus history); tokens stream back; survive GPU loss; do not pretend “just call the model” is an architecture. Complements [system-design-chat.md](system-design-chat.md) (the messaging product) and [system-design-recommendation.md](system-design-recommendation.md) (retrieve + rank). Named as a 2025–2026 add-on in [../general/system-design.md](../general/system-design.md).

## Requirements (clarify first)

| Functional | Non-functional |
| --- | --- |
| Create / continue a conversation; stream tokens | **TTFT** (time to first token) and **TPOT** / tokens-per-sec |
| Context: system prompt + history (+ optional RAG) | GPU $ / goodput — throughput **only** for requests that meet SLOs |
| Cancel, moderate in + out, token quotas | Context-window limit; p99 queue wait |

Ask: chat vs batch embeddings? one model or a **router** (small / large / tool-using)? RAG in v1?

**Prefill vs decode.** Prefill reads the prompt in parallel (compute-bound). Decode emits **one token at a time** and re-reads weights + **KV cache** (memory-bandwidth-bound). That split drives every later choice.

## Estimation sketch (example)

- 10k concurrent generations × 4k context × KV bytes/token → **GPU HBM**, not disk, is the capacity limit
- A “slow but finished” stream that blew TTFT is a **miss** — quote goodput, not raw tokens/s
- Queue + shed (smaller model) beats hard-fail when the fleet is full

## High-level components

```
Client → API gateway (auth, token quota, SSE)
      → router (model + region + cache affinity)
      → inference engine (continuous batch, paged KV)
GPU workers; conversation store; optional embed + vector index (RAG)
Moderation on input and on the stream; meters / traces
```

The chat CRUD is cheap. The interview is **GPU memory, batching, and the latency budget**.

## Deep dives

### Continuous batching + paged KV

Static batching holds the GPU hostage to the **longest** sequence. **Continuous / iteration-level** batching (Orca, OSDI 2022): after each forward pass, evict finished sequences and **admit** waiting ones. That only works if KV memory can be allocated in **non-contiguous blocks**.

vLLM [PagedAttention](https://vllm.ai/blog/2023-06-20-vllm) (SOSP 2023): treat KV like virtual memory — fixed-size blocks, block table, waste only in the last page (they cite under 4%). Enables sharing a prompt’s KV across beam / n-way samples (copy-on-write). Interview default: **continuous batch + paged KV**, not “one request per GPU.”

### Prefix cache, routing, RAG (phase 2)

Repeated system prompts and prior turns should **hit a prefix cache**, not re-prefill. Route to the replica that **already holds** that prefix — not round-robin. RAG: ingest → chunk → embed → hybrid retrieve → rerank → stuff citations; treat retrieval latency as part of TTFT. Do not fine-tune the catalog as v1.

## Failure / ops

- GPU dies → drain in-flight (client retries the last turn); warm pool autoscales on **KV occupancy**, not request count.
- Cancel / disconnect must **free KV** or you leak the card.
- Degrade: queue with a visible wait, drop to a smaller model, or refuse new long-context jobs.
- Observe TTFT, TPOT, batch size, KV fragmentation, token $ per request.

## Startup vs FAANG angle

| FAANG / lab | Startup |
| --- | --- |
| vLLM-class engine, prefix cache, P/D disagg, eval gates on quant | Managed API + thin gateway; cache system prompt; cap concurrency |
| Goodput SLOs, multi-LoRA, speculation | One model, SSE, hard token cap |

## Common mistakes

- Designing only the chat DB / WebSocket and never the GPU.
- Maximizing tokens/s while blowing TTFT (goodput goes **down**).
- Contiguous KV allocation + continuous batch (allocator thrashes).
- “Exactly-once tokens” or “fine-tune an LLM over the corpus” as v1.

## Sources

- [vLLM: Easy, Fast, and Cheap LLM Serving with PagedAttention](https://vllm.ai/blog/2023-06-20-vllm) — accessed 2026-09-09
- [Efficient Memory Management for Large Language Model Serving with PagedAttention — arXiv:2309.06180](https://arxiv.org/abs/2309.06180) — accessed 2026-09-09
- [Design ChatGPT: LLM Serving — System Design Academy](https://www.systemdesign.academy/interview/design-chatgpt) — accessed 2026-09-09
- [Design ChatGPT (LLM Serving) — InterviewsVector](https://www.interviewsvector.com/system-design/design-chatgpt) — accessed 2026-09-09
- [AI System Design Interview Questions (2026) — gitGood.dev](https://gitgood.dev/blog/ai-system-design-interview-questions-2026) — accessed 2026-09-09
