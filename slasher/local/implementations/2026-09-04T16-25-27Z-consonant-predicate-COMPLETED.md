# Feature — Consonant Predicate

**Intent:** a consonant predicate on the HTTP client's substitute, so the test reads a domain question rather than the mimic's mechanical invocation record.

- **State:** Completed
- **Upstream branch:** master
- **Implementation branch:** feature/consonant-predicate
- **Base:** 62baab0e0159f7e3180344f1693ea4f656bcf377
- **Working location:** branch only
- **Tags:** [feature]

## Source

The idea this is built from is A specialized substitute for the HTTP client, `2026-09-04T15-25-03Z-a-specialized-substitute-for-the-http-client-OPEN.md`. That idea holds the first increment on Mimic's telemetry directly, and this feature is the increment after it.

The Specialized Substitute feature built the mechanism and left the intent's second clause unmet. It put `Upload::HTTPClient::Substitute` in place as an empty mixin, which is the seam this predicate occupies.

The term is this project's own, settled in the work session of 2026-08-04: a consonant predicate is a domain-meaningful predicate a substitute exposes publicly, so the mechanical invocation record is not what its users read. Legacy characteristic 8 carries it.

## Outcomes

`Upload::HTTPClient::Substitute` carries `posted?(content)`, which reads the invocation record through `invoked?`. The test asks whether the file was posted rather than whether a method symbol was invoked with a parameters hash, so the intent is met — the specialized substitute idea's second clause, which the Specialized Substitute feature left unmet, is now satisfied.

The suite is two tests over two files. `test/automated/uploaded.rb` establishes that the HTTP client posts the file content. `test/automated/not_uploaded.rb` establishes that it does not post content that was never given to it, which is **coverage** of the predicate's discrimination rather than design. That test is green on arrival, which is correct for coverage.

The predicate's discrimination was verified beyond the suite as well: it answers false for content that was not posted, and false on a substitute that was never used. The second of those is not covered by a test, and it would need its own actuation and file.

The mimic still exposes `invoked?`, and the predicate calls it. Nothing was hidden — one reading was put in front of the other.

## Confirmations

- **Working location, at the start** — branch only. Selected by the engineer through the selection interface on 2026-09-04.
- **The engineer's level of participation, at the start** — **unattended**. Selected by the engineer through the selection interface on 2026-09-04. The loop does not stop at the hinges, and the agent determines each one.
- **The engineer's level of participation, changed mid-flight** — **attended**, on the engineer's instruction of 2026-09-04, after the consonant predicate and the discrimination test were generated. The original selection above stands as written. **This departs from the attended-or-unattended-is-chosen-at-the-start rule**, which has the mode chosen at the start and held for the work's duration. The rule states no trigger for changing it, where the lifecycle does state two for the working location. The engineer's instruction settles it, and the record carries the departure rather than hiding it.

---

Authored by Scott Bellware on Fri Sep 4 2026 at 9:25:27 AM PT
Changed by Scott Bellware on Fri Sep 4 2026 at 9:33:02 AM PT
Changed by Scott Bellware on Fri Sep 4 2026 at 9:48:39 AM PT
