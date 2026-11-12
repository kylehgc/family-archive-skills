---
name: fact-correction
description: Carry a new, changed or corrected fact into every place a family archive shows it. Use when research changes a date, name, place or event, when an error is reported, or when merging an agent's findings.
---

A finding is done only when every place that shows it agrees. Films and portraits written from summaries drifted from the records.

## Steps

1. **Settle it.** Which record says what, which wins and why (grade, how close to the event). Write that reasoning next to the fact, in the person file or `sources/open-questions.md`, so a later pass does not flip it back. Done when the reasoning is written down.
2. **Grep the whole repo for the old value** in every form it may take: dates as `18 Jul`, `18.07.`, `1938-07-18`; names in every spelling; numbers as words ("eleven children").
3. **Update every hit**: person page, timeline, place page, site data (for example `site/data/timeline.json`), portraits, film scripts and notes (`journey.js`, `site/journeys/*.md`), every translation, and STATUS or ACTIONS items that relied on it. Done when the grep for the old value finds only text that discusses the correction itself.
4. **Changelog entry** for the family: Found, Ruled out or Corrected.
5. **Commit as errata:** what was wrong, what it is now, which record settles it.
6. **Rebuild and deploy** if the site changed (`publish-check`).
