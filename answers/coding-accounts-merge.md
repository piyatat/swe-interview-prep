# Accounts Merge — answer outline

**Prompt:** `accounts[i] = [name, email1, email2, …]`. Merge accounts that share **at least one** email (same person). Output `[name, …emails sorted]`. Names may collide; **emails** are the identity. (LeetCode 721)

This is **union-find on accounts (or emails)**, not a string-group. The corpus lists union-find under [../general/coding-patterns.md](../general/coding-patterns.md) but had no outline. Cousin of [coding-number-of-islands.md](coding-number-of-islands.md) (components) and [coding-group-anagrams.md](coding-group-anagrams.md) (group by key — here the key is a *component*). NeetCode 150; Wikipedia [disjoint-set](https://en.wikipedia.org/wiki/Disjoint-set_data_structure).

## Probes

- Same display name ≠ same person. Shared email ⇒ merge, **transitively**.
- Emails inside one account are already the same person — union them (or union the account indices).
- Output emails **sorted**, name is any account in the component (they share a person).
- Empty / single account / no overlap → identity. Duplicate emails inside one row — treat as one.

## Strong answer skeleton — union-find on account indices

1. **Clarify:** case of emails; output order of *accounts* usually free; emails sorted.
2. **UnionFind(`n` accounts)** with path compression + union by rank/size.
3. Map `email → first account index`. For each account `i` and each of its emails: if unseen, record `i`; else `union(i, owner[email])`.
4. Group: for each email, `root = find(owner[email])`; append email to that root’s list.
5. For each root, prepend `accounts[root][0]` and **sort** the emails.
6. **Complexity:** O(E · α(n) + E log E) time (sort dominates); O(E + n) space. `E` = total emails.

DFS twin: undirected graph email–email (or email–account); BFS/DFS each component; same sort step. Interviewers accept either; UF is the pattern they named.

## Sketch (account-index UF)

```
uf = UnionFind(n)
owner = {}                    # email -> account index
for i, acct in enumerate(accounts):
  for email in acct[1:]:
    if email in owner:
      uf.union(i, owner[email])
    else:
      owner[email] = i

groups = defaultdict(list)    # root -> emails
for email, i in owner.items():
  groups[uf.find(i)].append(email)

return [[accounts[r][0]] + sorted(emails) for r, emails in groups.items()]
```

Two Johns sharing `b@x` merge; a third account with only `d@x` stays separate.

## Mock narration (30 sec)

> “Emails are the identity, names are labels. I union account indices whenever an email repeats, then group emails by the account root and sort. Path compression plus union-by-rank keeps the merges nearly linear; sorting each mailbox is the real cost.”

## Common mistakes

- Merging on **name** (“all Johns”).
- Forgetting transitivity (A∩B and B∩C but not A∩C).
- Sorting the *accounts* and leaving emails unsorted (or the reverse of the spec).
- Using a raw parent map without `find` compression and then comparing parents, not roots.
- Building an email graph and DFS-ing from names — names collide.

## Follow-ups

- **Number of Connected Components / Graph Valid Tree / Redundant Connection** — same UF, no sort.
- **Smallest String With Swaps** — UF on indices, then sort letters inside a component.
- **DFS vs UF:** same answer; UF is cleaner when the interviewer wants the data structure.

## Sources

- [Accounts Merge — NeetCode](https://neetcode.io/solutions/accounts-merge) — accessed 2026-09-24
- [Accounts Merge — LeetCode 721](https://leetcode.com/problems/accounts-merge/) — accessed 2026-09-24
- [Disjoint-set data structure — Wikipedia](https://en.wikipedia.org/wiki/Disjoint-set_data_structure) — accessed 2026-09-24
- Classic LeetCode #721 — union-find / email components
