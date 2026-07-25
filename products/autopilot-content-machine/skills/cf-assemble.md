---
description: Check rendered shots, write the cut sheet and the per-platform captions, hashtags and alt text for a card, run the claim check, and advance it to the ASSEMBLE stage. Use once Higgsfield outputs are saved for a card or when the operator asks for captions and a final edit plan.
argument-hint: "[card-id] (blank picks from the RENDER stage)"
---

# /cf-assemble — RENDER to ASSEMBLE

**Preconditions.** The card is at `stage: 2`, its brief exists at
`content-machine/briefs/<card-id>-higgsfield.md`, and at least one file sits in
`content-machine/assets/<card-id>/`. An empty assets folder means the render stage is not
finished — say so and stop.

**Steps.**

1. Read `pipeline.json`, the card's script and brief. If no card id was given, list the
   stage-2 cards and let the operator choose.
2. List `content-machine/assets/<card-id>/` and compare against the brief's expected
   filenames. Report missing shots, extra files, and any file of zero bytes. Ask the
   operator whether to proceed without the missing shots or send them back to Higgsfield.
3. Write the cut sheet into the post pack — shot order, the in and out point for each shot
   against the beat timecodes, where the burned-in on-screen text sits, where the CTA card
   lands, the audio plan (voiceover, music bed, or silent with captions), and the total
   runtime. Flag any shot the brief's regeneration log marked as unusable.
4. Delegate to the **cf-caption-writer** agent with the script, the platforms, the intake
   note's forbidden-claims list and the offer's CTA. Ask for one primary caption per
   platform, one alternative for the first platform, hashtags grouped as broad and
   specific, alt text for accessibility, and the first-comment text if the platform is
   used that way.
5. Run the claim check yourself on every returned line. Any earnings claim, guaranteed
   outcome, invented statistic, invented testimonial, invented review, fake scarcity or
   medical, legal or financial advice is deleted, not softened. A refund or money-back
   guarantee is allowed only if the intake note says the operator actually offers one.
6. Write `content-machine/posts/<card-id>-post.md` with the cut sheet, the captions per
   platform, hashtags, alt text, the asset filenames it refers to, and a `needsUser` list
   of anything the operator must supply (a real price, a real result, a real link).

**Approval gate.** The operator cuts the video themselves, watches it end to end, and
confirms the audio, the captions and the on-screen text are correct. Ask them for the path
of the finished file, expect it in `content-machine/assets/<card-id>/final.mp4`, and verify
that file exists before advancing. No confirmation, no advance.

7. Set the card's `stage` to `3`, append the post pack path and the final asset path to
   `notes`, append a `log` entry naming this skill and the platforms covered, write
   `pipeline.json` with 2-space indent, and append a line to `logs/run.log`.

**Report.** Post pack path, final asset path, platforms covered, deleted claims, `needsUser`.
