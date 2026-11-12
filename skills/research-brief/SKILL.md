---
name: research-brief
description: Brief, check, stop and recover research subagents in a family-history project. Use before spawning a research or reading agent, when one reports back, and before stopping one.
---

Most agent errors start in the coordinator's brief: wrong coordinates, wrong dates, work already done. Build it from the files.

## Writing the brief

1. **Check what exists:** the track's research or branch file, `documents/` on disk, the dead-ends lists, the log. Done when you can name what is already known and what is already ruled out.
2. **Take every fact in the brief from the archive files** (birth years, references, book ids), and mark any you have not checked.
3. The brief contains:
   - **Read first:** the method or rules file, the relevant person and branch files.
   - **Known:** facts with their source and grade.
   - **Warnings:** traps for this track (same-name people, register gaps, search engines that silently drop characters or filters).
   - **Tasks, in order.**
   - **Output:** one file, `research/<topic-slug>.md`, with Findings (each verified or reported, with source), Documents saved, Dead ends, New leads, Needs browser (exact URL and what to look for).
   - **Rules:** verify every coordinate handed to you before using it; save every source image as you read it; cite only pages you have opened; write to the output file after each record; a bounded negative (what was read, range, gaps) is a result; no commits, accounts, forms that send, or CAPTCHAs; stay out of a browser another session is driving.
   - **Model:** Sonnet for bulk transcription, Opus for routine research; the top model only for coordinating and design.
4. Log the job as started.

## When an agent reports

- Spot-check its key claims against the source: open one or two records yourself, and check whether an API ignored a filter.
- Make every flag it raises a STATUS item; merge findings with `fact-correction`.
- Commit once per landed agent, with a message that is a short report, including any error of yours it caught.
- Log the job as ended.

## Stopping an agent

A stopped agent cannot be resumed. First message it: "Write a handoff section now: coordinates resolved, images opened and what each showed, work in progress, beliefs not yet verified." Then stop it. If it died without one, recover its transcript (Christensen: `tools/recover-agent-transcript.py`) and brief the successor to treat everything recovered as leads and re-read every scan.

## Before publishing

Run a fresh-agent review that has not seen your reasoning: re-open each cited scan, compare it with the stored text, give one verdict per source (confirmed, minor, overstated, wrong, unreadable), direct line first. It reports; it does not fix. Model: `christensen-ancestry/branches/AUDIT-evidence.md`.
