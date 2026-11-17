# Feature — Specialized Substitute

**Intent:** a specialized substitute for the HTTP client, so a test reads a domain question of the substitute rather than the mimic's mechanical invocation telemetry.

- **State:** Completed
- **Upstream branch:** master
- **Implementation branch:** feature/specialized-substitute
- **Base:** 7ea5f42e26499ce075ddc2662eb084f79f388448
- **Working location:** branch only
- **Tags:** [feature]

## Source

The idea this is built from is A specialized substitute for the HTTP client, `2026-09-04T15-25-03Z-a-specialized-substitute-for-the-http-client-OPEN.md`. It carries one constraint on sequencing: the first increment is still tested using Mimic's telemetry directly, that is, using the `invoked?` predicate. So the specialized substitute follows that increment rather than replacing it.

This picks up one of the two decisions the Upload feature deferred rather than settled. That record states it as the test reading the mimic's telemetry directly instead of through a consonant predicate on a `Substitute` module. The demos carry the shape as `posted?`, in `09_specialized_mimic.rb` through `13_specialized_mimic_dependency_with_mixin.rb`.

## Outcomes

`Upload::HTTPClient::Substitute` is introduced as a mixin carrying no `build`, so the dependency's recording mimic is extended with it and the substitute **is a** `Substitute`. The alternative was a `Substitute.build` supplying the substitute itself, which leaves the returned mimic unextended.

**No test changed and no outcome was driven.** The engineer settled at the observation hinge that this increment observes nothing new, so the module arrives as a refactor rather than through a test. The module is empty, nothing reads it, and the predicate stays `invoked?`.

**The intent's second clause is unmet.** The intent reads *so a test reads a domain question of the substitute rather than the mimic's mechanical invocation telemetry*, and no test does. A consonant predicate has not been contemplated, and it is the increment ahead of this one. The specialization mechanism is what this feature built, and the seam it places is where that predicate goes.

## Confirmations

- **Working location, at the start** — branch only. Selected by the engineer through the selection interface on 2026-09-04.
- **The engineer's level of participation, at the start** — attended. Selected by the engineer through the selection interface on 2026-09-04.
- **The kind** — `[feature]`, built to an intent. Selected by the engineer through the selection interface on 2026-09-04.
- **The idea's placement** — committed to master before the branch was created, so master holds it whatever becomes of this branch. Selected by the engineer through the selection interface on 2026-09-04.

---

Authored by Scott Bellware on Fri Sep 4 2026 at 9:08:57 AM PT
Changed by Scott Bellware on Fri Sep 4 2026 at 9:18:35 AM PT
