---
name: archive-session
description: Start, log and hand off work in a family-archive or genealogy project. Use at the start of a session or after a context summary, whenever a decision, email, deploy or background job happens, and before ending or stopping work.
---

Summaries drop things. In a family archive the record of what was decided, sent and pending lives in files, not in the conversation. Treat the summary as incomplete.

## At the start, and after every summary

1. Read `STATUS.md` and the top of the working log (`research/LOG.md`, or the project's equivalent such as `RESEARCH-LOG.md`, `QUEUE.md`, `HANDOFF.md`). Note any handoff file's date: a stale one describes agents and plans that no longer exist.
2. Read the project's method or rules file (`METHOD.md`, `research/BRIEF.md`, `site/style-guide.md`) if the task touches that area.
3. List background jobs still running and what each is writing.
4. If the project has no STATUS or log, propose creating them (shape below) before other work.

Done when: you can say, from the files, what is waiting on whom and what was last decided.

## As things happen (same turn, before the closing message)

Append to the log, newest first:
- every decision of the owner's, in his own words, with the date;
- every email sent or drafted, with its Gmail id;
- every request now waiting on a reply (and a row in "Waiting on someone");
- every deploy and push, with URL and test counts;
- every background job started, and how it ended;
- every mistake caught, plainly, as a "Mistake" entry.

Move the matching STATUS items between Open and Done. Route private matters to their own log (for example `private/<topic>/LOG.md`, never built into the site). The owner's postal address goes in no repo file.

Before drafting, ordering or downloading anything, grep the log, the requests folder and `documents/INDEX.md` for an earlier draft or a copy already held.

## At the end, or before stopping

1. Every agent still running either finishes or writes a handoff section first (see `research-brief`).
2. STATUS.md current; a log entry for the session; every flag an agent raised is a STATUS item.
3. Commit if the project's rule allows it.
4. Lead the reply with a short "what's new" list of facts, each with how sure we are, forwardable to family as is; process detail after.

## STATUS.md shape

`# OPEN`: 1. Owner to do; 2. Decisions waiting; 3. Waiting on replies; 4. Drafts; 5. Research to do; 6. Site and films to do; 7. Housekeeping. `# DONE`: by area.

If something seems lost, the full transcripts are the `.jsonl` files in `~/.claude/projects/<project-dir>/`.
