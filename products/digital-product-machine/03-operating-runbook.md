# Operating runbook

A product cycle is roughly 4–8 focused hours spread over one to three weeks. The rhythm below
keeps that from becoming eight months. Two standing commitments: fifteen minutes daily,
forty-five minutes weekly.

## The daily 15-minute loop

Same time every day. Terminal, not the panel — the panel is for review, the session is for work.

```zsh
cd ~/claudefleet && claude
```

1. **Read the session-start line** (30s). The hook prints the stage counts and the last run
   before you type anything: `ClaudeFleet [product] Validate:1 | Build:1 | …`. That is the
   business in one line.
2. **Pick one card** (30s) — the one furthest along that is not blocked. Finish before you
   start. A machine with four cards in Build and none in Launch Kit is a machine producing
   nothing.
3. **Run the one skill that card needs** (10 min) — `/dp-validate`, `/dp-build`,
   `/dp-package`, `/dp-launch`, `/dp-schedule`. One card, one stage, one session.
4. **Write the card's note** (2m). Not "worked on it" — what changed, what's next, what's
   blocking. Future-you reads this cold in four days.
5. **Log anything that cost money** (1m) in the panel's cost tracker, from the actual invoice
   or credit balance, and **Export JSON** afterwards.
6. **Stop.** Fifteen minutes of daily forward motion beats a five-hour Sunday.

If the day's card is blocked outside the machine — an unanswered email, a Higgsfield batch
still rendering — spend the fifteen minutes on the next card down instead of staring at it.

## The weekly review (45 minutes, same day each week)

Open the panel, **Import JSON** first so you are looking at what Claude actually wrote.

- **Board sweep.** Any card that has not moved in seven days gets a decision: unblock, cut
  scope, or kill. "Still working on it" is not a decision, and killing a stalled card is a
  healthy outcome.
- **Run log read.** Skim `logs/run.log` and the panel's log for stages you keep re-running.
  Repeated `/dp-build` runs on one card means the validation was weak, not the writing.
- **Costs.** Add the week's real invoice amounts and compare the month's total against what
  the cycle produced. Nobody else will notice credit burn drifting upward.
- **Service check.** Confirm Postiz still has live connections and Higgsfield still has credit
  before the week that needs them, not during it. Update the three service tiles — a notebook
  you maintain, not a live monitor.
- **One improvement.** Pick a single thing that went badly and change the input that caused
  it: a sharper intake question, a tighter brief, a scope cut. One per week, applied to the
  next cycle.
- **Export JSON** and move it back over `~/claudefleet/pipeline.json`.

## Handing a launch off to Postiz

`/dp-schedule` writes `notes/<slug>/schedule/postiz-plan.md` and stops. It never queues and
never publishes; this engine holds no credentials and touches no account. A launch is a
week of posts, not one card, so a mistake here repeats itself five times before you notice.
Which branch you use is recorded once in `CLAUDE.md`'s Distribution section.

**Before either branch — the check that catches the expensive mistake.** `ls` the assets
folder and match every filename against `social.md`. A scheduled post pointing at a file
that does not exist fails silently at cart-open, which is the worst possible moment.

**Hosted Postiz (or self-hosted without API access) — the paste path.**

1. Open `postiz-plan.md` beside the Postiz composer. Work top to bottom, never out of order.
2. Per row, in this fixed order: channel → media file → caption → link → date, local time
   and timezone. The fixed order is what stops a cart-close caption landing on day one.
3. Before scheduling each item, do the visual check *inside Postiz* — its preview, not your
   file. Wrong aspect and truncated captions only appear here.
4. Paste the returned Postiz id into the plan's id column. A blank id means you do not
   actually know whether that slot exists.

**Self-hosted Postiz with API access — the scripted path.**

1. Your token lives in your shell environment or your own secrets manager. **Never write a
   token into any file under the fleet home, into the plan, or into anything you might
   commit** — the fleet home is designed to be diffable and possibly git-tracked.
2. Dry-run the whole week first: print every payload and read the channel ids and
   timestamps before a single call is sent.
3. Send, then write the returned ids back into the plan. A 2xx is not proof the slot is what
   you intended — open one post in the UI and look at it.
4. If a send fails mid-week, fix forward one row at a time. Re-running the batch is how a
   launch double-posts to the same channel.

**The failure playbook**, for the three that actually happen:

| What broke | What to do | Where to record it |
|---|---|---|
| Expired channel token | Reconnect in Postiz, re-queue that row, verify visually | `services.postiz.note` in `pipeline.json` |
| Media rejected on aspect | Re-cut from `assets/<slug>/`, do not re-render — the brief was fine | the card's `notes` |
| Duplicate-content rejection | Rewrite that one caption; never strip and repost identical copy | the card's `notes` |

Whatever happens, the approval gate in `CLAUDE.md` still holds: nothing is queued before
you reply with an explicit approval line, and a previous card's approval never covers this
one.

## When output quality drops

Quality decays from the input side almost every time. Work in this order and stop when it's fixed:

1. **Re-read the validation memo.** Vague product content nearly always traces to a vague
   problem statement. Weak memo, weak everything downstream.
2. **Check what the skill was given.** A one-line request produces one-line thinking. Feed the
   memo, the audience, the format, the constraints, the things it must not say.
3. **Ask for the hostile pass explicitly**, in its harshest form: *"take the buyer's side and
   list what they would call filler, by section."* Then cut what it names.
4. **Shrink the scope.** A 40-item pack of which 25 are good is a 25-item pack, and it sells
   better than the padded version.
5. **Restart the session.** A long session drags accumulated context; a fresh session with the
   card's notes and the memo is usually sharper.
6. **Write the sample yourself.** Do two deliverables by hand and hand them back as the pattern
   to match. Fastest quality fix there is.

## When a service fails

**Claude Code unavailable or rate-limited.** Nothing advances — it is the brain. Do the offline
half instead: read your memos, use your own product, gather customer questions for the next
intake. Don't wait it out in front of the terminal.

**A Higgsfield batch comes back unusable.** Expected, not exceptional. Regenerate with one
variable changed, not five, so you learn which one mattered — and change them in this order,
cheapest and most likely first:

1. **The NEVER list.** Mangled in-frame text, a stray logo, warped hands. Almost always
   fixed by naming the thing as excluded rather than rewriting anything. Text in frame is
   the standard failure: exclude it entirely and add captions in an editor afterwards.
2. **Composition or lighting.** Wrong scale, muddy subject, an aspect that crops badly.
3. **The subject line of the prompt.** Rewrite it as concrete nouns; vague adjectives are
   why a generator improvises.
4. **The brief itself.** Two failed passes on the same brief means the brief is wrong —
   rewrite it from the product's actual promise, not from the previous brief.

If the same fault repeats across products, stop fixing briefs: the fix belongs in
`CLAUDE.md`'s Visual style section so it stops recurring.

Out of credits mid-launch: the briefs are plain text and portable to any generator you
already pay for — the machine's job ends at the brief. A stock cover shipped on time beats a
perfect cover that misses the launch.

**Postiz won't publish.** Expired platform tokens are the usual cause and they fail quietly.
Reconnect the account in Postiz, re-queue, and verify the queue visually. If it stays broken,
post the launch-week items manually from the launch kit — the copy is already written and
approved; Postiz is a scheduler, not a dependency for the words. Note the outage on the card.

**Checkout or delivery broken.** Stop the launch — never send traffic to a broken checkout.
Fix it, buy your own product end to end as a test, then resume.

## Quality gates that are never skipped

Five, and every one of them is a human looking at the thing:

1. **No build without a GO memo you have read.** Not skimmed.
2. **No packaging without using the product yourself** at least once, as a buyer would.
3. **No asset ships unreviewed at full size.** Especially anything with text in it.
4. **No claim survives that the product cannot back.** No invented statistics, no borrowed
   case studies, no earnings claims — yours or anyone's. If the copy needs a real number and
   you don't have one, the claim is cut.
5. **Nothing publishes without a human look at the final queue.** The machine prepares; you
   press the button. It never publishes on its own.

Skipping gate 4 produces refunds. Skipping gate 5 produces the kind of mistake that is public
before you know about it.
