# Family archive projects: what we learned

Lessons from two archives built with Claude Code: **christensen-ancestry** (Danish ancestry, July–September 2026, about 160 commits) and **gerechter-family-archive** (a Holocaust-era family and memorial site, 4–12 November 2026, about 120 commits). Every rule below comes from something that went wrong or something that worked. The incident behind each rule is given in one line, so you can judge whether it applies.

The two family sites are [gerechter-family.pages.dev](https://gerechter-family.pages.dev) and [christensen-ancestry.pages.dev](https://christensen-ancestry.pages.dev). Reusable procedures are skills; they are listed at the end.

---

## 1. Evidence

**Do**
- **Cite only what you have looked at.** A citation for a page nobody opened is the one unrecoverable failure, because it reads exactly like a real finding. *(Christensen, 29 Jul: an agent wrote a full marriage transcription with bsid and page for a record it never fetched. It retracted it, and the real answer was negative. `METHOD.md` §0.)*
- **Save the source file at the moment you read it.** That means the scan, PDF or page image, saved into the repo. If a site only lets you view it, take a full-resolution screenshot and say in the citation that it is a screenshot. *(Christensen, 24 Aug: three entries, two of them the session's biggest finds, were cited by URL only and had to be fetched again. Kyle: "incredibly wasteful".)*
- **Keep a full transcription of every document read**, in the original language, with `[?]` on uncertain readings. Add an English translation and a "Facts extracted" list. Do this even for pages that look irrelevant. A summary cannot be searched or reused, and faint scans are expensive to read twice. *(Gerechter, 11 Nov: general circulars were summarised, and Kyle asked for everything to be transcribed. All 363 documents were then transcribed, which made the later fact checks possible.)*
- **Grade every fact**, and keep the grade next to the fact:
  - **A**: original seen as an image.
  - **B**: database, catalogue, OCR or memorial book.
  - **C**: family tree, secondary source or inference.

  Also give a certainty word for each claim: proven, probable, family story or unknown. Label an inference as an inference. *(Christensen: the README called the foster parents unrelated, which was only an inference from silence. A "childbirth-adjacent" death was asserted where the register gives no cause.)*
- **A bounded negative is a result.** Write down what was read, the range, the method and the gaps ("a gap is not an absence"). Without that, the next session repeats the search.
- **Keep a dead-ends list for each research track.** It is the cheapest way to stop repeated searches.
- **When two sources disagree, write the reasoning down** next to the fact: which source wins and why. Otherwise a later "fix" flips it back. *(Gerechter, 9 Nov: "fix the timeline" moved a deportation to the Gestapo list date, and the films had to be changed back to 31 Aug.)*

**Don't**
- **Don't match people on name alone.** Check name plus birth date before moving a fact between people, or linking a name automatically. *(Christensen had at least three unrelated Karen Hansdatters. In Gerechter, a 1946 card about a different woman went out in Irma's file.)*
- **Don't build on one reading of a load-bearing name or date.** Check it against a second record before other searches depend on it. *(Christensen: an employer misread as "Brøchmann" instead of Brehmer spread through three branches and voided several searches. A clerk's error in a marriage record was taken as fact until the baptism was read.)*
- **Don't trust an empty search until a control query has passed.** *(Christensen: the census database returns zero for any query containing "ø", and some parishes are simply missing. A legal surname change in 1906 caused a five-year dead end. Sweep on birth date, not name.)*
- **Don't adopt an archivist's summary or a family tree as a record.** It is a lead (grade C) until the original is seen.

## 2. Records and memory across sessions

Long sessions are summarised, and summaries drop things. This caused more lost work than any research error.

**Do**
- **Keep two files from day one:**
  - **`STATUS.md`**: one page of what is open, in sections (the owner to do, decisions waiting, waiting on replies, drafts, research, site, housekeeping), then what is done.
  - **A working log** (`research/LOG.md`): newest first, recording each decision with the owner's words, every email sent or drafted with its Gmail id, deploys, pushes, background jobs, and a "Waiting on someone" table.
- **Write the log entry in the same turn as the event**, before the closing message.
- **Read STATUS and the top of the log at the start of every session and after every summary.**
- **Before drafting, ordering or downloading anything, search the log, the requests folder and the document index.** *(Gerechter, 12 Nov: the BLHA order drafted on 11 Nov was forgotten and drafted again. Kyle: "are we losing things in compaction?" Also: a file already held was nearly ordered again, "I'm pretty sure we had that already? we show it in the film".)*
- **Keep one file of standing rules.** In Gerechter, research rules are `research/BRIEF.md` and the site's rules are `site/style-guide.md`; in Christensen, research rules are `METHOD.md`. Decisions the owner made in conversation go into memory as one rule per file, with his words and the date.
- **Date the handoff files, or retire them.** *(Christensen: `HANDOFF.md` and `RESUME.md` stopped being updated in late July and still describe agents "in flight". A stale handoff is worse than none.)*
- **If something seems missing, the full transcripts are the backup.** They are the `.jsonl` files under `~/.claude/projects/<project>/`. The Gerechter log was rebuilt from them.

**Don't**
- **Don't treat the summary as complete.**
- **Don't let a finding stop at the research file.** It is done only when every place that shows it is updated. See §5.

## 3. Agents

**Do**
- **Build the brief from the archive files, not from memory**, and check what the files and the disk already hold before writing it. *(Christensen, one day: briefs carried a census book labelled as a death register, a couple who did not exist, a record class called "untouched" that was already closed, and work another branch had done. In Gerechter, a brief gave Armin the wrong birth year.)*
- **Tell agents to verify every coordinate they are handed** (book id, page, epid, archive reference). The agents that re-derived coordinates are the ones that caught the coordinator's errors.
- **Have agents write as they go**, after each record, to their own output file. *(Christensen: an agent that wrote as it went lost almost nothing when its stream stalled; one that saved only at the end lost a 60-call run. In Gerechter, ten readers stopped before writing anything.)*
- **Give each track one output file** with these sections: Findings (each marked verified or reported, with a source), Documents saved, Dead ends, New leads, and "Needs browser" for sites the agent could not reach.
- **Before stopping an agent, ask it for a handoff section**: coordinates resolved, images opened and what they showed, work in progress, beliefs not yet checked. A stopped agent cannot be resumed. A recovered transcript keeps the reasoning but loses the images, so its successor must re-read every scan. *(Christensen: `recovery/README.md`, `tools/recover-agent-transcript.py`. Kyle: "you should have told it to do a handoff doc.")*
- **Log every background job when it starts and when it ends.** *(Gerechter: "whats still running?")*
- **Choose the model per task:**
  - Sonnet for bulk transcription, with one or two pages spot-checked against the image.
  - Opus for routine research and lookups.
  - Fable for coordinating and for design.
- **Spot-check agent claims against the source.** *(Christensen: a newspaper agent reported five leads and three did not exist. The API had silently ignored the date limits.)*
- **Schedule a fresh-agent review before publishing.** *(Christensen: "a fresh agent to review your work this time please we've gotten sloppy". That review found a double-counted article, a wrong death year and conflated parishes. In Gerechter, the multi-agent film review found missing documents and player bugs.)*
- **Only the coordinator commits.** Each landed agent gets one commit whose message is a short report, including the coordinator's own errors.

**Don't**
- **Don't run many agents near a usage limit.** Five died at once in Christensen. Run them one at a time once the budget is tight.
- **Don't let an agent use the browser another session is driving.** Have it list those URLs under "Needs browser" instead.

## 4. Outreach: archives, family, anyone outside

**Do**
- **Decide the sending policy per project, write it in memory, and follow it to the letter.**
  - **Christensen:** draft only, and send nothing unless Kyle names that specific message.
  - **Gerechter:** free records enquiries may be drafted and sent from Kyle's Gmail, then reported. Anything that costs money, needs his ID, or goes to family or lawyers still needs his say.
- **Take each archive's address from its own website**, and record the URL and the date checked.
- **Ask only what exists and what copies cost.** That gets answers; in Gerechter the Stasi-archive archivist found two new records from one such letter.
- **Write in the archive's language, with English beneath.**
- **Keep the owner's postal address out of the repo.** Use `[NAME]` and `[ADRESSE]` placeholders and fill them only in the sent message.
- **Keep a send log** with Gmail ids, plus a "Not drafted, and why" list.
- **After sending, search for bounces** (mailer-daemon, undeliverable).
- **Transcribe every reply in full into a replies file**, and note "do not chase" where an archive asks for that.
- **Before filing a reply, check what the archive already says about its subject.** *(Gerechter, 13 Nov: a town office sent the first photograph of the family shop ever found. It was filed as a routine reply, because "no photo of the shop" lived only in the place file, which a summary had dropped. The owner caught it. STATUS now opens with a "Most wanted" list.)*
- **Ask the family early.** *(Christensen: 92 parishes were swept for a residence. Then one landing card from an aunt dated the crossing, and a cousin writing back was "the biggest advance in this project". `ACTIONS-FOR-THE-FAMILY.md` lists the things only a person can do.)*

**Don't**
- **Don't read a general "send" as permission for specific messages.** *(Christensen, 29 Aug: "fix what we have and send" meant push the site. Three emails went out under Kyle's name.)*
- **Never state what a living person is willing to do** unless the owner said it in those words. *(The same email told Pier 21 an aunt "is willing to talk about it". She had only agreed to share her documents.)*
- **Don't fill CAPTCHAs, payment or identity fields.** Script the form in headed playwright-cli, then hand the window over.

## 5. Corrections

**Do**
- **When a fact changes, grep the whole repo for the old value**, then update every place it appears:
  - the person page and the timeline;
  - the site data;
  - the portraits;
  - the film scripts and film notes;
  - every translation;
  - the changelog.

  *(Gerechter: the 11 Nov town-file findings, a midday attack and not a night one, and the release date, were planned but never carried into the films until 12 Nov. The films also said "eleven children" when there were ten.)*
- **Write films and portraits from the transcriptions, not from summaries.** Each film line should be traceable to a document.
- **Turn every flag an agent raises into a STATUS item.** Unchecked flags were lost in Gerechter.
- **Write correction commits as errata**: what was wrong, what it is now, and which record settles it. That made this review possible.
- **Keep a public changelog** for the family, marked Found, Ruled out or Corrected, including withdrawals.

## 6. Privacy

**Do**
- **Keep one policy for the repo and a separate one for anything published.**
  - **Research notes:** in both projects, living relatives may be traced and named.
  - **The site and films:** nothing about a living person without the owner's permission. Exceptions are specific, written down and enforced by the build (in Gerechter, a single birth line for one living relative, in all three languages).
- **Keep private material out of public source files.** A `private/` folder in the repo that is never built is fine. Build-time scrubbing is only a backstop. *(Gerechter: the scrubber's regexes cut sentences in half on the live site, so the private text was removed from the source instead.)*
- **Test the rendered output.** Check it for forbidden names and paths, and also for cut-off sentences (`site/tests/test_build.py`, `test_sandberg.py`).
- **Some matters live only in memory, never in the repo.** That covers sensitive family matters and speculation the owner shares in conversation. *(Christensen: background shared in conversation was written into the handoff file and the site data and had to be removed; speculation about a family question sat on person pages until a review caught it.)*
- **Keep the public prose about a person strictly factual**, with no admiring colour, when the family's feelings about that person are mixed.

## 7. The site

**Do**
- **Use one deploy entry point and write it down.**
  - **Gerechter:** `python site/build.py`, then deploy from `site/cloudflare/` only, which keeps the contact form.
  - **Christensen:** `npm run build` in `site/`, then commit `viewer/`. Pages serves the committed build, so pushing source alone changes nothing.
- **Verify a deploy by its served content**: the new asset hash in the HTML, and an image content-type on image URLs. *(Christensen: a catch-all rule returned 200 for missing images, `viewer/documents` was gitignored, and the dev server deleted the built bundle.)*
- **Look at the page before diagnosing a visual bug.** Take a screenshot, in a clean browser profile, at phone width too. *(Christensen: three visual bugs were misdiagnosed by measuring styles. Kyle: "consider using screenshots… instead of thinking we can magically see how its rendered?" In Gerechter, mobile layout came up again and again.)*
- **Run a structural verifier.** It should check that ids resolve, links are symmetric, every proven claim has a source, and every cited file exists (`christensen-ancestry/tools/verify-site-data.py`). Be clear about what it cannot check: whether a transcription is right.
- **Show a mockup round before building a design**, then build. *(Gerechter: the papers filters took about eight rounds in one evening when built directly. The timeline and filter mockups settled their designs quickly.)*
- **Deploy as soon as the build and tests pass** (Gerechter rule); ask only if something looks odd.
- **Keep prototypes off the deployed site**, and take down old preview URLs.

## 8. Films and creative work (Gerechter)

The full rulebook is `site/style-guide.md`, and every new journey is checked against it. What it took to get there:

- **Make prototypes first and wait for the owner's decision.** *(The plan-everything-at-once approach was rejected: "we need to try out different art styles". Drawn charcoal won. Low-poly 3D was rejected because it "feels like a game", ink wash as "not as powerful", and animation as "the frames were better".)*
- **Use one house-style reference image for every drawing.** Night scenes are darkened from the day drawings. Lettering on real objects is set as type over the image, never generated.
- **Never show perpetrators.** Use only sound, their documents and the aftermath, from the family's point of view.
- **Follow Kyle's pacing notes:**
  - start before 1933, on life as it was;
  - show the rise of Nazism step by step;
  - no total silence;
  - end on the family that went on;
  - no repeated shots;
  - give text time to be read.
- **Music:**
  - start from the Jewish music of the person's place and time;
  - silently drop anything the Nazis adopted;
  - one theme per person, everything else varied;
  - let each piece run at least 35 seconds;
  - generate several takes, and place only the one Kyle has heard and picked. Claude cannot hear audio, so it cannot judge takes. *(Hava Nagila went in unheard, and the 9 Nov cue changes were made without listening.)*
- **Log paid generation in `costs.csv`** and pause the paid Space after each run.
- **Centre the family, not the owner.** Kyle: "don't center me."

## 9. Working with the owner

- **Research needs no permission: do it, then report.** *(Kyle said it twice: "just gogooggo", and "ALWAYS research".)*
- **Lead every research update with a short "what's new" list** of facts, each with how sure we are, in a form that can be forwarded to family as it is. Process detail goes after it.
- **Short reactions become rules.** Lines like "too much plain piano", "that shaking is bad" or "ledger is better" go into memory or the style guide the same day, so they never have to be said twice.
- **Commit early and often** (Gerechter rule). Push only when asked, and never force-push.
- **Don't suggest asking people who have died.** Check what memory says about the family before suggesting anyone as a source.

## 10. Tools that worked

- **playwright-cli, headed**, for normal sites. Kyle can take over the visible window.
- **Claude in Chrome**, only for bot-walled or login sites (Geni, some newspaper archives). A form gate driven through the extension took 20 minutes.
- **Free APIs, which beat browsing:**
  - The Danish Arkivalieronline route (epid → bsid → contiguous image ids) dates an event in 2–4 fetches by binary search.
  - HTTP HEAD file sizes classify whole books before anything is downloaded.
  - Contact sheets find the section breaks.
  - All of this is in `christensen-ancestry/METHOD.md`.
- **Name indexes and catalogue sweeps first.** Search by subject, place, spelling variants and birth date, because catalogues index short descriptions (`research/sweeps/blha_catalogue_sweep.md`). *(Gerechter: "how did our research miss these".)*
- **For hard handwriting:** split each opening into halves, resize to about 1750 px, crop, autocontrast and upscale 2–4x.
- **Settle tool facts by experiment, and write the test into the doc.** *(Christensen: a note on how a website encoded its text was rewritten back and forth twice, until one record was looked up twice to settle it.)*

## 11. Structure that worked

| File | Role |
|---|---|
| `README.md` | Entry point, folder map, confidence grades, privacy note |
| `STATUS.md` | One page: open, then done |
| `research/LOG.md` | Working log, newest first |
| Method file (`METHOD.md` / `research/BRIEF.md`) | Hard rules, then recipes. Keep reference data (parish ids) in a data file, not prose |
| `timeline/timeline.md` | Date, place, person, event, grade, source on every row |
| `people/`, `places/` + `INDEX.md` | Hand-edited pages. Mark superseded generator scripts so nobody re-runs them |
| `documents/` + `INDEX.md`, `documents/transcriptions/` | Every copy with its archive reference, a transcription next to each scan |
| `research/<track>.md`, `branches/<slug>.md` | One file per track or line, written as records are read, with a short headline summary on top |
| `research/requests/` (+ `received/`) | Letters, send logs, replies |
| `ACTIONS-FOR-THE-FAMILY.md` | Leads only a person can follow |
| `sources/open-questions.md` | Conflicts and leads |
| `private/` | In the repo, never built |

Name tracks by topic slug plus date. *(Christensen's letters ran to AA–AZ, AS2 and AU3, and nobody could remember what they meant.)* Number generations from one stated root person.

## Skills

The procedures above, as Claude Code skills, are in this repo. See the [README](README.md) for what each one does and how to install them.

- [`skills/`](skills/): any archive project. `improve-archive-skills`, `archive-session`, `archive-request`, `transcribe-record`, `research-brief`, `fact-correction`, `publish-check`.
- [`project-skills/gerechter/`](project-skills/gerechter/): `film-music`, `journey-film`.
- [`project-skills/christensen/`](project-skills/christensen/): `read-danish-register`.

File paths in the guide (`METHOD.md`, `site/style-guide.md`, `research/LOG.md` and so on) are files in the two archives' own repositories, which are private.
