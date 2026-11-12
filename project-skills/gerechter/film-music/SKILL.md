---
name: film-music
description: Choose, generate, audition and place music for a Gerechter family journey film. Use when a film needs music, a cue changes, or Kyle comments on a film's sound.
---

This is a Jewish family's memorial. Music is chosen for the person, heard by Kyle, then placed. Claude cannot hear audio, so it never judges a take itself.

## Steps

1. **Start from the Jewish music the person would have known.** German-speaking Posen and Berlin Jews: synagogue music (Lewandowski, Baer) and old Ashkenazi tunes with notated sources. Others: Yiddish or Hebrew song from their place and time. At most a little general period colour. Take melodies from published notation, and note the edition.
2. **Screen every candidate for Nazi adoption before it is offered**: Hitler Youth and BDM songbooks, party, SA and Wehrmacht ceremony, and composers or performers the regime celebrated. Drop failures silently; do not ask Kyle to weigh them. Record what was dropped and why in the film's `*_MUSIC.md`, and tell him in one line what was dropped and what was kept.
3. **Plan variety.** One theme per person, returning at key moments such as the start and the end; every other chapter gets a different piece, voice or instrument. Count the chapters each bed covers: more than two or three, other than the theme, is too many. Kyle likes choral and sung beds. No total silence in the sad parts; use the low dread bed. No sound effects.
4. **Generate several takes** with `prototypes/_audio/gen.py`, or the film's render script in `prototypes/_audio/src/`. A paid GPU restart (the YuE2 Space) needs Kyle's OK each session; pause the Space after the run. Add every paid run to `prototypes/_audio/costs.csv`. Run the take checker (length against the score, silence, gaps, truncation).
5. **Audition.** Put the takes on `prototypes/_audio/<film>_listen.html` and hand Kyle the page. Log it under "Waiting on someone".
6. **Place only the take Kyle picked.** Record the pick in `<FILM>_MUSIC.md`. Beds hold at least 35 s (`MIN_HOLD` in `prototypes/_shared/sound.js`); never time a change to land a few lines into a chapter.
7. **Deploy** with `publish-check`, and log it.

Done when: every bed in the film is a take Kyle chose, the screening is recorded in the music notes, and no bed (other than the theme) covers more than three chapters.
