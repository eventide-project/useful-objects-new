# Useful Objects — Design

## Premise

An object must be **useful immediately upon instantiation**. No dependency of an object is
ever left uninitialized, so no use of a dependency raises a nil reference error. An object
that cannot be actuated the moment it is constructed is not useful.

This repository is the **next generation** of Useful Objects, and it carries two
deliverables that rest on that one premise:

- **The doctrine, restated** — the argument itself, rewritten rather than revised in place.
- **A new reference implementation** — objects built to the doctrine, worked and tested,
  which the doctrine points at instead of carrying its demonstration in prose.

The two are one piece of work. The doctrine states what makes an object useful; the
reference implementation is the doctrine held to its word, and each is read against the
other.

## Background & Motivation

The prior generation lives in the `useful-objects` repository. It is a single 25 KB
`README.md` — *The Doctrine of Useful Objects* — beside a small illustrative example under
`lib/useful_objects/`, and its gem specification describes it as an example. Its last
substantive change was in June 2024.

Two things prompt a new generation rather than an edit.

**The argument and its demonstration are in the same file.** The doctrine's examples are
code blocks inside the prose, so nothing runs them and nothing protects them. They drift
from the mechanisms they illustrate, and a reader has no worked object to read — only
excerpts arranged to make a point. Separating the two lets the demonstration be exercised.

**The prior generation is a record.** It states what was argued when it was written, and
rewriting the argument in place would leave no trace of what changed between the two
readings. Writing the next generation here keeps both legible.

## Vocabulary

The terms the doctrine relies on, each of which has an ordinary meaning that misleads:

- **useful object** — an object usable the moment it is initialized, no dependency
  uninitialized, no nil reference error reachable through a dependency.
- **substitute** — any object conforming to a dependency's interface and its semantics.
  There is no primary or secondary substitute and no real instance against a fake one; all
  substitutes are equally real, which is what makes the property substitutability rather
  than a testing convenience.
- **null object substitute** — the most basic safe and inert substitute, and the default a
  dependency is initialized to. **Weak** where it responds to any invocation sent to it;
  **strict** where it conforms to a specific interface and refuses the rest.
- **actuator** — the single method that sets an object's one act in motion, implemented as
  `call`. A class carries one as well as an instance, paralleling the initializer and the
  constructor.
- **configuration** — the assignment of collaborator dependencies to the objects that
  depend on them, in the sense the actor model uses. Not settings or preference data.
- **transparency** — an object's provision for insight into its own execution, carried by
  telemetry. Transparency is of the design and is *used by* tests; it is not of tests.
- **product generation** — the leading segment of a four-segment version, a
  product-management declaration that a new product line has begun (see the `versioning`
  package's vocabulary). The developer's phrase *next generation* is a declaration of
  exactly this kind. Whether this project carries the segment in its versions is a separate
  declaration and is open below.

## The doctrine, restated

The doctrine is rewritten from the premise rather than reorganized from the prior text. The
positions the prior generation argues, and which the restatement inherits as its subject
matter:

- Dependencies default to safe, inert substitutes, so the initializer leaves nothing nil.
- The **initializer is primitive** — it captures exactly the data the object depends on
  directly, and does nothing else. The **constructor is complex** — it destructures richer
  inputs and configures operational dependencies. Robustness lives on the class interface.
- A dependency's own class decides how it is constructed and assigned, told rather than
  asked.
- Objects are behavioral first and data second, so an object's single act needs no
  ceremony in its name.
- Telemetry rather than test doubles. A design that needs a mock is a design not
  accounting for a use it is already engaged in.
- Irreducible boilerplate is accepted rather than abstracted away, because the abstraction
  that removes it costs more than the tedium does.

What the restatement changes about how these are argued is not settled here.

## The reference implementation

Objects built to the doctrine, exercised by a test suite, which the doctrine cites in place
of inline code blocks. What it demonstrates is fixed by what the doctrine claims: a
dependency defaulting to a null object substitute, the primitive initializer beside the
complex constructor, the class and instance actuators, a concrete substitute, and telemetry
registration against a sink.

The mechanisms these rest on already exist as their own libraries — `evt-dependency`,
`evt-initializer`, `evt-telemetry`, `evt-configure`. This repository **uses** them and is
not their home; see Out of Scope.

## Settled

- **2026-08-04** — The premise: an object must be useful immediately upon instantiation,
  with no dependency uninitialized.
- **2026-08-04** — This repository holds **two** deliverables, the doctrine restated and a
  new reference implementation, and they are one piece of work.
- **2026-08-04** — This is the **next generation** of Useful Objects. The prior generation
  in the `useful-objects` repository is left as written and is not edited in place.
- **2026-08-04** — The doctrine's demonstration moves out of its prose and into an
  implementation that is run and protected by tests.
- **2026-08-04** — A companion project, `useful-objects-website`, is **external** to this
  repository. It is built with Hugo and the Hextra theme, and its content references this
  project. It does not exist yet, and is created once this project has more clarity.

## Out of Scope / Deferred

- **The mechanisms themselves.** The dependency, initializer, telemetry, and configuration
  macros are separate libraries. This repository depends on them and does not re-implement
  or absorb them. This boundary follows from the premise: the deliverables are the argument
  and its demonstration, not the machinery either one uses.
- **Editing the prior generation.** The `useful-objects` repository is a historical record
  and stays as written.
- **The companion website.** `useful-objects-website` is its own repository, and its
  content, its Hugo and Hextra build, and its hosting are not this repository's concerns.
  What this project owes it is the material its content will reference — the doctrine and
  the reference implementation — which is what this design is about either way. The
  direction of the reference is one way: the website names this project, and this project
  does not arrange itself around the website.

Open, and to be settled as the work reaches them:

- Whether the doctrine and the reference implementation ship as one package or two, and the
  package name or names.
- Whether this project's versions carry a leading **product generation** segment, which is a
  declaration to be made on its own occasion rather than derived from this design.
- Which objects the reference implementation holds, and whether any of the prior
  generation's example carries over.
- The doctrine's own structure, and what it revises rather than inherits from the prior
  generation.

---

Authored by Scott Bellware on Tue Aug 4 2026 at 11:09:17 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:11:50 AM PT
