# Operating runbook — running this as a real business

## The rhythm

Batch by stage, not by post. Five scripts in one sitting beats one on five days; clip
generation is slow and costs credits, so it gets its own block.

| Day | Block | Work |
|---|---|---|
| Mon | 45 min | `/cf-ideas`, then `/cf-script` on the batch you approved |
| Tue | 60–90 min | **Render day** — `/cf-render`, generate in Higgsfield, download, approve clips |
| Wed | 60 min | `/cf-assemble` + cut and export in your editor |
| Thu | 20 min | `/cf-schedule` — queue everything for the coming week |
| Fri | 30 min | Weekly review |
| Daily | 15 min | The loop below |

Set cadence to what you'll sustain in a bad week, not a good one. A machine that misses
two weeks running stops being a machine.

## The daily 15-minute loop

1. **(1 min)** `cd ~/claudefleet && claude`. The `SessionStart` hook prints stage counts
   and the last run, so you open knowing where the business stands.
2. **(2 min)** Read the board. Whichever stage is fullest is your bottleneck, and it's the
   only stage you work today. Cards piling up in Render means you're writing faster than
   you're generating — write less, don't generate more.
3. **(8 min)** Run the one skill that empties the bottleneck by a card or two, and approve
   or reject at that stage's gate. Never approve two stages of the same card back to back;
   that's when you stop reading and start nodding.
4. **(2 min)** Check yesterday's live post in the platform's own analytics. One number,
   one note. Full analysis is Friday's job.
5. **(2 min)** Log anything you spent — Higgsfield credits, any new charge — into the
   `costs` array. Costs you don't log are costs you find on a card statement.

Only five minutes? Do steps 1–2 and stop; knowing the bottleneck is most of the value.

## The weekly review (30 min, same slot every week)

Import the current `pipeline.json` into the dashboard, then:

1. **Throughput.** Cards that reached Scheduled vs. your cadence target. Miss twice in a
   row and cut the target rather than pretending.
2. **Dead cards.** Anything sitting in one stage over a week: fix it or kill it and write
   down why. Stale cards make the board lie.
3. **Performance.** Rank last week's live posts on the one metric you chose — pick it once
   and keep it. Note the *format and angle*, not just the number.
4. **Feedback.** Write the two or three conclusions into
   `content-machine/notes/<offer-slug>-intake.md`. That's the only way next Monday's
   `/cf-ideas` gets smarter instead of restarting.
5. **Costs.** Total the month's `costs` and compare to what the output is worth to you. If
   that's uncomfortable, cut volume or a service now, not at renewal.
6. **Connections.** Confirm Postiz still shows every platform connected and next week's
   queue is what you think it is.

## When output quality drops

Diagnose in this order; the cheap causes are the common ones.

1. **Stale intake.** Most drops are an intake describing the business you had two months
   ago. Re-read all eight answers. Fix here first.
2. **Sameness, not badness.** If everything reads fine but performs worse, you're in a
   format rut. Change the structural format — explainer, demo, objection, story — not the
   topic.
3. **Approving too fast.** Check `logs/run.log` timestamps. Approvals a minute apart mean
   the gate isn't a gate.
4. **Thin briefs.** Weak clips usually trace back to a script whose beats weren't specific,
   so the render brief had nothing to work with. Fix the script, then regenerate.
5. **Only then, the tools.** Different model tier or Higgsfield preset — one variable at a
   time, and write down which.

## When something fails

**Claude Code is down, rate-limited or degraded.** Stop the pipeline; don't push through
with output you'd normally reject. Everything is a file, so nothing is lost — the pipeline
resumes where it stopped. Persistent rate limits mean smaller batches.

**Higgsfield fails or credits run out.** Cards stay in Render. Fallback ladder, in order:
(a) cut the shot count and hold the piece together with edits; (b) replace video shots with
generated stills, moved in your editor; (c) use your own or stock footage; (d) reformat as
a text/carousel post — the script already exists, and that's the expensive part. Never
publish a clip you rejected just because it cost credits.

**A generation comes back unusable.** Two-strike rule: regenerate once, with a *changed*
prompt. If the second pass fails, cut the shot or swap in a still. A third attempt rarely
lands and is how credit spend runs away. Log both attempts in the card's `notes`.

**Postiz fails or a token expires.** The most common way a week's work misses its slot.
Reconnect the account, verify with one test post, re-queue. If it can't be fixed today,
publish manually from the exported file and note that the schedule was bypassed. Check
tokens on render day, not schedule day.

**`pipeline.json` is broken.** `jq -e . ~/claudefleet/pipeline.json` tells you. Restore
from your last dashboard export, or from git if you keep the fleet home in a repo.

## Quality-control gates that are never skipped

Each is cheap to catch here and expensive to catch after publishing.

1. **Idea gate** — you cut the hook list yourself. Never take the whole batch.
2. **Claim gate** — every claim, number, price and testimonial is one you can personally
   back. The machine is instructed never to invent them; you are the check that none
   slipped through, and the only one accountable.
3. **Watch gate** — nothing reaches scheduling that you haven't watched end to end, sound
   on, at phone size. Reading the assembly sheet is not watching the post.
4. **Queue gate** — before you leave Postiz: right asset, right caption, right account,
   right time in your audience's local timezone.
5. **Human gate** — **nothing publishes without a human look.** No unattended runs, no
   "I'll check it after it goes live", no five approvals in ninety seconds.

Gate 5 is why the machine stops at *scheduled*. Automating the work up to the queue is
leverage; automating the decision to publish is how a brand gets damaged in one afternoon
by something nobody read.
