# Useful Objects — Aspiration

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

- **useful object** — an object that can be **used**, meaning invoked, immediately after its
  initializer has run: no dependency uninitialized, and no nil reference error reachable
  through one. The definition carries a second clause the term's plain reading does not
  suggest — **the initializer constructs or enables no operational dependency**, whether or
  not that dependency could have side effects, though the side-effecting case is what makes
  it matter, external and input/output above all. Usefulness on arrival is not bought by
  standing the dependencies up. The **constructor** is where operational dependencies come
  from, and it is not constrained by this. See the Characteristics of a Useful Object design,
  characteristic 1.
- **substitute** — any object conforming to a dependency's interface and its semantics.
  There is no primary or secondary substitute and no real instance against a fake one; all
  substitutes are equally real, which is what makes the property substitutability rather
  than a testing convenience.
- **mimic** — an object generated from a subject class, carrying that class's interface,
  and the substitute a dependency is initialized to by default. It is what the prior
  generation's hand-constructed **null object substitute** became; the weak-against-strict
  distinction the prior doctrine drew is no longer the operative one, because a mimic takes
  its strictness from the interface it mimics.
- **consonant predicate** — a domain-meaningful predicate a substitute exposes on its public
  interface — `posted?(content)` — so that a substitute is read in the domain's terms rather
  than through the mechanical invocation record underneath it.
- **operative object** — an object that carries out an act. **Behavioral object** and
  **command object** are glosses for it: the first is the prior generation's word, the second
  the most widely recognized. *Operative* is the term used here, because a data structure can
  be said to have behavior while never operating on anything, and because *command* imports a
  pattern-catalog framing for what is the ordinary case rather than a pattern applied. Objects
  **are** operative objects; this is what an object in a system ordinarily is, not what one
  could be implemented as.
- **object-relational mapping (ORM) object** — the contrast that gives *operative object* its
  edge. It is a **mix of data structure and state machine**, and what it models is, typically,
  **tabular row storage** rather than object-oriented behavior. It is largely an **exception**
  to object-orientation rather than a rule of it, and does not fit without being force-fit.
  **Methods attached to one do not change this**: behavior hung on a thing that models a
  stored row does not make it an object that carries out an act. The **state-machine** aspect
  takes more than one form — persistence lifecycle, attribute change tracking — and each form
  is itself the less object-oriented part. What it accommodates is **data manipulation**
  rather than **domain behavior**. Its standing is worth stating precisely: it is the
  exception in object-orientation, and it can at the same time become the **nexus** of an
  application built on a model-view-controller (MVC) framework around an ORM, carrying the
  weight of the implementation — the construct least suited to object-orientation holding the
  most of the system.
- **encapsulation** and **compartmentalization** — the two advantages of object-orientation
  the ORM contrast turns on. Data structures and state machines are not much concerned with
  either, which is what makes an ORM object an exceptional use of object-orientation rather
  than an instance of it. Their full statement belongs to the doctrine; they are named here
  because the argument leans on them.
- **actuator** — the single method that sets an object's one act in motion, implemented as
  `call`. A class carries one as well as an instance, paralleling the initializer and the
  constructor. **It is a separate claim from an object having a single purpose**, and the
  characteristics deliberately do not fold it in.
- **configuration** — the assignment of collaborator dependencies to the objects that
  depend on them, in the sense the actor model uses. Not settings or preference data.
- **transparency** — an object's provision for insight into its own execution. Transparency
  is of the design and is *used by* tests; it is not of tests. The position holds; what
  carries it has changed, from telemetry sinks to invocation recording.
- **telemetry** — an object's self-reported execution data, in the general sense the prior
  doctrine uses. The term is **kept general and is not the name of a library**: this
  generation does not use Eventide's Telemetry library, and the word does not refer to it
  here. Telemetry is the data; transparency is the design quality that provides for it;
  invocation recording is the mechanism that carries it.
- **product generation** — the leading segment of a four-segment version, a
  product-management declaration that a new product line has begun (see the `versioning`
  package's vocabulary). The developer's phrase *next generation* is a declaration of
  exactly this kind. Whether this project carries the segment in its versions is a separate
  declaration and is open below.

## What has evolved since the prior generation

The prior doctrine's mechanisms are not the current ones. Current practice is demonstrated
in the `dependencies-and-substitutes` repository, whose numbered demos are the reference the
restatement follows. Two areas have moved, and they are the two the prior doctrine spends
the most prose on.

### Substitutes

- **A dependency's default substitute is a mimic**, generated from the subject class, rather
  than a null object constructed for the purpose. Declaring a dependency against a class
  yields an object carrying that class's interface, and an invocation the subject does not
  define raises rather than being absorbed. Strictness comes from mimicking a real
  interface, so the weak-against-strict null object distinction is no longer operative.
- **A `Substitute` module specializes the mimic rather than subclassing the subject.** The
  prior doctrine wrote a substitute as a subclass overriding methods to feign their side
  effects. The current form is a module whose methods are added to the generated mimic.
- **That module serves more than one purpose, and the purposes are not yet named.** One form
  supplies a constructor deciding what the substitute is; another supplies methods extended
  into the mimic. The demos' own notes carry the naming — constructors against extensions —
  as outstanding work.

### Telemetry

- **Eventide's Telemetry library is not used**, and this generation takes no dependency on
  it. The demos do not reach for it, and the transparency the prior doctrine argued for is
  carried without it.
- **Invocation recording replaces the telemetry sink** for observing a substitute. Where the
  prior doctrine registered a sink and asked it what it had recorded, a substitute is now
  interrogated directly.
- **Mimics record by default.** Recording was formerly activated explicitly, and the demos
  that activate it predate the change. It is now held that a mimic is always a recording
  object.
- **The consonant predicate is the current idiom**, so that the mechanical invocation record
  is not what a substitute's users read.
- **The predicate macro is obsolete.** The recorder's predicate mixin and its declaration
  are retired; a consonant predicate is written as an ordinary method.

**One question here is open, and the restatement should not present it as settled.** Because
a mimic records by default and already carries the invocation predicate, a `Substitute`
module's inclusion of the recording mixin and its recorded method definition can both be
removed with no change in behavior — and a specialized body written there never executes,
since the method is not implemented on the substitute. The effect is that the invocation
predicate appears to come from nowhere. Whether a mimic should record only when serving as a
dependency's substitute is under consideration in the mimic and dependency libraries' own
issues. The demos carrying this were uncommitted working changes when this was read on
2026-08-04.

## The doctrine, restated

The doctrine is rewritten from the premise rather than reorganized from the prior text.

**The claims it argues are enumerated separately**, in two documents that hold the lists
apart from the prose that argues them. The **Characteristics of a Useful Object** design
holds this generation's statement, and a characteristic enters it only when the developer
states it. The **Legacy Characteristics of a Useful Object** design holds the prior
generation's list, carried forward as source material and revised only where a settled
decision requires. The doctrine points at them rather than restating either.

The positions the prior generation argues, and which the restatement inherits as its subject
matter:

- Dependencies default to safe, inert substitutes, so the initializer leaves nothing nil.
- The **initializer is primitive** — it captures exactly the data the object depends on
  directly, and does nothing else. The **constructor is complex** — it destructures richer
  inputs and configures operational dependencies. Robustness lives on the class interface.
- A dependency's own class decides how it is constructed and assigned, told rather than
  asked.
- Objects are **operative** first and data second, so an object's single act needs no
  ceremony in its name. The prior doctrine argues this as objects being *behavioral*, which
  is now a gloss for the term this generation uses.
- Transparency rather than test doubles. A design that needs a mock is a design not
  accounting for a use it is already engaged in. The prior doctrine argues this through
  telemetry sinks; the restatement argues it through invocation recording.
- Irreducible boilerplate is accepted rather than abstracted away, because the abstraction
  that removes it costs more than the tedium does.

What the restatement changes about how these are argued is not settled here.

## The reference implementation

Objects built to the doctrine, exercised by a test suite, which the doctrine cites in place
of inline code blocks. What it demonstrates is fixed by what the doctrine claims: a
dependency defaulting to a mimic substitute, the primitive initializer beside the complex
constructor, the class and instance actuators, a specialized substitute, and a consonant
predicate over a recorded invocation.

The mechanisms these rest on already exist as their own libraries. The set the current
practice draws on is `evt-dependency`, `evt-mimic`, `evt-record_invocation`, and
`evt-subst_attr`, beside the supporting `evt-attribute`, `evt-invocation`, and
`evt-reflect` — not the prior doctrine's set, which named a telemetry and a configuration
library the demos do not use. This repository **uses** these and is not their home; see Out
of Scope.

## Settled

- **2026-08-04** — The premise: an object must be useful immediately upon instantiation,
  with no dependency uninitialized.
- **2026-08-04** — This repository holds **two** deliverables, the doctrine restated and a
  new reference implementation, and they are one piece of work.
- **2026-08-04** — This is the **next generation** of Useful Objects. The prior generation
  in the `useful-objects` repository is left as written and is not edited in place.
- **2026-08-04** — The doctrine's demonstration moves out of its prose and into an
  implementation that is run and protected by tests.
- **2026-08-04** — The restatement follows **current practice**, demonstrated in the
  `dependencies-and-substitutes` repository, rather than the mechanisms the prior generation
  describes. Substitutes and telemetry are the two areas that moved.
- **2026-08-04** — This generation **avoids Eventide's Telemetry library**. Transparency is
  carried by invocation recording instead, and no dependency is taken on that library.
- **2026-08-04** — The word **telemetry is kept general** — an object's self-reported
  execution data, as the prior doctrine uses it — and is not the name of a library here. The
  doctrine's existing argument carries over with its vocabulary intact; what changed is the
  mechanism beneath it.
- **2026-08-04** — A companion project, `useful-objects-website`, is **external** to this
  repository. It is built with Hugo and the Hextra theme, and its content references this
  project. It does not exist yet, and is created once this project has more clarity.

## Out of Scope / Deferred

- **The mechanisms themselves.** The dependency, mimic, invocation-recording, and
  substitute-attribute libraries are their own. This repository depends on them and does not
  re-implement or absorb them. This boundary follows from the premise: the deliverables are
  the argument and its demonstration, not the machinery either one uses.
- **Eventide's Telemetry library.** It is not used and not depended on, and the doctrine
  does not argue against it — it is simply not the mechanism this generation reaches for.
  Where the prior doctrine demonstrated transparency through a sink, the restatement
  demonstrates it through invocation recording.
- **Resolving the recording-by-default question.** Whether a mimic should record only when
  serving as a dependency's substitute is being worked in those libraries, not here. What
  falls to this project is stating the practice honestly, including that the question is
  open.
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
Changed by Scott Bellware on Tue Aug 4 2026 at 11:17:16 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:21:08 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:23:43 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:26:52 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:30:41 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:32:33 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 11:36:23 AM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:20:28 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:40:08 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:42:34 PM PT
Changed by Scott Bellware on Tue Aug 4 2026 at 10:44:47 PM PT
Changed by Scott Bellware on Wed Aug 5 2026 at 12:32:03 AM PT
