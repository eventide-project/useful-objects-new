# Loop record — Consonant Predicate

**Mode: unattended, then attended from cycle 8.** The run began unattended and changed on the engineer's instruction. Cycles 1 through 7 carry no options line and no decision line, because no gate was put in them. Cycles from 8 carry both, the loop stopping at each hinge. The change is recorded as a confirmation in the feature record, with the departure it makes from the attended-or-unattended-is-chosen-at-the-start rule.

**How the unattended part ran.** The engineer selected unattended at the feature's start. The loop did not stop through cycle 7, and the agent determined each hinge in them. A plan was presented before the work, and the engineer said to proceed.

The feature put a consonant predicate on the HTTP client's substitute. The test now reads a domain question of the substitute rather than the mimic's mechanical invocation record. The predicate's discrimination was then covered in a second file, taking the suite to two tests.

## Cycle 1 — Actuation

- **Hinge:** the efferent shape of the invocation.
- **Determined:** unchanged. The test actuates `upload.(control_file)` as before. This feature changes what is read about the effect, not what produces it. Moving the actuation would have made the increment two changes rather than one.

## Cycle 2 — Controls

- **Hinge:** what the test is built from.
- **Determined:** unchanged. `control_file = "some file"`, the literal placeholder. Building a controls namespace remains the other decision the Upload feature deferred, and it is not this feature's.

## Cycle 3 — Implementation

- **Hinge:** how the predicate comes about, and what it reads.
- **Determined:** `posted?(content)` added to `Upload::HTTPClient::Substitute`, calling `invoked?(:post, content: content)`. The module was empty, having been placed as this seam by the Specialized Substitute feature, so the predicate occupies it rather than creating anything.

  `invoked?` rather than `invoked_once?`, because the engineer chose `invoked?` at that hinge during the Upload feature. The demos use `invoked_once?` in `11_specialized_mimic_dependency.rb` and `13_specialized_mimic_dependency_with_mixin.rb`, and `invoked?` in `17_predicate_recorded_specialized_mimic_dependency_with_mixin.rb`. A once-claim was not this project's decision, so it is not reintroduced through a predicate's body.

  The red, green, refactor cycle was not run. The predicate covers behavior the substitute already had, so there is no red to drive that does not break a working test.

## Cycle 4 — Observation

- **Hinge:** what the test reads about the effect.
- **Determined:** `upload.http_client.posted?(control_file)` in place of `upload.http_client.invoked?(:post, content: control_file)`. This is the feature's whole point — the test asks whether the file was posted rather than whether a method symbol was invoked with a parameters hash.

  The predicate was verified to discriminate rather than assumed. It answers false for content that was not posted, and false on a substitute that was never used. A predicate that answered true in every case would pass the test vacuously.

## Cycle 5 — Naming

- **Hinge:** the name of the outcome the test establishes.
- **Determined:** unchanged. The context keeps `Posts the file to the HTTP client` and the test keeps `Posted`. The observation reads the same fact through a better interface, so what the test establishes did not change. Renaming would claim a change the feature did not make.

## Cycle 6 — The discrimination test

- **Hinge:** whether the predicate's discrimination is covered, and where the test sits.
- **Determined:** covered. The claim that the predicate discriminates rested on a probe that was not in the suite, so nothing prevented a regression in it. This is **coverage** rather than design — the behavior already existed in the mimic, so the test is green on arrival, which is correct here and would be a defect for a design test.

  The test was first written as a second outcome context in the root test's file, on the reasoning that it observes the same single actuation.

## Cycle 7 — The test's placement

- **Hinge:** which file the coverage test belongs in.
- **Determined:** the engineer instructed that it belongs in its own file. It moved to `test/automated/upload/other_content.rb`, with its own actuation and its own controls, taking the second-level context the root test does not.

  The context is named `Other Content`, the case, rather than `Posted Predicate`. **Two rules disagree here.** The `testing` package's predicate-context-name rule gives a predicate's context as `<Name> Predicate`. This project's local rule says a high-level context names a behavior and never a method. The local rule was followed, and the collision is the agent's resolution rather than something either rule settles.

## Cycle 8 — The test directory

- **Hinge:** whether the coverage test sits under an `upload/` subdirectory.
- **Options:** none — no gate. The engineer instructed it directly: the library is only concerned with Upload and so are its tests, so no `upload/` segment is warranted.
- **Decision:** the subdirectory removed. Both test files sit in `test/automated/`, each mirroring its own filename to one context.

## Cycle 9 — The control names

- **Hinge:** what the two controls are called, the test turning on the difference between them.
- **Options:** none — no gate. The engineer dictated `control_file_uploaded` and `control_file_not_uploaded`.
- **Decision:** as dictated. The names carry the distinction the test is built on, where `control_file` and `control_other_file` left it to the reader.

## Cycle 10 — The outcome contexts

- **Hinge:** what each outcome context claims.
- **Options:** none — no gate. The engineer dictated both names.
- **Decision:** `The HTTP client posts the file content` and `The HTTP client doesn't post the file content`. The first replaced `Posts the file to the HTTP client`, which read as though `Upload` posts. `Upload` delegates and the client posts, so the rename moved the subject to what the code establishes.

## Cycle 11 — Where the case sits

- **Hinge:** whether the case takes a context of its own or is stated as the test's name.
- **Options:** an inner context holding the case, with the test inside it. The case as the test's name, with no inner context.
- **Decision / chat:** the engineer selected `Explain briefly` first, then the inner context. Both files then carry the same shape — a top context mirroring the filename, an outcome context, and a test.

## Cycle 12 — The filenames

- **Hinge:** what the two test files are called.
- **Options:** none — no gate. The engineer wrote *the tests should be uploaded and not uploaded*.
- **Decision / chat:** **the agent read that as the test names and renamed the tests.** The engineer corrected that it meant the filenames. The test names were reverted to `Posted` and `Not posted`, and the files became `uploaded.rb` and `not_uploaded.rb`.

  The top-level contexts follow the filenames, which the folder-mirroring rule requires. So `Upload` is gone. The engineer had asked to keep it two cycles earlier, and the filename change overtook that — the two cannot both hold.

## Outcome

`Upload::HTTPClient::Substitute` carries `posted?(content)`. The test reads it. The mimic still exposes `invoked?`, and the predicate calls it, so nothing was hidden and one reading was put in front of the other.

Suite: `2 passed, 0 failed, 0 skipped`, over `test/automated/uploaded.rb` and `test/automated/not_uploaded.rb`.

The specialized substitute idea's intent is now met. Its first increment was tested through Mimic's telemetry directly, as the idea required, and this increment replaced that reading with the consonant predicate.

---

Authored by Scott Bellware on Fri Sep 4 2026 at 9:25:27 AM PT
Changed by Scott Bellware on Fri Sep 4 2026 at 9:33:02 AM PT
Changed by Scott Bellware on Fri Sep 4 2026 at 9:48:39 AM PT
