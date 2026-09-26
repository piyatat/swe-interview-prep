# Decode String — answer outline

**Prompt:** Encoded string `s` uses `k[encoded_string]` — the inner string repeats exactly `k` times (`k ≥ 1`). Nesting is allowed. Return the decoded string. Input is well-formed; output length stays bounded. (LeetCode 394)

This is a **stack of frames** (or an index-walking recursion), not “regex replace.” Sibling of [coding-valid-parentheses.md](coding-valid-parentheses.md) (nesting) and [coding-min-stack.md](coding-min-stack.md) (parallel stacks). NeetCode 150 stack box; Wikipedia [stack](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)).

## Probes

- Multi-digit `k` (`12[a]`) — accumulate `k = 10*k + d`, do not treat each digit as its own repeat.
- Nesting: `2[a3[b]]` → `abbbabbb`. Inner decode finishes **before** the outer repeat.
- Letters outside brackets stay as-is (`a2[b]c` → `abbc`).
- Spec: no `3a` / `2[4]` / `a[a]`; you may assume valid brackets and positive `k`.

## Strong answer skeleton — two stacks

1. **Clarify:** charset; `k` can be `> 9`; return the full string.
2. Walk left to right. Keep `cur` (string under construction) and `k`.
3. Digit → fold into `k`. Letter → append to `cur`.
4. `[` → push `(cur, k)` onto a stack; reset `cur = ""`, `k = 0`.
5. `]` → pop `(prev, repeat)`; `cur = prev + cur * repeat`.
6. End of `s` → `cur` is the answer. O(n + out) time, O(nesting + out) space.

Recursive twin: global index `i`; on `[` recurse for the inner piece, on `]` return. Same complexity; say both.

## Sketch (stacks)

```
stack = []          # (prefix, repeat)
cur, k = "", 0
for ch in s:
  if ch.isdigit():
    k = 10 * k + int(ch)
  elif ch == '[':
    stack.append((cur, k))
    cur, k = "", 0
  elif ch == ']':
    prev, rep = stack.pop()
    cur = prev + cur * rep
  else:
    cur += ch
return cur
```

`"2[a3[b]]c"` → `abbbabbbc`. `"3[a]2[bc]"` → `aaabcbc`.

## Mock narration (30 sec)

> “Each open bracket starts a new frame. I stash the string I already built and the count I just read, then decode the inside. On close I pop and concatenate the inner piece repeated k times onto the outer prefix. Multi-digit counts fold as I scan. Linear in the output size.”

## Common mistakes

- Resetting `k` on every digit instead of `10*k + d` (breaks `12[ab]`).
- Repeating before finishing the inner decode (wrong nest order).
- Using a single stack of characters and forgetting to reconstruct `k` from popped digits.
- Recursion without a shared index — inner call restarts at 0.
- Building with quadratic `+=` in a language where that copies; mention a buffer / join if they care.

## Follow-ups

- **Encode and Decode Strings (271)** — length-prefix, not this grammar.
- **Number of Atoms (726)** — same nest, map merge instead of string repeat.
- **Basic Calculator** — stack of signs / totals; digits still fold.
- **Streaming / CrowdStrike-style:** decode from an iterator if the encoded form does not fit in RAM (same frames).

## Sources

- [Decode String — NeetCode](https://neetcode.io/solutions/decode-string) — accessed 2026-09-26
- [Decode String — LeetCode 394](https://leetcode.com/problems/decode-string/) — accessed 2026-09-26
- [Stack (abstract data type) — Wikipedia](https://en.wikipedia.org/wiki/Stack_(abstract_data_type)) — accessed 2026-09-26
- [CrowdStrike's Interview Process (2026) — TechPrep](https://www.techprep.app/blog/crowdstrike-interview-process) — accessed 2026-09-26
- Classic LeetCode #394 — stack / nested-repeat family
