# Two local rules move into the Waytide packages

**Source:** this repository, `eventide-project/useful-objects-new`, at `waytide/local/rules/`.

**Destination:** the Waytide composite, `waytide/waytide`, authored at `system/` and published to the `testing` and `foundation` component repositories.

## What moves

- **A high-level context names a behavior, never a method** (`2026-08-28T17-13-18Z`) joins the `testing` package. As it moves it takes the engineer's clarification of 2026-10-10: the rule applies most firmly at the higher contexts, and a deeper context that begins to describe implementation elements may be more permissive. It states that as a gradient and names no fixed level.
- **When the work diverges from the plan, the work is definitive** (`2026-09-04T17-05-34Z`) joins the `foundation` package.

## Reconciliation in the destination

- The `testing` package's test-context-nesting-mirrors-folders and single-case-test-named-for-feature rules carry examples named for methods — `upload/call/`, `context "Call"`, `upload/build/`. Those examples are renamed to behaviors. The two rules' substance is unchanged.
- The `testing` package's predicate-context-name rule is left as it is. A predicate's context is a deeper context, which the gradient permits.
- The `foundation` package's work-sessions-convention gains a citation of the moved rule, since the moved rule settles the ordinary answer to that convention's design reconciliation.
- Each package's `README.md` summary gains the moved rule.

## Increments, in order

1. The two rules are written into the composite, the reconciliations are made, and the changes are committed to the composite's `master` with their log entries.
2. The `testing` and `foundation` packages are published from the composite's `master`.
3. This project's packages are refreshed, so the two rules arrive under `waytide/system/`.
4. The two local copies are removed from `waytide/local/rules/`, and the removal is logged.

## What is true in between

- **After increment 1 and before increment 3**, each rule exists in two places. The local copy is authoritative here, and it is the older wording — the testing rule's local copy lacks the gradient.
- **After increment 3 and before increment 4**, each rule is read twice at session start, once from the package and once locally. Where the two differ, the package copy is the current one.
- **After increment 4**, the package copy is the only one, and this record is the trail of where the local rules went.

## What happened

1. The composite's `master` took the two rules in two commits, `72219df` for `testing` and `e95790e` for `foundation`, each with its log entry. The reconciliations were made as planned. The examples took the behavior names `rejected/` (with the cases `empty` and `refused`) and `retried`.
2. The direct-commit check found nothing. `testing` was published at `4a02da9` and `foundation` at `c318884`, and each pushed as a fast-forward.
3. This project's `testing` and `foundation` packages were refreshed. The refresh reported the two new rules and the four reconciled files, and nothing else.
4. The two local copies were removed. `waytide/local/rules/` is now absent, which is ordinary.

---

Authored by Scott Bellware on Sat Oct 10 2026 at 9:18:53 AM PT
Changed by Scott Bellware on Sat Oct 10 2026 at 9:21:21 AM PT
