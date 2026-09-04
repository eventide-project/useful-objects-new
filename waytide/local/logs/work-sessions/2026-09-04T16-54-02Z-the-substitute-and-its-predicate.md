# Work Session — The Substitute and Its Predicate (Fri Sep 4 2026 09:54)

The session began with housekeeping the previous one had left — a journal entry that git was silently ignoring, stale comments in a machine-level configuration file, and a gemspec declaring the wrong license. It became the two increments that finish what the first feature deferred: a specialized substitute for the HTTP client, and the consonant predicate that occupies it. It ended with the pending work item the reference implementation plan has been asking for since it was written.

**This is the communicable record — the guided tour.** It is not the source of truth. The durable records are the binding rules in `waytide/system/` and `waytide/local/rules/`, the project's ideas in `waytide/local/ideas/`, the decision log in `waytide/local/logs/log/`, the implementation records in `waytide/local/implementations/`, and the loop records in `waytide/local/logs/loops/`. This narrative points at them.

## 1. A journal entry git was ignoring

The engineer dictated the project's first journal entry. It never appeared in `git status`, and the reason was `.gitignore` line 5 — `*sketch*`, copied from `constant` — matching the entry's own title, which ended in *sketch*. The entry would have gone uncommitted with nothing reporting it.

**The fix was the class of problem rather than the instance.** A negation, `!waytide/local/journal/**`, exempts the journal outright. The journal is committed with the project by convention, so no scratch pattern should be able to swallow an entry whatever a writer's title happens to contain. Force-adding the one file was offered and declined.

The engineer then amended the entry the next day. **The journal convention forbids editing an entry** — an entry is a historical record and a later thought is a later entry, with disclosure the only exception. That was put to them, with a second entry as the alternative, and they chose to amend. The entry's footer carries no `Changed by` line, so a later reader cannot tell from the file that it was edited. That cost was stated before the choice was made.

## 2. The license

The gemspec declared MIT and no license file existed. The engineer settled it: the license is the **Eventide Common Interest License**. A `LICENSE` file was written in the form the Waytide packages use — it names the license rather than setting out terms, the text being forthcoming — and `s.licenses` carries the same name.

**`gem build` will warn on every build**, the name not being an SPDX identifier. That was the stated cost of the answer chosen over `Nonstandard` and over dropping the field. The `LICENSE` file also does not ship inside the gem, `s.files` globbing `{lib}/**/*` alone.

## 3. The specialized substitute

Recorded as an idea, then amended by the engineer with a constraint on sequencing: **the first increment is still tested using Mimic's telemetry directly**, that is, using `invoked?`. So the specialized substitute follows that increment rather than replacing it.

The feature that followed ran three wrong proposals before it ran a right one, and each correction is worth carrying:

- **The agent framed the substitute as being *actuated*.** The engineer corrected it: the substitute is **inspected** using a predicate method. The actuation is `upload.(file)` and had not changed.
- **The agent proposed a domain predicate at this increment.** The engineer corrected it: the predicate stays `invoked?`, because a domain-specific one has not been contemplated and the work is incremental.
- **The agent offered a padded option.** `posted_content?(control_file)` varied a method's name while the use site stated exactly what the other candidate stated. The actuation gate's own test is what the use site says, and that candidate failed it.

Only after reading `09_specialized_mimic.rb` through `13_specialized_mimic_dependency_with_mixin.rb`, and probing both mechanisms, did the real hinge appear. **A `Substitute` module with `self.build` supplies the substitute itself. A `Substitute` module without one is a mixin the gem extends a recording mimic with.** They differ observably — the mixin form's substitute **is a** `Substitute` and the build form's is not — and both keep `invoked?` working.

The engineer chose the mixin, and chose that the increment observes **nothing new**. So the module arrived empty, as a refactor, with no test driven and nothing reading it. The feature concluded `Completed` with its intent's second clause explicitly unmet, recorded as such rather than implied away.

## 4. The consonant predicate

Started **unattended** — the first time in this project. Unattended presents a plan before it generates, because that is the only place the engineer sees the path before the work is done. The plan was written in ETE, given as an ordered list, and the engineer said to proceed.

The agent then determined all five hinges and generated through. `posted?(content)` went into the empty module, calling `invoked?` rather than `invoked_once?` — the demos use the latter in two of three places, and the engineer had chosen `invoked?` at that hinge during the Upload feature, so a once-claim was not reintroduced through a predicate's body.

**The predicate was verified to discriminate rather than assumed.** It answers false for content that was not posted, and false on a substitute never used. That claim rested on a probe outside the suite, and saying so is what prompted the engineer to ask for a test covering it.

## 5. The mode changed mid-flight

The engineer changed the run to **attended** partway through. **The rule has the mode chosen at a feature's start and held for its duration**, and states no trigger for changing it, where the lifecycle does state two for the working location. The instruction settles it, and both records carry the departure rather than reading as though one mode applied throughout. The loop record's mode line names the cycle the change falls at.

## 6. The naming

Seven exchanges settled where two test files sit and what everything in them is called. The agent misread one instruction — *the tests should be uploaded and not uploaded* — as naming the tests rather than the files, renamed the tests, and reverted them.

What settled: `test/automated/uploaded.rb` and `test/automated/not_uploaded.rb`, no `upload/` subdirectory, each file's top context mirroring its own filename, outcome contexts naming what the HTTP client does, and tests named `Posted` and `Not posted`.

**A collision between two rules surfaced here and is not resolved.** The `testing` package's predicate-context-name rule gives a predicate's context as `<Name> Predicate`. This project's own local rule says a high-level context names a behavior and never a method. The local rule was followed, and that is the agent's resolution rather than something either rule settles.

## 7. What was closed and what was queued

Both features concluded, merged with `--no-ff`, and were verified after the merge as well as before. Both branches were deleted after confirming their last commits were ancestors of `master`, so neither delete was forced. The specialized substitute idea reached **Realized**, two features having realized it.

The plan's fourth statement — the build process recorded in enough detail to be reproduced, in a file separate from `logs/` — was queued as the project's **first deferred item**. It will print at the start of every session from now on.

## Takeaways

- **Read the material before proposing.** Three wrong proposals preceded reading the demos and probing the gem. The right hinge was visible in `10_specialized_dependency.rb` the whole time.
- **Verify an API before offering it as an option.** This session repeated the previous one's lesson in a new form, and the fix is the same: list what the object actually exposes.
- **An option that varies a name and not what the use site states is padding.** The two-option floor does not license inventing the second one.
- **A silent `.gitignore` match is worse than a loud failure.** Nothing reports a file that never appears in `git status`.
- **Naming costs more exchanges than mechanism.** The specialization mechanism took one gate. What to call the files, contexts, controls, and tests took seven.

## Glossary

- **Specialized substitute** — a substitute shaped by a `Substitute` module on the subject class, rather than the bare mimic the dependency macro supplies by default.
- **The mixin form** — a `Substitute` module carrying no `build`. The gem builds a recording mimic and extends it with the module, so the substitute **is a** `Substitute`.
- **The build form** — a `Substitute` module carrying `self.build`, which supplies the substitute itself. What it returns is not extended with the module.
- **Deferred item** — an idea tagged `[deferred]`. The tag is the queue, and it prints at the start of every session. It is not the `Deferred` state, which means parked indefinitely.

## Where the durable records live

- **Ideas:** the specialized substitute idea, now `REALIZED`, and the reproducible-record deferred item.
- **Implementations:** `2026-09-04T16-08-57Z-specialized-substitute-COMPLETED.md` and `2026-09-04T16-25-27Z-consonant-predicate-COMPLETED.md`.
- **Loop records:** one per feature, the second declaring the mid-flight mode change and running to twelve cycles.
- **Decision log:** seven entries dated 2026-09-04.
- **Code:** `lib/upload/http_client.rb` carrying the `Substitute` module and its `posted?`, with `test/automated/uploaded.rb` and `test/automated/not_uploaded.rb`.
- **Journal:** the writer's first entry, and its amendment.

## What remains to be reconciled

Four things were outstanding when this record was written, and each is a live artifact citing something that has changed.

1. **The design reconciliation for this record.** The work-sessions convention puts it to the engineer once the record is written. The prompt was interrupted so the engineer could ask what would change in the plan, and it was not answered afterward.
2. **The plan does not cite the deferred item that now carries its fourth statement.** That statement asks for a reproducible record of the build process. It is queued as `2026-09-04T16-52-02Z-a-reproducible-record-of-the-build-process-ACTIVE.md`, and nothing in the plan points at it.
3. **The plan's second and third statements are overtaken by what was built.** The second describes an HTTP client and an Upload object that uses it, which now exist. The third says the later demos are the more relevant ones, and demos 10 through 13 have been used where 14 through 17 have not been reached. An idea is amended by dated addition rather than rewritten.
4. **The Useful Objects aspiration's `useful-objects-website` resolution.** Dated 2026-08-04, it states the companion project does not exist yet and is created once this project has more clarity. Whether that still holds is not readable from this repository.

**Nothing else is outstanding.** The three implementation records, the three loop records, and the two work session records cite renamed files and describe deferred decisions since settled. All eight are historical records — concluded feature records and running records — and are left as written.

## A closing note

The unattended increment took one instruction and produced a working predicate. The attended naming that followed took seven exchanges and changed no behavior. That is not an argument against attended work — the gates caught three wrong proposals before they became code. It is an observation that the method's cost falls where judgment is cheapest to spend and hardest to skip, and that naming is where an engineer's judgment is least substitutable.

---

Authored by Scott Bellware on Fri Sep 4 2026 at 9:54:02 AM PT
Changed by Scott Bellware on Fri Sep 4 2026 at 10:02:23 AM PT
