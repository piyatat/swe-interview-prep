# Product of array except self — answer outline

**Prompt:** Given `nums`, return `answer` where `answer[i]` is the product of all elements **except** `nums[i]`. **O(n) time, no division.** Follow-up: **O(1) extra space** (output array does not count). (LeetCode 238)

Listed under mediums in [../general/coding-patterns.md](../general/coding-patterns.md). Prefix/suffix, not a hash-map trick.

## Probes

- Why division is banned: zeros (`/ 0`) and the constraint itself.
- Two arrays (left/right products) vs **output + one running suffix**.
- Empty / length 1 (usually `n ≥ 2` in the LeetCode statement — **ask**).
- Overflow: statement often guarantees 32-bit; mention it.

## Strong answer skeleton

1. **Clarify:** zeros allowed; multiple zeros → all zeros in `answer`; one zero → only that index is the product of the rest.
2. **Identity:** `answer[i] = prefix(i) * suffix(i)` (product strictly left × strictly right).
3. **O(n) extra:** fill `left[i]`, `right[i]`, multiply. Fine first version.
4. **O(1) extra:** first pass writes prefixes into `answer`; second pass multiplies a running `suffix` from the right.
5. **Order on the right pass:** `answer[i] *= suffix` **then** `suffix *= nums[i]`.

Division-of-total-product is both disallowed and **wrong** with a zero.

## Sketch

```
answer = [1] * n
pref = 1
for i in 0..n-1:
  answer[i] = pref
  pref *= nums[i]
suf = 1
for i in n-1..0:
  answer[i] *= suf
  suf *= nums[i]
return answer
```

Walk `[1,2,3,4]` → prefixes `[1,1,2,6]` → after suffix pass `[24,12,8,6]`.  
Walk `[−1,1,0,−3,3]` → zeros fall out without a special case.

## Mock narration (30 sec)

> “Each index needs everything to the left times everything to the right. I’ll store left products in the output, then walk right to left with a running suffix so I don’t divide and I don’t allocate a second array.”

## Common mistakes

- Dividing the total product (fails zeros; violates the prompt).
- Updating `suffix` **before** multiplying into `answer[i]` (off-by-one, includes `nums[i]`).
- Claiming O(1) space while allocating `left` and `right`.
- Mutating `nums` in place when the interviewer wanted `nums` preserved.

## Follow-ups

- **Division allowed, no zeros:** total product / `nums[i]` — still mention the zero branch.
- **Streaming / one pass:** harder; two passes is the expected bar.
- Related: prefix sums (range query) vs prefix **products**.

## Sources

- [Prefix sum — Wikipedia](https://en.wikipedia.org/wiki/Prefix_sum) — accessed 2026-08-26
- [Product of Array Except Self walkthrough — intervu.dev](https://intervu.dev/blog/walkthroughs/product-of-array-except-self-interview-walkthrough/) — accessed 2026-08-26
- [Product of Array Except Self — NeetCode](https://neetcode.io/solutions/product-of-array-except-self) — accessed 2026-08-26
- [Product of Array Except Self — InterviewLoop](https://interviewloop.app/learn/code/arrays-and-hashing/product-of-array-except-self) — accessed 2026-08-26
- Classic LeetCode #238 — prefix/suffix products
