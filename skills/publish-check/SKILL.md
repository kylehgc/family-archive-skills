---
name: publish-check
description: Build, test, privacy-check, deploy and verify a family-archive website or film. Use for any deploy of a family site.
---

## Steps

1. **Build** with the project's one entry point (from memory or the README). Gerechter: `python site/build.py`, then deploy only from `site/cloudflare/`. Christensen: `npm run build` in `site/` and commit `viewer/`, because Pages serves the committed build.
2. **Run every test suite** the project has (for example `site/tests/`, `*.test.mjs`) and any structural verifier (ids resolve, links symmetric, every proven claim sourced, every cited file exists).
3. **Privacy-scan the rendered output**, not only the source:
   - no living person beyond the exceptions written in memory;
   - no private folders, research paths, legal or financial matters or speculation;
   - no prototypes;
   - no sentence cut short by a scrubber (look for clauses ending abruptly near filtered text).
   If a scrubber had to cut text, remove that text from the source file instead.
4. **Deploy** once all of that passes. Ask first only if something looks odd.
5. **Verify the served site**, not the status code: the new asset hash in the HTML, image URLs returning image content types, changed pages showing the change. Screenshot the changed pages at desktop and phone width in a clean browser profile, and look before diagnosing anything visual.
6. **Log** the deploy with URL and test counts.

Done when: tests pass, the privacy scan is clean, the served pages show the change, and the deploy is logged.
