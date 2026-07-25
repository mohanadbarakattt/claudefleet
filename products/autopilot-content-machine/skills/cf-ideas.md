---
description: Research and triage short-form content angles into the IDEA stage of the ClaudeFleet content pipeline. Use at the start of a content cycle, when the IDEA column is empty, or when the operator asks for new hooks or angles for a niche or offer.
argument-hint: "[offer-slug] [count, default 10]"
---

# /cf-ideas — fill the IDEA stage

**Preconditions.** `$CLAUDEFLEET_HOME` (default `~/claudefleet`) contains `pipeline.json`
with `"machine": "content"` and `stages` `["Idea","Script","Render","Assemble","Scheduled"]`.
An intake note exists at `content-machine/notes/<offer-slug>-intake.md`. If it does not,
stop and ask the operator these six questions, write their answers to that file, then
continue — who the offer is for, what it sells, what proof the operator personally owns
(their own results, their own client work, their own screenshots), which claims are
forbidden (legal, medical, financial, employer policy), which platforms, and what has
already been posted. Never answer these yourself.

**Steps.**

1. Read `pipeline.json`. If any cards already sit at stage 0, list their titles to the
   operator and ask whether to add to them or work the existing queue instead.
2. Collect the titles and `notes` of the 20 most recent cards of this machine. This is
   the do-not-repeat list.
3. Read the intake note in full.
4. Delegate to the **cf-angle-scout** agent. Pass the intake note contents, the
   do-not-repeat list, the target count (default 10), and the platforms. It returns each
   angle with a hook line, the promise, the format, the objection it answers, and an
   evidence tag of OWNED, OBSERVED (with URL and date) or ASSUMPTION.
5. Delete any angle that only works if a statistic, a case study, a testimonial or an
   income figure is invented. If an angle needs a number the operator has not supplied,
   keep the angle and add the number to a `needsUser` list at the bottom of the file.
6. Write `content-machine/notes/ideas-<YYYY-MM-DD>-<offer-slug>.md` containing the
   numbered angles with their tags, the rejected angles and why, and the `needsUser` list.

**Approval gate.** Print the numbered angles to the operator and ask which to promote.
Create cards only for the numbers they name. If they answer nothing, promote nothing.

7. For each approved angle append a card to `cards`: `id` = next free `c-00NN`,
   `"machine": "content"`, `"stage": 0`, `title` = the hook line trimmed to 80 chars,
   `created` = current UTC ISO-8601, `notes` = the angle's format, evidence tag and the
   path of the ideas file.
8. Append to `log`: `{id, ts, "machine":"content", "stage":0, "text":"/cf-ideas — N angles drafted, M promoted"}`.
   Write `pipeline.json` back with 2-space indent, then append one tab-separated line to
   `logs/run.log`.

**Report.** New card ids, the ideas file path, and the `needsUser` list verbatim.
