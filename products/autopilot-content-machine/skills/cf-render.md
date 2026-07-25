---
description: Convert an approved script into a shot-by-shot Higgsfield generation brief, hand it to the operator to run on their own Higgsfield account, and advance the card to the RENDER stage. Use when a scripted card is ready for media generation or when the operator asks for Higgsfield prompts.
argument-hint: "[card-id] (blank picks from the SCRIPT stage)"
---

# /cf-render — SCRIPT to RENDER

**Preconditions.** The card is at `stage: 1` and `content-machine/scripts/<card-id>-script.md`
exists. The operator has a funded Higgsfield account — this engine writes prompts, it does
not generate media and cannot spend credits for you. If either is missing, stop.

**Steps.**

1. Read `pipeline.json` and the card's script file. If no card id was given, list the
   stage-1 cards and let the operator choose.
2. Ask the operator two things if the script does not already answer them — the aspect
   ratio (default 9:16) and whether on-screen words are burned in later in the editor
   (default yes, because generated in-frame text is frequently unreadable).
3. Delegate to the **cf-shot-designer** agent with the script, the beat timecodes, the
   aspect ratio and the visual constraints from the intake note. Ask for one shot per beat.
4. Create `content-machine/assets/<card-id>/` and write
   `content-machine/briefs/<card-id>-higgsfield.md` containing a table of shots with
   `shot-01` … `shot-NN`, the beat each covers, its duration, and for each shot the full
   copy-pasteable prompt, the camera and motion note, what must not appear, and the exact
   output filename to save as (`shot-01.mp4`). End the file with a continuity block
   (subject, wardrobe, palette, lighting, time of day) so reruns match, and a regeneration
   log table with columns shot, attempt, result, credits.

**Approval gate.** Show the operator the shot count and the brief path and state plainly
that running it spends their own Higgsfield credits. Wait for a go-ahead. Then they run
the generations in Higgsfield themselves and save the outputs into
`content-machine/assets/<card-id>/` with the filenames from the brief.

5. When the operator says the batch is done, list the directory and report which expected
   filenames are present and which are missing. Do not advance a card whose shots are all
   missing. Missing or unusable shots stay in the regeneration log with the reason.
6. Ask the operator for the credits actually consumed. If they give a number, append a
   `costs` entry `{id, month, "service":"Higgsfield", amount, note}` using their figure
   and their own currency. Never estimate the amount, and never quote Higgsfield pricing —
   direct them to Higgsfield's own pricing page.
7. Set the card's `stage` to `2`, append the brief path, shot count and assets folder to
   `notes`, append a `log` entry naming this skill and the shots delivered, write
   `pipeline.json` with 2-space indent, and append a line to `logs/run.log`.

**Report.** Brief path, assets folder, present and missing shots, regeneration notes.
