---
name: journey-film
description: Build or revise a Gerechter memorial journey film (outline, drawings, script, music, translations, site wiring). Use when starting a new person's film or reworking an existing one.
---

The rulebook is `site/style-guide.md`. Read it first; this skill is the order of work.

## Steps

1. **Outline** in `site/journeys/<name>.md`. Every stop names its document, taken from `documents/transcriptions/`, not from summaries or person-page prose. Check the outline against Kyle's film notes:
   - open on life before 1933;
   - show the rise of Nazism step by step;
   - end on the family that went on;
   - no repeated shots;
   - put the calendar before the next picture.

   Done when every line has a source.
2. **Pictures.** List them (model: `research/wilhelm-film/pictures.md`). Use real period photographs and documents wherever they exist; drawings fill the gaps. Each drawing prompt carries:
   - the house-style reference, `prototypes/_img/p3_beat1_ordinary_day.png`;
   - the hard rules: no perpetrators (only sound, their documents and the aftermath), faces in shadow or turned away, nothing game-like.

   Night scenes are darkened from the day drawings. Lettering on real objects is set as type over the image, never generated. Representative places are fine; put their true sources in the credits, not on screen. A real photo used on screen or sent to the image model as a reference must be cleared first (public domain, a free licence, or the holder's permission): the rules are under Pictures in the style guide.
3. **Script** in `prototypes/<name>/journey.js`: present tense, still frames changed by cut, dissolve or fade, no camera moves. Reading pace follows the style guide.
4. **Music** with the `film-music` skill.
5. **Wire it in.** Add the film to `FILM_PAGES` in `site/build.py`; its assets are served under `/media/`, never `/prototypes/`. Translate it to German and Hebrew (`site/tools/journey_i18n.mjs`), and keep living-person exceptions identical across all three languages.
6. **Cross-film fact check.** Every date, count and name shared with other films and portraits must agree. Use `fact-correction` for any difference.
7. **Review.** Run a fresh-agent review of the film against the style guide and the transcriptions, then show Kyle.
8. **Deploy** with `publish-check`, and log it.
