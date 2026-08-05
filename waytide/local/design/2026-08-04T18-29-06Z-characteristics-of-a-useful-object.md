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

   **The implication is that objects *are* operative objects** — objects that carry out an
   act. This is not a claim about what most objects could be implemented as if one chose to;
   it is what an object in a system ordinarily **is**, and grasping that is what learning
   object-orientation (OO) comes down to.

   **Operative object** is the term. **Behavioral object** and **command object** are
   glosses — the first is the prior generation's word, the second the most widely recognized
   of the three. *Operative* is preferred because a data structure can be said to have
   behavior while never operating on anything, and because *command* imports a
   pattern-catalog framing for what is the ordinary case rather than a pattern applied.

   **Object-relational mapping (ORM) objects are the contrast, and they are the exception.**
   An ORM object is a **mix of data structure and state machine**. What it models is,
   typically, **tabular row storage** — not object-oriented behavior. It is largely an
   exception to object-orientation rather than a rule of it, and it does not fit
   object-orientation without being force-fit.

   **Putting methods on an ORM object does not obviate this.** Behavior attached to a thing
   that models a stored row does not convert it into an object that carries out an act. What
   it models is unchanged by what is hung on it, so the exception survives the methods.

   **The state-machine aspect takes more than one form, and each form is itself the less
   object-oriented part.** Persistence lifecycle and attribute change tracking are both
   instances of it. Neither is as object-oriented as an operative object, and neither
   benefits to the same extent from the advantages object-orientation is intended to
   provide.

   **The advantages in question are encapsulation and compartmentalization above all.** Data
   structures and state machines are not much concerned with either. That is what makes an
   ORM object an **exceptional** use of object-orientation — one accommodating **data
   manipulation** rather than **domain behavior**, and so an exception to object-orientation
   rather than an instance of it.

   **The exception frequently becomes the center of gravity.** On a model-view-controller
   (MVC) framework built around an ORM, its objects can become the nexus of an application's
   implementation and carry the weight of it. The construct least suited to
   object-orientation ends up holding the most of the system.

   **It says nothing about how the purpose is invoked.** An object with a single purpose may
   still expose more than one public method, and whether one actuator sets its act in motion
   is a separate claim that is not made here.

   *Stated 2026-08-04, its implication sharpened the same day — objects **are** operative
   objects rather than being implementable as them.*

---

Authored by Scott Bellware on Tue Aug 4 2026 at 11:29:06 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:41 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:32:33 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:36:23 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:43:50 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:10:39 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:20:28 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:40:08 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:42:34 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:44:47 PM PT
