# Characteristics of a Useful Object — Design

The characteristics of a useful object — **this generation's statement of what one is**.

## Mechanics

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

   *Stated 2026-08-04, clarified the same day on two readings.*

2. **Has a single purpose.** In practice, the purpose of an object is to do **one thing** —
   save some data, carry out some business transaction.

   **The implication is that most objects in any system can be implemented as command
   objects**, which is what learning what object-orientation (OO) has always offered comes
   down to. The implication is noted rather than claimed: the characteristic is that the
   object has one purpose, and the prevalence of command objects is what follows from it
   across a system.

   **It says nothing about how the purpose is invoked.** An object with a single purpose may
   still expose more than one public method, and whether one actuator sets its act in motion
   is a separate claim that is not made here.

   *Stated 2026-08-04.*

---

Authored by Scott Bellware on Tue Aug 4 2026 at 11:29:06 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:41 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:32:33 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:36:23 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:43:50 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:10:39 PM PT
