# A high-level context names a behavior, never a method

A test's high-level context is expressed in terms of a **behavior**. A method name is an implementation, so it does not name one. `context "Call"` takes the name of the method `call` and states nothing about what the unit does. What the reader wants there is the behavior the unit is being read for.

**The root test needs no second-level context at all.** A unit's basic test establishes the unit's central behavior, and there is nothing to distinguish it from. So it sits directly under the unit's own context, and its outcome context carries the behavior's name. Subsequent tests, which cover other behaviors, take a second level and name it for the behavior they cover.

**The file path follows, because the contexts mirror it.** The `testing` package's test-context-nesting-mirrors-folders rule makes each path segment under `test/automated/` a context, so dropping a context and leaving the segment puts the two out of step. A root test lives at `test/automated/<unit>.rb` and a subsequent behavior at `test/automated/<unit>/<behavior>.rb`.

**Why:** a context is read before anything under it, and it decides what the reader takes the test to be about. A method name sends them to the source to find out what the method does, which is the interpretive work solubility is the absence of. A behavior name says it on the page.

The method name also fixes the test to an implementation detail. Renaming the method would leave the context describing something that no longer exists, and the test would still pass while saying the wrong thing.

**How to apply:** name a high-level context for the behavior under test. Do not name one for a method, and do not name one for a class's internal structure. Give a unit's root test no second-level context, and put it at `test/automated/<unit>.rb`. Give each subsequent behavior its own second level, named for the behavior.

Related:

- the `testing` package's test-context-nesting-mirrors-folders rule — the path the contexts mirror
- its single-case-test-named-for-feature rule — the file named for the feature rather than for a case
- its context-only-for-local-instrumentation rule — when a context is warranted at all
- the `language` package's name-literally-not-by-analogy rule and its solubility rule

---

Authored by Scott Bellware on Fri Aug 28 2026 at 10:13:18 AM PT
