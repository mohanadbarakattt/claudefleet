---
description: Turn an approved IDEA card into a shot-ready short-form script with hook variants, timed beats, on-screen text and a CTA, then advance the card to the SCRIPT stage. Use when the operator asks to write, draft or rework the script for a queued content card.
argument-hint: "[card-id] (blank picks from the IDEA stage)"
---

# /cf-script — IDEA to SCRIPT

**Preconditions.** The card exists in `pipeline.json` at `stage: 0`, and the ideas file
named in its `notes` is readable. If the card is at any other stage, say so and stop —
this skill only moves cards out of IDEA.

**Steps.**

1. Read `pipeline.json`. If no card id was given, list every stage-0 card and let the
   operator choose. Never pick for them.
2. Read the ideas file the card points to, plus the offer's intake note. Extract the
   forbidden-claims list and the proof the operator actually owns.
3. Read the two most recent scripts in `content-machine/scripts/` if any exist, so the
   new one does not open the same way.
4. Delegate to the **cf-script-writer** agent with the angle, the platform, the target
   runtime (default 20-35 seconds), the forbidden-claims list, and the owned proof. Ask
   for exactly one script plus three alternative hook lines.
5. Check the returned script yourself before writing it. Reject and re-request if it
   contains any statistic, client result, testimonial, review, follower count or earnings
   figure that did not come from the intake note. "This will make you money" and any
   variant of it is an automatic reject. Numbers the operator must supply go into a
   `needsUser` list at the bottom of the file, never a guessed placeholder value.
6. Write `content-machine/scripts/<card-id>-script.md` with, in order — the hook (first
   two seconds, spoken and on-screen), the beats with running timecodes, the spoken lines
   one per line as they will be read, the on-screen text per beat, the CTA, the estimated
   read time at 2.6 words per second, the three alternative hooks, and the `needsUser` list.

**Approval gate.** Read the hook and the CTA back to the operator and ask for approval or
edits. Do not advance the card until they approve — the next stage spends real Higgsfield
credits on their paid account, and a script fixed here costs nothing.

7. On approval set the card's `stage` to `1`, append to `notes` the script path, the
   chosen hook variant and the estimated runtime, and update nothing else on the card.
8. Append to `log`: `{id, ts, "machine":"content", "stage":1, "text":"/cf-script — <card-id> scripted, <runtime>s, hook variant <n>"}`.
   Write `pipeline.json` with 2-space indent, then append a tab-separated line to `logs/run.log`.

**Report.** Script path, chosen hook, estimated runtime, and anything on the `needsUser`
list that must be answered before rendering.
