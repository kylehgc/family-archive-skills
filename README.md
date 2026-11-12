# Family archive skills

These are skills and working notes for building a family-history archive with [Claude Code](https://claude.com/claude-code). They come from two family projects, built in 2026 by Kyle Christensen working with Claude:

| Project | Site | What it is |
|---|---|---|
| **Gerechter** | [gerechter-family.pages.dev](https://gerechter-family.pages.dev) | A memorial for a German-Jewish family murdered in the Holocaust. It holds transcribed archive documents, a timeline, person pages, and short drawn films in English, German and Hebrew. [Write-up](projects/gerechter.md) |
| **Christensen** | [christensen-ancestry.pages.dev](https://christensen-ancestry.pages.dev) | A Danish family line traced back through parish registers, censuses and estate records, with every claim sourced to a saved scan. [Write-up](projects/christensen.md) |

Both projects made plenty of mistakes. **[GUIDE.md](GUIDE.md)** collects the lessons as dos and don'ts, each with the incident it came from. The skills turn the procedures that worked into steps an agent follows the same way every time.

## The skills

**For any archive project** ([`skills/`](skills/)):

| Skill | What it does |
|---|---|
| [`archive-session`](skills/archive-session/SKILL.md) | Starts a session from STATUS.md and the working log, logs decisions, mail, deploys and jobs as they happen, and hands off at the end. Long sessions get summarised, and summaries lose things. |
| [`archive-request`](skills/archive-request/SKILL.md) | Drafts a records request to an archive, sends it (if the project allows sending) and logs it: check for an earlier draft, take the address from the archive's own site, ask only what exists and what it costs, then track the reply. |
| [`transcribe-record`](skills/transcribe-record/SKILL.md) | Turns a scanned document into a full transcription, translation and graded facts, with the image saved first. |
| [`research-brief`](skills/research-brief/SKILL.md) | Briefs research subagents from the files rather than from memory, checks what they report, stops and recovers them safely, and runs a fresh review before publishing. |
| [`fact-correction`](skills/fact-correction/SKILL.md) | Carries a changed fact into every page, film, translation and changelog that shows it. |
| [`publish-check`](skills/publish-check/SKILL.md) | Builds, tests and privacy-scans the rendered site, deploys it, and checks what is actually being served. |

**Project-specific** ([`project-skills/`](project-skills/)), useful as models for your own:

- [`gerechter/film-music`](project-skills/gerechter/film-music/SKILL.md): chooses, auditions and places music for a memorial film. Music starts from Jewish music of the person's place and time, and anything the Nazis adopted is screened out. Nothing goes into a film until a person has listened to it.
- [`gerechter/journey-film`](project-skills/gerechter/journey-film/SKILL.md): the order of work for one person's film, from a sourced outline through drawings, script, translation and review.
- [`christensen/read-danish-register`](project-skills/christensen/read-danish-register/SKILL.md): finding and reading Danish parish, census and estate records through the Rigsarkivet and DDD services.

## Installing

Copy a skill folder into `~/.claude/skills/` to use it in every project, or into a project's `.claude/skills/` to use it in that project only:

```bash
git clone https://github.com/kylehgc/family-archive-skills
```

```bash
cp -r family-archive-skills/skills/* ~/.claude/skills/
```

The skills point to file names used in these two archives: `STATUS.md`, `research/LOG.md`, `documents/transcriptions/`, `METHOD.md`. Rename them to match your own layout. The archives' repositories are private, so those paths are examples only.
