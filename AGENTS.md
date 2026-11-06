You already have an AGENTS.md at the project root.

Appending the Waytide bootstrap will add a section that tells the agent,
at the start of every session, to read every rule file under waytide/system/ and waytide/local/rules/
(except each package's source/ directory and README.md),
and waytide/local/vocabulary.md, and follow
it. Those rules then OVERRIDE the agent's default behavior where they conflict
(your explicit instructions still win). Your existing AGENTS.md content is left
exactly as it is; the section is added at the end, after a blank line.

Exact text to be appended:
----------------------------------------------------------------------
## Waytide

This project's Waytide system and working conventions live under `waytide/`,
committed alongside the code and read at the start of each session.

**At the start of a session, read every rule file under `waytide/system/` and
`waytide/local/rules/`, except each package's `source/` directory and `README.md`,
and `waytide/local/vocabulary.md`, and follow them.**

`waytide/system/` holds the installed system packages —
`waytide/system/foundation/`, `waytide/system/language/`, and so on, including
each package's `vocabulary.md` glossary where it has one (its terms are binding and
can't be applied unread; not every package has one, and its absence is not a
defect). `waytide/local/rules/` holds this project's own local rules, and
`waytide/local/vocabulary.md` holds the terms and substitutions this project settles
for itself, which decide over every package's. That file may not exist, which is
ordinary and not a defect.
Read `waytide/system/foundation/` first; it defines the system. The rules
override default behavior where they conflict; explicit user instructions still win.

**The session-start notice is printed by the harness, not by you — do not print one.** A
`SessionStart` hook in the Slasher plugin, `.claude/skills/slasher/`, runs
`waytide/system/foundation/session-start.sh`, which reads the package directories
actually present and emits the `Waytide installed at … — N packages: …` notice, followed
by a line telling the engineer the rules load on the first prompt, or to type `/load` — the
command that asks for the read instruction the hook carries to be acted on now;
a status line keeps the system's presence on screen for the rest of the session, beside
the working directory, branch, and any uncommitted, untracked, or unpushed work.

`waytide/` holds exactly two directories, splitting what came from outside from what
is this project's own. `waytide/system/` is installed and never edited in place.
`waytide/local/` is everything this project writes: `rules/` and `vocabulary.md`
alongside the working state — `logs/` (holding `log/`, `loops/`, and
`work-sessions/`), `items/`, `implementations/`, and `migration/` — each worked with as
its convention describes, and only `rules/` and `vocabulary.md` read as binding at
session start.
----------------------------------------------------------------------

Not running interactively, so AGENTS.md was NOT modified.
Re-run this in a terminal to be prompted, or paste the section above yourself.
CLAUDE.md already imports AGENTS.md — left unchanged.
.claude/settings.json still runs the Waytide session-start notice or startup display.

The Slasher plugin, in .claude/skills/slasher/, now runs both, so with these entries in
place the notice prints twice. Remove from the 'hooks' object of your file yourself the
'SessionStart' entry that runs waytide/system/foundation/session-start.sh and the
'UserPromptSubmit' entry that runs waytide/system/foundation/startup-display.sh. Keep
'statusLine'. Remove 'hooks' itself if nothing is left in it.

WARNING: git is set to ignore .claude/settings.json or .claude/skills/slasher/.

The files are in place and work for you, but git will not commit them, so the
notice and the status line will not reach anyone else who checks this project out.

If your .gitignore excludes the whole .claude/ directory, a negation alone will
not rescue the files — git cannot re-include anything inside an excluded
directory. Replace the '.claude/' line with these three:

    .claude/*
    !.claude/settings.json
    !.claude/skills/

Or leave the ignore rule alone and commit the files explicitly:

    git add -f .claude/settings.json .claude/skills/slasher
