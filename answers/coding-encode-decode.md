# Encode and Decode Strings — answer outline

**Prompt:** Design `encode(strs) → string` and `decode(s) → strs` so a list of strings survives a round-trip over the wire. Strings may be empty and may contain **any** ASCII, including digits and `#`. Stateless codec; do not `eval`. (LeetCode 271)

This is **length-prefix framing**, not the nested `k[s]` grammar in [coding-decode-string.md](coding-decode-string.md). Cousin of [coding-serialize-tree.md](coding-serialize-tree.md) (explicit lengths / sentinels). NeetCode 150 arrays & hashing box. Wikipedia [serialization](https://en.wikipedia.org/wiki/Serialization) / [type–length–value](https://en.wikipedia.org/wiki/Type%E2%80%93length%E2%80%93value).

## Probes

- Why `join(",")` or a lone `#` delimiter is illegal once those chars appear in a field.
- Multi-digit lengths: `10#abcdefghij` — scan **all** digits until `#`, do not assume one digit.
- Empty list vs list of empty strings (`[]` vs `[""]`) must stay distinct.
- Target: O(m) time per call, O(m + n) space (`m` = total chars, `n` = count).

## Strong answer skeleton — `len#payload`

1. **Clarify:** charset (full ASCII); empty strings allowed; need a **bijection**, not compression.
2. **Trap:** delimiter-only encodings fail; escaping works but is easy to get wrong (escape the escape).
3. **Encode:** for each `s`, append `str(len(s)) + "#" + s`. `#` only separates **length from payload**, so payload `#` is fine.
4. **Decode:** `i = 0`; while `i < len(s)`: walk `j` from `i` until `#`; `L = int(s[i:j])`; take `s[j+1 : j+1+L]`; set `i = j+1+L`.
5. **Complexity:** one pass each way; no extra search over payload.

Non-ASCII delimiter is a valid interview aside; interviewers usually want the length-prefix so the codec stays in ASCII.

## Sketch

```
encode(strs):
  return "".join(f"{len(s)}#{s}" for s in strs)

decode(s):
  out, i = [], 0
  while i < len(s):
    j = i
    while s[j] != "#":
      j += 1
    L = int(s[i:j])
    out.append(s[j+1 : j+1+L])
    i = j + 1 + L
  return out
```

`["", "#", "10"]` → `0#1##2#10` → same three strings. `[]` → `""` → `[]`.

## Mock narration (30 sec)

> “A raw delimiter is ambiguous once it appears in the data. I’ll prefix each field with its length and a single hash: the hash only ends the number. Decode reads digits until hash, then slices exactly that many characters. Empties and hashes inside strings just work.”

## Common mistakes

- One-digit lengths (`4#neet` is fine; `10#...` breaks).
- Using `#` as a field separator **without** a length (payload `#` shifts every later slice).
- Off-by-one: `i = j + L` forgets the `#`.
- Treating `decode("")` as `[""]` instead of `[]`.
- Building encode with repeated `+=` in a copying language — mention a buffer / join.

## Follow-ups

- **Escape-based:** `\` + delimiter; must escape `\` too — say why length-prefix is simpler.
- **Serialize / deserialize tree** — [coding-serialize-tree.md](coding-serialize-tree.md).
- **Decode String (394)** — different problem; nested repeats, not framing.

## Sources

- [Encode and Decode Strings — NeetCode](https://neetcode.io/solutions/encode-and-decode-strings) — accessed 2026-10-11
- [Encode and Decode Strings — LeetCode 271](https://leetcode.com/problems/encode-and-decode-strings/) — accessed 2026-10-11
- [Serialization — Wikipedia](https://en.wikipedia.org/wiki/Serialization) — accessed 2026-10-11
- [Type–length–value — Wikipedia](https://en.wikipedia.org/wiki/Type%E2%80%93length%E2%80%93value) — accessed 2026-10-11
