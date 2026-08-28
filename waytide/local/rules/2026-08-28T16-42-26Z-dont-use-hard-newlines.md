# Don't use hard newlines

Prose written into a file is not hard-wrapped. A paragraph is one line, however long it runs, and the newline is what ends the paragraph rather than what ends a display line. Wrapping is the reader's editor's job, not the writer's.

This reaches every file this project writes — an idea, a rule, an implementation record, a log entry, a README, and any other prose. It reaches the prose. A list item, a table row, a heading, and a fenced code block are each unaffected, since none of them is a wrapped paragraph.

**It does not reach a commit message body.** The `git` package's commit-message-widths rule wraps a body at 72 characters, because `git log` indents a body by four spaces and 80 columns is the target. That budget is about a display nobody controls from the file, so the reason this rule rests on does not reach it. The subject's 50-character cap is likewise unaffected.

**The installed packages under `waytide/system/` are hard-wrapped and are not conformed.** They are installed content, never edited in place, and a refresh would restore the wrapping anyway.

**Existing prose already written is not swept.** This rule governs what is written from now on. Conforming a record that already exists is a separate instruction, asked for separately.

**Why:** a hard-wrapped paragraph is a display decision frozen into the file, and it is frozen at whatever width the writer's terminal happened to be. Every later reader gets that width whether it suits them or not, and a narrow window then double-wraps while a wide one leaves the text in a column. A one-line paragraph reflows to whatever is reading it.

It also costs on every edit. Changing a word mid-paragraph rewraps the lines below it, so a diff of a one-word change shows the whole paragraph as altered, and what actually changed is buried.

**How to apply:** write each paragraph as a single line. Do not break a line to reach a column. Do not rewrap a paragraph you edit. Keep wrapping in a commit message body at 72, and leave the installed packages and already-written prose as they are.

---

Authored by Scott Bellware on Fri Aug 28 2026 at 9:42:26 AM PT
