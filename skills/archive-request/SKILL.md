---
name: archive-request
description: Draft, send and log a request or enquiry to an archive, registry office, library or records body for a family-history project, and track the reply. Use when a lead needs a record ordered or an archive asked.
---

## Steps

1. **Check for an earlier draft or a copy already held.** Grep the working log, `research/requests/`, `documents/INDEX.md` and Gmail drafts for the archive, the reference and the person. Done when you can say "no earlier draft, not already held", or point to what exists.
2. **Check the project's sending policy in memory.** It differs per project: one lets free enquiries be sent from the owner's Gmail and reported afterwards; another is draft-only, where nothing goes out unless the owner names that specific message. Anything that costs money, needs his ID or signature, or goes to family or lawyers is always his call.
3. **Find the address on the archive's own website.** Record the URL and the date checked.
4. **Draft** in the archive's language with English beneath:
   - who the person is (name, birth date and place, death if known) and the archive reference if known;
   - ask only whether the record exists and what copies cost; order nothing paid;
   - `[NAME]` / `[ADRESSE]` placeholders in the repo copy, filled only in the sent message, from memory;
   - state nothing about what a living relative is willing to do unless the owner said it in those words.
5. **Save** the letter as a section of the batch file `research/requests/<yyyy-mm>_<topic>.md`, which has a summary table on top (archive, what, cost to ask, status) and a "Not drafted, and why" section.
6. **Send** only if step 2 allows it, and record the Gmail id in the file's send log. Otherwise hand the draft over and stop.
7. **Log** in the same turn: a log entry, a "Waiting on someone" row, a STATUS item under Waiting on replies.
8. **Later:** search for bounces (mailer-daemon, postmaster, undeliverable). Transcribe every reply in full into `<batch>-replies.md`; save forms to `requests/received/`; note "do not chase" where an archive asks for that; turn whatever a reply asks of the owner into a STATUS item.

Done when: the letter is saved, sent or handed over per policy, and recorded in the request file, the log and STATUS.

Model files (Gerechter): `research/requests/2026-11_free-requests.md`, `2026-11_trial-file-requests.md`, `2026-11_trial-file-replies.md`.
