---
description: Build the Postiz posting plan for an assembled card, get explicit publish approval from the operator, and advance the card to the SCHEDULED stage. Use when a finished asset and captions are ready to be queued, or when the operator asks to schedule or publish a card.
argument-hint: "[card-id] (blank picks from the ASSEMBLE stage)"
---

# /cf-schedule — ASSEMBLE to SCHEDULED

**Preconditions.** The card is at `stage: 3`, `content-machine/posts/<card-id>-post.md`
exists, and the final video file named in the card's `notes` exists on disk. The operator
has a working Postiz instance (hosted or self-hosted) with the target social accounts
already connected. Check `services.postiz` in `pipeline.json` — if `connected` is false,
report the note stored there and stop until they reconnect.

**Steps.**

1. Read `pipeline.json` and the post pack. If no card id was given, list the stage-3 cards
   and let the operator choose.
2. Confirm the final asset path resolves and is not zero bytes. A schedule pointing at a
   missing file is the single most common failure here.
3. Delegate to the **cf-distribution-planner** agent with the platforms, the captions, the
   operator's timezone, their stated posting cadence, and the last five `SCHEDULED` cards
   from `pipeline.json` so slots do not collide. It returns one slot per platform with a
   date, a local time, the timezone, the caption to use, and the reason for the slot.
4. Verify per platform that the caption is the one approved in the post pack, that the
   asset aspect ratio matches what the operator selected, and that no slot lands within
   the cadence gap of an already-scheduled card. Fix collisions before showing the plan.
5. Write `content-machine/schedule/<card-id>-postiz.md` — a table of platform, account
   handle, date, local time, timezone, asset path, caption reference, first comment, and a
   blank `postiz-id` column for the operator to fill after queuing.

**Approval gate — hard stop.** This is the only stage that puts content in front of an
audience. Print, per platform, the exact caption text, the asset filename, the account
handle, and the date, time and timezone. Ask the operator to reply with the word `approve`
or with edits. Anything other than an explicit approval means no scheduling happens. Never
treat a previous approval, a general "go ahead", or your own confidence as consent for
this send.

6. After approval, the operator queues the posts in Postiz — through the Postiz UI by
   pasting from the schedule file, or through their own configured Postiz API access if
   they have it. This engine never posts on its own and never holds their credentials.
   Ask them to paste the returned Postiz post ids into the schedule file.
7. Set the card's `stage` to `4`, append the schedule path and the first scheduled datetime
   to `notes`, update `services.postiz.lastRun` to now, append a `log` entry naming this
   skill, the platforms and the slots, write `pipeline.json` with 2-space indent, and
   append a line to `logs/run.log`.

**Report.** Schedule path, per-platform slots in local time, anything that failed to queue.
