---
name: transcribe-record
description: Read a scanned or photographed historical document (register entry, letter, file, census sheet, card) into a full transcription with translation, extracted facts and confidence grades. Use whenever a document is read for family research, including batches handed to agents.
---

Every document read is kept as a full transcription, even pages that seem irrelevant: a summary cannot be searched or reused, and faint scans are expensive to read twice.

## Steps

1. **Save the source first** into the repo's document folder, named `YYYY-MM-DD_person-or-event_place_ref.jpg` (or by archive id). If the site only allows viewing, save a full-resolution screenshot and say so in the header. A URL alone is never the citation.
2. **Read it.** For handwriting, split an opening into halves and resize to about 1750 px; for a hard word, crop, autocontrast and upscale 2–4x. Write only what is on the page.
3. **Check identity:** name plus birth date (or age and place) against the person you think it is. Common names are never matched on name alone.
4. **Write** `documents/transcriptions/<name>.md`:
   - header: archive and reference, date of the document, language and script, path of the saved image, who read it and when;
   - transcription in the original language, line by line, `[?]` on uncertain readings, `[illegible]` where it is;
   - English translation (optional for pages with no family link);
   - **Facts extracted**: each with its grade (A original image seen; B database, catalogue, OCR; C tree, secondary, inference) and links to the person pages it touches;
   - anything that conflicts with what the archive already says, flagged.
5. **Index** it in `documents/INDEX.md`, and in the site catalogue if the project has one.
6. **Carry new or changed facts onward** with `fact-correction`. A finding left only in the transcription is not done.

Done when: image saved, every non-blank page transcribed, index row added, conflicts flagged.

## Batches

Brief readers with these steps. Run bulk transcription on Sonnet and spot-check one or two pages per batch against the image before trusting it. Readers save each page's transcription as they go.
