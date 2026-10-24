# Next Permutation — answer outline

**Prompt:** Rearrange `nums` into the **next lexicographically greater** permutation. If none exists, rearrange into the **lowest** (sorted ascending). **In-place**, constant extra memory. (LeetCode 31)

This is **one step** of the lexicographic generator, not “list all perms” ([coding-permutations.md](coding-permutations.md)). Interviewers want the **pivot + successor + reverse suffix** walk, not `itertools` and not generating `n!` candidates. Wikipedia [permutation](https://en.wikipedia.org/wiki/Permutation#Generation_in_lexicographic_order) is the language.

## Probes

- “Next” means the **smallest** sequence that is still **strictly larger** in dictionary order.
- Duplicates are allowed — comparisons are `>` / `>=`, not “first different index from the left.”
- Fully descending (e.g. `[3,2,1]`) has no successor → reverse to `[1,2,3]`.
- Must mutate `nums`; returning a new list fails the “in-place” constraint.

## Strong answer skeleton

1. **Clarify:** in-place; next **greater**; wrap to sorted-min; duplicates OK.
2. Scan **right → left** for the rightmost **ascent**: largest `i` with `nums[i] < nums[i+1]`. That `i` is the **pivot**.
3. If no pivot (`i < 0`): reverse the whole array and stop.
4. From the right, find the rightmost `j > i` with `nums[j] > nums[i]` (smallest successor that still sits in the descending suffix — because the suffix is non-increasing, the first hit from the right is that successor).
5. Swap `i` and `j`.
6. Reverse `nums[i+1:]` so the suffix is the **smallest** tail. Time `O(n)`, extra space `O(1)`.

Why reverse: after the swap the tail is still non-increasing. The next permutation wants the smallest tail, which is that sequence flipped.

## Sketch

```
n = len(nums)
i = n - 2
while i >= 0 and nums[i] >= nums[i + 1]:
  i -= 1
if i >= 0:
  j = n - 1
  while nums[j] <= nums[i]:
    j -= 1
  nums[i], nums[j] = nums[j], nums[i]
l, r = i + 1, n - 1
while l < r:
  nums[l], nums[r] = nums[r], nums[l]
  l += 1; r -= 1
```

`[1,2,3]` → `[1,3,2]`. `[1,3,2]` → `[2,1,3]`. `[3,2,1]` → `[1,2,3]`. `[1,1,5]` → `[1,5,1]`.

## Mock narration (30 sec)

> “I want the next dictionary word. I find the rightmost place I can increase. I swap that pivot with the smallest larger value on its right — which is the first greater from the end, because that suffix is decreasing. Then I reverse the suffix so the tail is as small as possible. If the array is already decreasing I just reverse it.”

## Common mistakes

- Swapping the pivot with the **leftmost** larger element (not the rightmost successor).
- Using `<=` when hunting the pivot so duplicates skip a valid ascent.
- Forgetting to **reverse** the suffix — you emit a much later permutation.
- Building every permutation and picking the next (TLES; also not in-place).

## Follow-ups

- **Permutations (46) / II (47):** enumerate the whole tree — [coding-permutations.md](coding-permutations.md).
- **Previous permutation:** symmetric (leftmost descent, reverse to descending tail).
- **Next permutation of a string / digits with leading-zero rules:** same walk; ask about the wrap.

## Sources

- [Next Permutation — NeetCode](https://neetcode.io/solutions/next-permutation) — accessed 2026-10-24
- [31. Next Permutation — LeetCode Wiki](https://leetcode.doocs.org/en/lc/31/) — accessed 2026-10-24
- [Next Permutation — LeetCode 31](https://leetcode.com/problems/next-permutation/) — accessed 2026-10-24
- [Permutation — Wikipedia](https://en.wikipedia.org/wiki/Permutation#Generation_in_lexicographic_order) — accessed 2026-10-24
- [NeetCode 150 list (2026) — CPG](https://codingprepguide.com/neetcode-150/) — accessed 2026-10-24
