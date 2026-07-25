# Architecture — how this machine works, stage by stage

## The state model, in one page

One card = one item of work, usually one post (sometimes a tight batch that shares a
brief). A card lives in the `cards` array of `~/claudefleet/pipeline.json` and carries an
`id`, `machine` (`"content"`), `stage` (an index, 0–4), `title`, `created`, and `notes` —
a running plain-text history of what happened to it and what was decided.

`stages` is `["Idea","Script","Render","Assemble","Scheduled"]`. Five, always. A skill
advances a card by exactly one index, writes what it produced into `notes`, and appends a
line to the `log` array. Files a stage produces (scripts, briefs, clips) land under
`~/claudefleet/content-machine/`; the card is the index into them, not the container.

Three things read or write that file: **skills** mutate it, the **admin panel** views and
hand-edits it (Import before you look, Export after you edit), and **hooks** only append
to `logs/run.log` — never to the pipeline, so a hook can't corrupt your state. Editing
`pipeline.json` by hand is normal and supported.

The division of labour inside a stage: the **skill** decides *what this stage means and
when it's done*; the **agent** it delegates to does the specialist work in its own context
window, so the main session stays cheap.

---

## Stage 1 — Idea `/cf-ideas`

**In:** `content-machine/notes/<offer-slug>-intake.md` (audience, offer, wedge belief, real
proof, platforms, voice and bans, compliance limits, cadence), plus whatever last week's
review told you to change.

**Does:** the **content strategist** agent works the intake into angles — a set of hooks
with the reasoning attached: who it's aimed at, which belief it attacks, which proof
backs it, why it's worth a slot. It clusters them so variations of one idea don't read as
different bets. Nothing is invented that the intake
doesn't support: if your proof section is thin, the strategist writes around it rather
than manufacturing a statistic or a testimonial.

**Service:** Claude only.

**You approve:** which hooks survive. This is a cut, not a rubber stamp — kill anything
off-voice, unbacked, or that you wouldn't be happy to have quoted back to you. Three to
five approved beats nine mediocre.

**Done when:** each approved hook exists as its own card at stage 0, with the angle and
the intended proof recorded in `notes`. Rejected hooks stay in the session or in a notes
file, not in the pipeline.

---

## Stage 2 — Script `/cf-script`

**In:** one card from Idea, plus the intake.

**Does:** the **script writer** agent drafts the hook line, the full spoken script written
to a target duration, the on-screen text per beat, and three alternative hook variants. It
marks the beats — the first-three-seconds hook, the turn, the payoff, the call to action —
because those beats become shots at the next stage. Before it reaches you, the skill checks
the draft itself against the intake's bans and compliance limits, and rejects and
re-requests anything that slipped through. Captions are not written at this stage — they
come later, once there is a finished clip to write them against.

**Service:** Claude only.

**You approve:** read it aloud with a timer. If it doesn't land in your target duration at
your natural pace, it isn't done. Then check three things: every claim is one you can
back, the voice is yours, and nothing violates the compliance line from your intake.

**Done when:** the card is at stage 1, the approved script and its alternative hooks are
saved under `content-machine/` (path recorded in `notes`), and you have a duration you
believe.

---

## Stage 3 — Render `/cf-render`

**In:** the approved script, with its beats.

**Does:** the **render engineer** agent converts the script into a shot-by-shot generation
brief: one prompt per shot, plus aspect ratio, duration per shot, camera and lighting
direction, continuity notes so shots look like they belong to the same piece, and an
explicit "no on-screen text" instruction — generated text comes back garbled often enough
that text belongs in the editor, not the model. Prompts are written to be pasted as-is.

**Service:** **Higgsfield**, in your account, on your credits. The machine writes prompts;
it does not generate media and cannot spend credits you haven't bought. You paste,
generate, and download the clips into `content-machine/assets/<card-id>/`.

**You approve:** the clips, one by one, before the card moves. Watch each one full-size.
Reject on: wrong subject, mangled hands or faces, unreadable artifacts, continuity breaks,
or a vibe that doesn't match the script.

**Done when:** every shot has a usable clip on disk in the card's asset folder, and
`notes` records what was regenerated, what was cut, and roughly what the batch cost in
credits. If a shot fails twice, cut it or replace it with a still — see the runbook.

---

## Stage 4 — Assemble `/cf-assemble`

**In:** the clips and the script.

**Does:** writes the cut sheet — shot order, the in and out point for each clip against the
beat timecodes, where on-screen text and the CTA card land, the audio plan, and the total
runtime. Then the **caption writer** agent writes one primary caption per platform (plus one
alternative for the first platform), hashtag groups, alt text and first-comment copy. The
skill runs the claim check itself over every line the agent returns and deletes anything
that doesn't belong — an earnings claim, an invented statistic, a fake guarantee.

**Service:** Claude for the writing; the actual cut happens in **your video editor**. This
machine does not edit video.

**You approve:** the finished post, watched end to end, with sound on, on a phone-sized
screen. Not the assembly sheet — the export. Hook lands in the first three seconds, text
is readable and doesn't sit under the platform UI, audio is level, caption matches what's
on screen.

**Done when:** one exported file exists that you would be happy to see on your own feed,
with its final caption text saved next to it.

---

## Stage 5 — Scheduled `/cf-schedule`

**In:** the exported post, its final caption, and your cadence target.

**Does:** the **distribution planner** agent works out one slot per platform — date, local
time, timezone and account — checked against what's already queued so nothing collides.
The skill then assembles the publish payload — asset, per-platform caption, first comment,
target accounts and slot — and hands it to **Postiz**, which queues it against your
connected social accounts. Then it appends the run to `log` and files what the next
planning cycle should know: what shipped, what it cost, what to repeat.

**Service:** **Postiz**, hosted or self-hosted, connected to your own accounts.

**You approve:** the queue itself. Confirm the right asset is attached to the right
caption on the right account, that the time is right in the *local* timezone of your
audience, and that nothing collides with another scheduled post. This is the last gate
before the internet sees it, and it is never skipped or delegated.

**Done when:** the post is visible in the Postiz queue with a time you chose, the card
sits at stage 4, and the run is in `log`.

---

## Where it breaks, honestly

The stage boundaries are also the failure boundaries. Stages 1, 2 and 4 fail as *bad
writing* — recoverable in a session, cheap. Stage 3 fails as *bad or missing media* and
costs credits every retry, so it's where you enforce the two-strike rule from the runbook.
Stage 5 fails as *bad connection state* — an expired platform token in Postiz is the most
common way a week's work misses its slot, which is why the runbook checks tokens before
render day, not on schedule day.
