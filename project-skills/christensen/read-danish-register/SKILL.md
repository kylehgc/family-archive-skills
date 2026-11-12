---
name: read-danish-register
description: Find and read a Danish parish register, census or estate record (Arkivalieronline, Daisy, DDD) for the Christensen ancestry. Use when looking for a baptism, marriage, burial, census household or estate entry in Denmark.
---

The recipes are in `METHOD.md`. This skill gives the order of work and points to the section to read for each step. Read §0, §0a and §0b before anything else; they outrank every other rule.

## Steps

1. **Check what is already known.** Look in the branch file, `documents/` on disk and `QUEUE.md`. Verify every coordinate you were handed (epid, bsid, image id) before using it.
2. **Resolve the epid** with the fast path that needs no browser (§1, "Finding an epid WITHOUT a browser"). Use the browser flow only if that fails.
3. **Pick the book and narrow down to the section.**
   - Image ids within a book are contiguous, so binary-search on the date (§1 API).
   - Size pages with HTTP HEAD before downloading anything (§1d), and use contact sheets to find section breaks.
   - Know the register's structure: post-1892 and pre-1814 follow different rules (§1, Kirkebog structure).
4. **Census:** measure one full-resolution page first. There are two opslag per sheet, and barcode separator cards flip the parity. Sweep on birth date, not name, and check the bare-given-name and trade blocks (§1d).
5. **DDD:** use plain POSTs (§2). Run a control query before trusting a zero, because "ø" returns nothing and some parishes or years are not covered. Capture each record with `tools/capture-ddd-records.py`.
6. **Estate and other non-parish series:** use Daisy. Read the name indexes and wrapper sheets first, then apply the folio-to-opslag offset (§1c).
7. **Read and save.**
   - Download every scan into `documents/` at the moment you read it, named per §3.
   - Split the opening into halves at about 1750 px. For hard names, crop, autocontrast and upscale.
   - Check name against birth date: Karen Hansdatter and similar names repeat across branches.
8. **Write it down as you go** in the branch file, using the `transcribe-record` skill: transcription, translation, citation and grade. If the search comes up empty, record a bounded negative: what was read, the range and the gaps.

Done when: the scan is saved, the entry is written in the branch file, and the citation points only to pages actually opened.
