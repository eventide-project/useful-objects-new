# Legacy Characteristics of a Useful Object — Design

## Summary

The **legacy** description of a useful object — the list of characteristics as the prior
generation states them, carried into this repository as source material.

**It is not this generation's statement of what a useful object is.** That is the
Characteristics of a Useful Object design, which holds only what the developer states.
This document holds what was already said, so that the restatement has the prior claims in
front of it and can be read against them.

The premise both lists serve is the Useful Objects design's: an object must be useful
immediately upon instantiation, with no dependency left uninitialized.

## Background & Motivation

The prior generation states such a list in its doctrine's Overview, and it is the part of
that document most recently worked — its last commit is *Characteristics are clarified*. So
the list is not incidental to the doctrine; it is the doctrine compressed to its claims,
which is what makes it worth carrying forward rather than re-reading from the old repository
each time.

Holding it here does two things the prior arrangement could not. It gives the legacy list an
identity apart from the prose that argues it. And it puts the legacy claims and this
generation's claims in two documents that cannot be confused for each other.

**The content is the prior generation's, revised only where a settled decision requires.**
Each characteristic below is marked **inherited** where it carries over as written, and
**revised** where it does not, with what changed stated at the point of change. Nothing here
is this generation's statement; a characteristic the developer states goes in the
Characteristics of a Useful Object design instead.

## The characteristics

A useful object:

1. **Is usable immediately upon initialization**, without any nil reference error resulting
   from an uninitialized dependency. *(inherited)*

2. **Is behavioral**, with state that only directly supports the behavior. *(inherited)*

3. **Has a single purpose.** *(inherited)*

4. **Has no logic in its initializer** other than assigning the values of the initializer's
   parameters to the object's instance variables. *(inherited)*

5. **Formalizes the difference between initializer arguments and setters**, and the
   circumstances under which one is used rather than the other. *(inherited)*

6. **Requires no foreign mechanism outside its class's own namespace** — including its inner
   namespaces — to initialize it and its dependencies. No inversion-of-control container.
   *(inherited)*

7. **Does not invite nils or dummy values into its initializer** for the purpose of setting
   the object up for testing. *(inherited)*

8. **Relies on telemetry rather than test doubles** — mocks, spies — to inspect its
   execution. *(revised)* The claim is unchanged and the word **telemetry** is retained in
   its general sense. What changed is beneath it: the telemetry is an **invocation record**,
   read through a **consonant predicate** on the substitute's public interface, rather than a
   sink registered against the object. Eventide's Telemetry library is not used.

9. **Does not rely on test doubles** — stubs — to disengage dependencies whose side effects
   are undesirable while the object is being exercised. *(revised)* The claim is unchanged.
   What changed is what stands in the dependency's place: a **mimic** generated from the
   subject class, rather than a null object constructed for the purpose.

## What this generation's list adds against this one

The Characteristics of a Useful Object design's first characteristic states the meaning of
the word **useful**, and it carries a clause this list does not have anywhere in it.
Characteristic 1 above states the positive half — the object is usable, with no nil reference
error reachable through a dependency. That characteristic states the negative half as well:
being usable must not be bought by standing the dependencies up. An object that constructed a
live database connection or an operational payment client in its initializer would satisfy
characteristic 1 above and fail that one.

That is the sharpest difference between the legacy description and this generation's, and it
is the reason the two lists are worth holding apart rather than merging on sight.

**Characteristic 3 above is restated there at greater length.** This list says only *has a
single purpose*. The current list's second characteristic says what that means in practice —
the object does one thing — and notes the implication that follows across a system, that most
objects can be implemented as command objects. The claim is the same; what the legacy list
leaves implicit is stated.

**The actuator candidate below survives that restatement.** The current list's second
characteristic deliberately makes no claim about how an object's purpose is invoked, so
whether a single actuator sets the act in motion remains unstated in both lists.

**Characteristic 2 above uses a word that has since become a gloss.** This list says an
object *is behavioral*. This generation's term is **operative object**, with *behavioral* and
*command* kept as glosses for it. The legacy wording stands as written — it is what the prior
generation said — and the substitution is noted here rather than made there.

## Candidates for the list, not yet accepted

The prior doctrine's body asserts these, and its list does not. They are recorded here as
candidates so the omission is a decision rather than an oversight, and they are **not** part
of the list until accepted.

- **Its dependencies are substitutable, and no substitute is more real than another.** The
  doctrine argues substitutability at length, and the list reaches it only obliquely, through
  the characteristics about test doubles.
- **Its class interface constructs it with operational dependencies, and its instance
  interface does not.** The strict initializer beside the forgiving constructor is the
  doctrine's central construction claim, and the list states only the initializer half of it.
- **Its single act is set in motion by a single actuator.** The doctrine names the actuator
  and the class-and-instance duality; the list says an object has a single purpose without
  saying how that purpose is invoked.

## Settled

- **2026-08-04** — The characteristics are held in their own document, apart from the prose
  that argues them.
- **2026-08-04** — This document holds the **legacy** description: the prior generation's
  list, revised only where a settled decision requires, with each characteristic marked
  inherited or revised. It is source material and is not this generation's statement.
- **2026-08-04** — Characteristics 8 and 9 are revised for current practice: the mechanism
  beneath each changed, and neither claim did.
- **2026-08-04** — **This generation's characteristics are collected elsewhere.** A
  characteristic the developer states goes into the Characteristics of a Useful Object
  design, so that what was inherited and what this generation's author states are never
  mixed. The one characteristic recorded here before that separation — the meaning of
  *useful* — moved there and is no longer part of this list.

## Out of Scope / Deferred

- **The argument for each characteristic.** This document holds the list; the doctrine makes
  the case. A characteristic states what is true of a useful object, not why it is worth
  holding to.
- **The order of the list.** The prior generation's order is kept, so that this list and the
  original can be read against each other. Reordering it would cost the one thing a legacy
  record is for.
- **Accepting or declining the candidates above**, which is the developer's, and is left
  until the doctrine's restatement has settled far enough to say whether the legacy list was
  short by three.
- **What becomes of this document.** Whether the legacy list is eventually superseded by the
  current one, kept beside it permanently, or retired once the restatement is written is
  **open**. It is kept now because its content is useful and because the restatement is
  written against it.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 11:23:43 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:26:52 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:41 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:32:33 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:10:39 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:20:28 PM PT
