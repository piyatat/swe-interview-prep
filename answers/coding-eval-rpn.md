# Evaluate Reverse Polish Notation — answer outline

**Prompt:** `tokens` is a valid **postfix** (RPN) expression: integers and `+ - * /`. Return the integer result. Division **truncates toward zero**. No divide-by-zero; intermediates fit 32-bit. (LeetCode 150)

This is a **stack of operands**, not a monotonic stack. Sibling of [coding-min-stack.md](coding-min-stack.md) (stack as the data structure) and [coding-valid-parentheses.md](coding-valid-parentheses.md) (stack of symbols). Wikipedia [Reverse Polish notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation). NeetCode 150 stack box.

## Probes

- Operator comes **after** its two operands — no precedence, no parentheses.
- First pop is the **right** operand; second pop is the **left** (`a - b` is not `b - a`).
- `"/"` is toward-zero, **not** Python `//` (floor) when negatives appear.
- Tokens like `"-11"` are **numbers** (length > 1 or a digit), not the minus operator.
- Input is valid — do not spend the hour on error recovery unless they ask.

## Strong answer skeleton

1. **Clarify:** empty is out of spec (`n ≥ 1`); single number → that number; only the four operators.
2. **Why a stack:** each operator consumes the two most recent values; postfix already fixed the order.
3. **Scan left to right:** number → `int(token)` and push. Operator → pop `b`, pop `a`, push `a ⊕ b`.
4. **Division:** `int(a / b)` / language toward-zero (`trunc`), not floor.
5. **End:** one value on the stack — that is the answer.
6. **Complexity:** O(n) time, O(n) space (worst case all numbers, then operators).

## Sketch

```
st = []
for t in tokens:
  if t not in {+,-,*,/}:          # or: len(t) > 1 or t.isdigit()
    st.append(int(t))
  else:
    b, a = st.pop(), st.pop()     # right, then left
    if t == "+": st.append(a + b)
    elif t == "-": st.append(a - b)
    elif t == "*": st.append(a * b)
    else: st.append(int(a / b))   # toward zero
return st[0]
```

`["2","1","+","3","*"]` → `9`. `["4","13","5","/","+"]` → `6` (`13/5` → `2`).

## Mock narration (30 sec)

> “Postfix means I never need precedence. I push numbers. On an operator I pop right, then left, apply, and push. The only trap is minus and divide — order and toward-zero, not floor. One pass, linear stack.”

## Common mistakes

- Popping left before right (`b - a`).
- Using `//` and failing `1 / -2` (floor `-1` vs toward-zero `0`).
- Treating `"-11"` as an operator (`t[0] == '-'` without a length/digit check).
- Rebuilding the token list each time an operator appears — O(n²) scan.
- Claiming you need shunting-yard — the input is **already** RPN.

## Follow-ups

- **Infix → RPN (shunting-yard)** — then this evaluator.
- **Basic Calculator II** — infix with precedence; two stacks or one-pass sign.
- **Expression add operators** — backtracking, not a stack eval.
- **Invalid tokens / overflow** — they usually exclude; say you would validate if asked.

## Sources

- [Evaluate Reverse Polish Notation — NeetCode](https://neetcode.io/solutions/evaluate-reverse-polish-notation) — accessed 2026-10-02
- [150. Evaluate Reverse Polish Notation — LeetCode Wiki](https://leetcode.doocs.org/en/lc/150/) — accessed 2026-10-02
- [Evaluate Reverse Polish Notation — LeetCode 150](https://leetcode.com/problems/evaluate-reverse-polish-notation/) — accessed 2026-10-02
- [Reverse Polish notation — Wikipedia](https://en.wikipedia.org/wiki/Reverse_Polish_notation) — accessed 2026-10-02
