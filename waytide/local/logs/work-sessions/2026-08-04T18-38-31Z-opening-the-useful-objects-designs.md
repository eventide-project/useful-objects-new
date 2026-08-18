# Work Session — Opening the Useful Objects Designs (Tue Aug 4 2026 11:38)

## Opening summary

The session began as a request to start one design record in an empty repository, and ended
with three designs, nine decision-log entries, and the project's direction settled from its
premise down to the wording of its first characteristic. Between those, it turned twice: once
when the current state of substitutes and telemetry proved to have moved well past the prior
generation's doctrine, and once when the way characteristics were being collected was
corrected — first by splitting a pre-populated document in two, then by loosening the rule
that split had introduced.

## Framing note

This is the communicable record of the session — the guided tour. It is not the source of
truth. The durable records are the three designs under `waytide/local/design/`, the entries
under `waytide/local/log/`, and the git history. This narrative points at them and preserves
the reasoning between them.

## 1. The rules, and an empty queue

The session opened with `load waytide`. Every rule file under `waytide/system/` was read —
seven packages, foundation first — along with each package's `vocabulary.md`. The project has
no `waytide/local/rules/` of its own yet, which is ordinary. The deferred queue was empty, and
so were all the working directories: `waytide/local/` did not exist.

## 2. What the design would settle

The repository held nothing but the Waytide install and a one-line `README.md`. With no code
to read, what a design record could settle was itself the first decision, and it was put
through the selection UI: the library's premise and scope, its structure and layout, or the
first object's design. **The premise and scope was chosen.**

## 3. The predecessor, and the premise

The directory name `useful-objects-new` implied a predecessor, and there was one — the
`useful-objects` repository, holding a 25 KB doctrine document beside a small illustrative
example, last substantively changed in June 2024.

Reading it first was what made the premise question answerable rather than blind. The premise
was then stated directly: **the doctrine restated, and a new reference implementation —
effectively the next generation.** Two deliverables, one piece of work.

The first design record was written, recording the premise, the motivation for a new
generation rather than an edit, and what it deliberately excluded.

## 4. The companion website

A companion project was named — `useful-objects-website`, Hugo and Hextra, external,
referencing this project's content, not yet created.

**The `a-project-does-not-name-its-consumers` rule was considered and found not to apply.**
Its test is *why* a name is present, not whether the named project consumes this one, and it
names Waytide's own `website` as the permitted case. The companion is part of Useful Objects
at large, so the design may name it. What the design records is the arrangement, the boundary
that follows from it, and the direction of the reference: the website names this project, and
this project does not arrange itself around the website.

## 5. What had evolved: substitutes and telemetry

The prior doctrine's mechanisms turned out not to be the current ones. The current practice
lives in the `dependencies-and-substitutes` repository, whose numbered demos were read in
sequence.

**Substitutes.** A dependency's default substitute is now a **mimic** generated from the
subject class, not a null object built for the purpose — so strictness comes from mimicking a
real interface, and the weak-against-strict distinction the prior doctrine drew is no longer
operative. A `Substitute` module specializes the mimic rather than subclassing the subject.

**Telemetry.** Invocation recording replaced the telemetry sink: a substitute is interrogated
directly rather than registering a sink and asking what it recorded. Mimics record by default,
so the demos that activate recording explicitly predate the change. The **consonant
predicate** is the current idiom, and the recorder's `predicate` macro is retired.

**Three claims already written into the design were stale and were corrected**, including the
library list, which had named the prior doctrine's set rather than the one current practice
draws on.

**One question was recorded as open rather than settled.** Because a mimic records by default
and already carries the invocation predicate, a substitute module's recording mixin and its
recorded method can both be removed with no behavioral change, and a specialized body written
there never executes. The demos carrying this were uncommitted working changes at the time.
Resolving it belongs to the mimic and dependency libraries, not here.

## 6. The Telemetry library, and the word

The next decision was stated plainly: **this generation avoids Eventide's Telemetry library.**

That settled the dependency and left a question it did not answer — what becomes of the
*word*. It was put through the selection UI, because getting it wrong would misframe the
doctrine's whole transparency argument. **The word is kept general**: telemetry names an
object's self-reported execution data, as the prior doctrine uses it, and is not the name of a
library here. The consequence is that the prior doctrine's telemetry section is revised rather
than rewritten — its argument and its words survive, and only the mechanism beneath it changed.

## 7. The characteristics, and a correction

A second design was started to hold the characteristics of a useful object. **It was
pre-populated** from the prior generation's Overview — the part of that document most recently
worked, its last commit being *Characteristics are clarified*.

Then the first characteristic was stated: what **useful** means — invocable immediately after
initialization, with initialization constructing or enabling no operational, side-effecting
dependency. It was recorded into that same list.

**The correction came next: the document should not have been pre-populated.** The content was
useful and was kept, but seeding it meant one document held two kinds of content that could
not be told apart — what a prior generation said, against what this generation's author says.
The remedy was two documents. The seeded one was renamed the **Legacy Characteristics of a
Useful Object**, and the stated characteristic moved out of it into a document that started
empty.

## 8. Loosening the rule the split introduced

The split had been written with a rule attached: the second document grows only by dictation,
and not by proposal. **That rule was then corrected too** — dictations need not be recorded
verbatim, and clarifications are wanted.

So the rule was restated at the right altitude: the **substance** originates with the
developer, and the **wording** does not. A statement is recorded in its clearest form, and an
ambiguity in one is surfaced and put back rather than settled quietly or preserved unresolved.
The second document then dropped its "dictated" qualifier, the legacy one already carrying the
distinction.

## 9. The first characteristic, clarified

With clarification now wanted, the stated characteristic was found to carry two readings, each
changing what it permits. Both went through the selection UI.

**The side-effect clause is a reason, not a restriction.** The initializer constructs or
enables no operational dependency at all, whether or not it could act on the world. The
narrower reading was declined because judging it would require knowing the whole of a
dependency's reachable behavior rather than a fact about the object being initialized.

**Initialization means the initializer.** The constructor is where operational dependencies
come from and is not constrained by the characteristic — without which it would read as
forbidding exactly what the constructor exists to do.

## Takeaways

- The project is the **next generation** of Useful Objects, carrying two deliverables — the
  doctrine restated and a new reference implementation — as one piece of work.
- The restatement follows **current practice**, not the prior generation's mechanisms.
  Substitutes and telemetry are the two areas that moved, and the prior generation is left as
  written.
- **Eventide's Telemetry library is avoided**, while the word *telemetry* is kept in its
  general sense.
- The characteristics live in **two documents that must not be mixed** — this generation's
  statement, and the legacy list kept as source material with its order frozen.
- **Substance originates with the developer; wording does not.** Ambiguities go back to him.
- Three questions are deliberately **open**: the package naming and whether a product
  generation segment is carried, what becomes of the legacy list, and the three candidate
  characteristics the legacy list omits.

## Glossary

- **useful object** — an object invocable immediately after its initializer has run, with no
  dependency uninitialized and no nil reference error reachable through one, and whose
  initializer constructs or enables no operational dependency. The constructor is where
  operational dependencies come from.
- **mimic** — an object generated from a subject class, carrying that class's interface; the
  substitute a dependency defaults to.
- **substitute** — any object conforming to a dependency's interface and semantics. None is
  more real than another.
- **consonant predicate** — a domain-meaningful predicate a substitute exposes publicly, so
  the mechanical invocation record is not what its users read.
- **telemetry** — an object's self-reported execution data, in the general sense. Not the name
  of a library here.
- **transparency** — the design quality that provides for telemetry. Of the design, used by
  tests.
- **product generation** — the leading segment of a four-segment version; a declaration that a
  new product line has begun, never derived from a change.

## Where the durable records live

- **`waytide/local/design/2026-08-04T18-09-17Z-useful-objects.md`** — the premise, the two
  deliverables, what evolved, the vocabulary, and the settled resolutions.
- **`waytide/local/design/2026-08-04T18-29-06Z-characteristics-of-a-useful-object.md`** — this
  generation's characteristics, and the rule by which the list grows.
- **`waytide/local/design/2026-08-04T18-23-43Z-legacy-characteristics-of-a-useful-object.md`**
  — the prior generation's list, carried forward as source material.
- **`waytide/local/log/`** — nine entries, one per decision, from the premise through the two
  clarifications of characteristic 1.
- **The prior generation** — the `useful-objects` repository, left as written.
- **Current practice** — the `dependencies-and-substitutes` repository's numbered demos.

Two working corrections were also recorded outside this repository, in the agent's
per-project memory: that a document asked for as a container starts empty, and that substance
originates with the developer while wording does not.

## Closing note

The session's two turns were both corrections to how the work was being done rather than to
what it concluded, and both produced a durable rule. That is the more useful half of what it
generated: the designs record what Useful Objects is, and the corrections record how its
record is to be kept.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 11:38:31 AM PT
