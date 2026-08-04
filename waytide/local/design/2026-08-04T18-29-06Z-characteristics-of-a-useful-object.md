# Characteristics of a Useful Object — Design

## Summary

The characteristics of a useful object — **this generation's statement of what one is**.
Nothing is carried forward into it from the prior generation, and nothing is composed for it.

The prior generation's list is held separately, in the Legacy Characteristics of a Useful
Object design, and is source material rather than a statement this project makes.

**A characteristic enters this list only when the developer states it** — not by being
inferred from the code, not by being lifted from the prior generation's doctrine, and not by
being proposed. What originates with the developer is the **substance**, and that constraint
is the document's purpose rather than an incidental property of it.

**The wording is not held verbatim.** A dictation is recorded in the clearest statement of
what it says. Where a dictation admits more than one reading, the ambiguity is **surfaced and
put to the developer** rather than resolved silently or preserved unresolved — clarifying is
expected, and changing what is claimed is not.

## Background & Motivation

A characteristics document was created to hold this list and was pre-populated from the prior
generation's Overview. The content proved useful and is kept, but pre-populating it means
that document holds material the developer did not state. The two kinds of content cannot be
told apart once mixed, and the distinction is worth keeping: one list is what the prior
generation said, the other is what this generation's author says.

So the lists are separate. That document is now the **Legacy Characteristics of a Useful
Object** design, named for what it holds, and this one started empty and holds only what the
developer has stated.

## The characteristics

A useful object:

1. **Can be *used* — invoked — immediately after its initializer has run, and its initializer
   constructs or enables no operational dependency.**

   Every dependency is left in its inert, substituted state by the initializer. This holds
   **whether or not the dependency is capable of side effects**: the question at
   initialization is whether a dependency is *operational*, not whether it is dangerous.
   What makes it matter is the side-effecting case — external and input/output side effects
   above all — where an object that opened a database connection or stood up a payment client
   on its way into existence could not be brought into existence without consequence.

   **The constructor is where operational dependencies come from**, and this characteristic
   does not reach it. It governs the initializer. The class interface's constructor exists
   precisely to produce the object with its dependencies operational.

   This is what the word **useful** in Useful Objects means.

   *Stated 2026-08-04, clarified the same day on two readings — see Settled.*

## Settled

- **2026-08-04** — This document holds this generation's characteristics, and a characteristic
  enters it only when the developer states it.
- **2026-08-04** — The **substance** originates with the developer; the **wording** does not
  have to. A statement is recorded in its clearest form, and an ambiguity in one is put back
  to the developer rather than settled quietly.
- **2026-08-04** — The first characteristic is the meaning of the word *useful*: invocable
  immediately after the initializer has run, with no operational dependency constructed or
  enabled by it.
- **2026-08-04** — In characteristic 1, **the side-effect clause is a reason rather than a
  restriction**. The initializer constructs or enables no operational dependency at all,
  whether or not that dependency could have side effects. The alternative — permitting an
  operational dependency that cannot act on the world — was declined, because judging it
  would require knowing the whole of a dependency's reachable behavior rather than a fact
  about the object being initialized.
- **2026-08-04** — In characteristic 1, **initialization means the initializer**. The
  constructor is where operational dependencies come from and is not constrained by the
  characteristic. Without this, the characteristic reads as forbidding what the constructor
  exists to do.

## Out of Scope / Deferred

- **The legacy list.** The prior generation's characteristics live in the Legacy
  Characteristics of a Useful Object design and are not restated here. That document is
  source material; this one is the author's own statement.
- **The eventual relationship between the two lists.** Whether they merge, whether this one
  supersedes the legacy one, or whether they stay separate with distinct purposes is
  **open**, and is not decided by their existing separately today.
- **The argument for each characteristic.** This document holds what is stated; the
  doctrine makes the case.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 11:29:06 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:41 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:32:33 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:36:23 AM PT
