# Valid Parentheses — answer outline

**Prompt:** String of `()[]{}` — determine if properly nested and closed in order.

## Probes

- Stack only solution?
- What about string with only one type?
- Generate all valid (different problem)?

## Strong answer skeleton

1. **Clarify:** empty string valid? only brackets?
2. **Approach:** stack of opening chars; on close, check top matches; end stack empty.
3. **Map:** `{ ')': '(', ']': '[', '}': '{' }` for pairs.
4. **Complexity:** O(n) time, O(n) space worst case.

## Early exit

- Odd length → invalid immediately

## Common mistakes

- Pushing closers onto stack
- Not checking stack empty before pop
- Wrong match on pop

## Follow-ups

- Longest valid substring
- Remove minimum to make valid

## Sources

- LeetCode #20 — stack warm-up
