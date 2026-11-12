---
name: improve-archive-skills
description: Turn a lesson from family-archive work into an improvement to the archive skills and guide. Use when the owner corrects how something was done, a mistake is caught, a skill's step proved wrong or missing, a new procedure worked well, or at the end of an archive session.
---

Every correction is a **lesson**. A lesson is learned once it changes the procedure, so the next run follows it without being told. The source of truth is the skills repo at `C:/Users/kyleh/projects/family-archive-skills` (public, MIT). Every other copy is synced from it.

## Steps

1. **Write the lesson in two sentences:** what happened, then the rule that prevents it, stated as what to do. Done when the rule could be checked against a future run.
2. **Pick its home.** Each lesson goes in exactly one place:
   - **A skill in `skills/`**, if it changes a procedure any archive project follows.
   - **A skill in `project-skills/<project>/`**, if it changes a procedure only one project follows.
   - **The project's method or style file** (`METHOD.md`, `site/style-guide.md`) for project facts, recipes and aesthetic rules.
   - **Memory**, for the owner's preferences and anything private.
   - **A new skill**, only if no existing skill covers the procedure and it will recur.
3. **Edit the skill.** Read `~/.claude/skills/writing-great-skills/SKILL.md` first. Then:
   - Put the rule at the step where it applies, not in a list of warnings.
   - Phrase it as the behaviour you want.
   - Tighten that step's "Done when" line if the lesson came from stopping too early.
   - Take out whatever the new rule replaces, so the skill does not grow by sediment. Each meaning lives in one place.
4. **Add it to `GUIDE.md`**, under the right section, as a Do or Don't with the incident in one line.
5. **Make it safe for a public repo.** Remove:
   - names of living people;
   - addresses, emails and phone numbers;
   - legal, claims and money matters;
   - sensitive family matters and speculation;
   - commit ids from private repos.

   Describe the incident generically when its details are private. Done when a grep for those turns up nothing new.
6. **Sync** with `bash C:/Users/kyleh/projects/family-archive-skills/sync.sh`. It copies the skills into `~/.claude/skills/` and into each archive repo's `.claude/skills/`.
7. **Commit.**
   - In the skills repo, use a message that names the lesson.
   - In each archive repo the sync touched, follow that repo's own commit rule.
   - Push only when the owner has said to.
8. **Log it** in the project's working log, giving the lesson, the skill changed and the commit.

Done when: the rule is in one skill or file, the guide has the lesson, the public text is clean, the copies are synced, and it is committed and logged.
