# Loop record — Consonant Predicate

**Mode: unattended.** The engineer selected unattended at the feature's start. The loop did not stop, and the agent determined each hinge. No cycle below carries an options line or a decision line, because no gate was put and no selection was made. A plan was presented before the work, and the engineer said to proceed.

The feature put a consonant predicate on the HTTP client's substitute. The test now reads a domain question of the substitute rather than the mimic's mechanical invocation record. No outcome was added, and the suite stays at one test.

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

## Outcome

`Upload::HTTPClient::Substitute` carries `posted?(content)`. The test reads it. The mimic still exposes `invoked?`, and the predicate calls it, so nothing was hidden and one reading was put in front of the other.

Suite: `1 passed, 0 failed, 0 skipped`.

The specialized substitute idea's intent is now met. Its first increment was tested through Mimic's telemetry directly, as the idea required, and this increment replaced that reading with the consonant predicate.

---

Authored by Scott Bellware on Fri Sep 4 2026 at 9:25:27 AM PT
