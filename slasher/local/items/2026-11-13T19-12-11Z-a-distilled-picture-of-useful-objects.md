# A distilled picture of Useful Objects

- **State:** Recorded
- **Tags:** [note]

This note distills the four earlier notes — Useful Objects, Legacy Characteristics of a Useful Object, Characteristics of a Useful Object, and Notes — into one picture, so that a description of useful objects and a reference implementation can be built from it. It does not replace them, and it settles nothing. The characteristics the engineer stated and the claims the prior generation made are kept apart, as the earlier notes keep them.

## What the project is

- The next generation of Useful Objects. The prior generation, the `useful-objects` repository, stays as written.
- Two deliverables, which are one piece of work: the doctrine restated, in `README.md`, and a reference implementation under test, which the doctrine cites in place of inline code examples.
- The doctrine is published later at `object.new`, by a separate website project.

## The thesis

**The general point**, as `README.md` states it: when a system is shaped around its behavior, objects are in their natural environment.

**The premise:** an object is useful immediately upon instantiation, with no dependency left nil.

**The characteristics the engineer stated:**

1. An object can be used as soon as its initializer has run, and the initializer constructs or enables no operational dependency. The constructor is where operational dependencies come from.
2. An object has a single purpose. Objects are operative objects, which carry out an act. An object-relational mapping (ORM) object is the exception: a mix of data structure and state machine that models tabular rows, and methods attached to it do not change that.

**The prior generation's claims, not yet restated by the engineer.** They are the doctrine's subject matter, and the Notes note repeats several of them:

- A dependency defaults to an inert substitute, which is now a mimic.
- The initializer is primitive, and the constructor is complex. A class holds its own construction, and no dependency-injection container is used.
- A dependency's own class decides how it is constructed and assigned.
- Transparency is used rather than test doubles. Today it is carried by invocation recording, read through consonant predicates.
- All substitutes are equally real, in the Liskov sense of *is substitutable for* rather than *is a*.
- A single actuator, `call`, sets an object's act in motion, on the class and on the instance.
- Boilerplate that cannot be reduced is accepted rather than abstracted away.

## The mechanisms, as current practice uses them

- The libraries are `evt-dependency`, `evt-mimic`, `evt-record_invocation`, and `evt-subst_attr`. Eventide's Telemetry library is not used.
- A declared dependency defaults to a mimic of its class, and a mimic records its invocations by default.
- A `Substitute` module extends the mimic. A consonant predicate, such as `posted?`, is an ordinary method in that module.
- Whether a mimic should record only when it serves as a dependency's substitute is open in those libraries. The doctrine states it as open.

## The reference implementation

- **Domain:** an `Upload` and the `HTTPClient` it depends on, from the `dependencies-and-substitutes` demos, written fresh under test.
- **Built:** `Upload.new` arrives with a mimic HTTP client. `Upload#call` posts the file. `HTTPClient::Substitute#posted?` answers whether a file was posted. Two tests establish that the file was posted, and that other content was not.
- **Not yet demonstrated:** the constructor beside the initializer, such as `Upload.build`; the class actuator, `Upload.call`; and an operational `HTTPClient#post`, which is empty.
- **Deferred:** a record of the build that can be reproduced, for tutorials, demos, and articles.

## Open decisions

1. Whether to accept or decline the three candidate characteristics: substitutability, construction by the class interface, and a single actuator.
2. What becomes of the legacy list.
3. The doctrine's structure.
4. Which further objects the reference implementation holds.
5. One package or two, and whether versions carry a product generation segment.
6. Whether "entity" is renamed, and to what.

---

Authored by Scott Bellware on Fri Nov 13 2026 at 11:12:11 AM PT
