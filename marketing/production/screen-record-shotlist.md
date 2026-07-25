# ClaudeFleet — Screen-Record Shot List

Every screen recording the 30-day calendar and the six launch reels depend on,
extracted from `calendar/week-1.md`–`week-4.md` and `production-scripts.md`, and
turned into capture instructions.

**Organised as capture sessions, not as days.** One `/cf-script` run feeds six
different days. Recording it six times is how you end up with six slightly
different takes and no continuity. Roll each session once, roll it long, cut
many times. The reuse map at the bottom says which capture serves what.

---

## Read this before you book a session

**1. Nothing here can be filmed until the engine is installed.** `~/claudefleet`
does not exist on this machine — checked. Sessions B, C, D and E all read from a
fleet home that has to be created first. **Session A is a hard prerequisite**,
and it is also Day 5's entire reel, so it pays for itself.

**2. Every capture in this file costs zero Higgsfield credits.** Credits are low
and the Higgsfield MCP was erroring at time of writing, so generation is a
paste-into-the-web-app job. That makes screen-record footage the cheapest
coverage in the whole project: it is free, it is the format this niche trusts
most, and roughly 25 of 30 days plus two entire reels are built on it. If you
only have time for one thing this week, it is Session B.

**3. The engine writes briefs; it never generates media, and it never posts.**
`/cf-render` writes a Higgsfield brief and stops (`cf-render.md`, approval gate:
"running it spends their own Higgsfield credits"). `/cf-schedule` and
`/dp-schedule` produce a plan and stop; you queue it yourself in Postiz. This is
a selling point on camera — Reel 2 shot 4 and Day 17 beat 4 both say it out loud
— but it also means: **do not film a Postiz dashboard you do not own.** The
Postiz CLI is not installed here and `POSTIZ_API_KEY` is not set. If you have a
real Postiz instance with connected channels, film it. If you do not, the honest
"scheduled" proof is the admin panel's Scheduled column plus the real
`<card-id>-postiz.md` schedule file, and you say on camera that you queue it by
hand.

**4. The storefront's buy buttons are placeholders.** `site/index.html` still has
`GUMROAD_LINK_CONTENT_MACHINE`, `GUMROAD_LINK_PRODUCT_MACHINE`,
`GUMROAD_LINK_BUNDLE`. Scroll the site, do not film a click on a buy button
until those are real links.

**5. Card ids and log wording come from the real run.** Reel 2's shot column
names `c-0100-script.md` and a run-log line reading `/cf-render — 4 shots, 0
credits spent`. Whatever card id and wording your actual run produces is what
goes on screen. The voiceover never says the id aloud, so there is nothing to
match. Typing that line into the panel by hand to match the script is
fabrication, and it is the one thing this reel exists to not do.

---

## SESSION A — Install from the shipped zip
*Terminal + Finder. Prerequisite for everything else. Budget one sitting.*

Install into a **sandboxed HOME**, not your real one, if you want a repeatable
take — the dogfood run in commit `ae2b423` did exactly that. A second, real
install into `~/claudefleet` is what Sessions B–E then use.

### SR-01 — Timed install, single unbroken take
**Feeds:** Day 5 (whole reel) · Reel 4 shot 1 (unzip beat pulls from this take)
**Run:** Start a stopwatch overlay at 0:00. Unzip `dist/claudefleet-content-machine.zip`
in Finder. Then in the terminal, `INSTALL.md` step 1 (the two `export` lines and
the verifying `ls`), then the whole step 2–6 paste block, then step 7
(`open "$CLAUDEFLEET_HOME/admin.html"`).
**In frame:** The stopwatch the whole time. The unzip producing
`autopilot-content-machine/` — note the folder name differs from the zip name,
which is bug 1 from Reel 4 and worth having on screen. The `mkdir` creating six
subfolders. `hooks merged` printing. Menu-bar clock.
**Roll:** One take, run to completion, expect 2–4 min raw. Do not stop and restart.
**Ruined by:** Speed-ramping the install to force it under two minutes. Day 5
beat 4 says "genuinely under 2 minutes, not edited to look fast" — if your real
take lands at 2:40, the honest reel is a 2:40 reel with the hook rewritten, not a
sped-up 1:58.

### SR-02 — Verification triple
**Feeds:** Day 5 beat 5 · Day 28 point 3 · Day 30 (that the thing is real)
**Run:** `INSTALL.md`'s three checks, back to back:
`ls "$HOME/.claude/agents"` · `ls ~/.claude/skills/*/SKILL.md` ·
`jq '.hooks | keys' "$HOME/.claude/settings.json"` ·
`jq -r '.hooks.SessionStart[-1].hooks[0].command' "$HOME/.claude/settings.json" | zsh`
**In frame:** The five `cf-*` agent files listed. Five skill directories each with
a `SKILL.md`. The hooks key list containing `PostToolUse`, `SessionStart`, `Stop`.
The SessionStart banner line printing stage counts and the last run.
**Roll:** 60–90 s.
**Ruined by:** Filming your real `~/.claude/settings.json` contents. It has other
plugins' hooks and possibly other people's tokens in it. Show only the `jq keys`
output, never the file.

### SR-03 — The run log actually firing
**Feeds:** Day 28 point 3 (same job the same way every time) · Reel 2 (continuity)
**Run:** `cd "$CLAUDEFLEET_HOME" && claude`, ask it to write `notes/hook-test.md`,
exit, then `cat "$CLAUDEFLEET_HOME/logs/run.log"`.
**In frame:** Two tab-separated lines — a `file  Write  …/notes/hook-test.md` and
a `session-end` — each carrying a real ISO timestamp. Those timestamps are the
proof; do not crop them.
**Roll:** 45 s.
**Ruined by:** Running it from outside the fleet home. The hooks only log paths
inside `$CLAUDEFLEET_HOME`, so you get an empty file and a confusing shot.

---

## SESSION B — Claude Code running the Autopilot Content Machine
*Terminal in `~/claudefleet`. The highest-value session in the project — nine
calendar days and two reels come out of it. Budget a long sitting.*

Roll **SR-04 as one continuous recording** and cut SR-05 through SR-09 out of it.
Separate takes only if a stage genuinely needs a re-run.

### SR-04 — MASTER TAKE: full pipeline, idea to scheduled
**Feeds:** Day 26 (whole reel) · Day 27 (whole reel) · Day 11 · Day 9 slide stills
**Run:** From `~/claudefleet`, start with a real, unglamorous idea sitting in a
notes app (Day 26 beat 1 opens on it). Then `/cf-ideas` → `/cf-script` →
`/cf-render` → `/cf-assemble` → `/cf-schedule`, answering each approval gate as
yourself, in one unbroken recording.
**In frame:** Menu-bar clock throughout. Every approval gate, including your
answers. The gaps where it thinks — do not cut them out of the master; cut them
in the derived reels and say so.
**Roll:** However long it actually takes, 15–40 min raw is normal. This is the
one place where rolling long is cheaper than reshooting.
**Ruined by:** Presenting the speed-up as unedited. Day 26 beat 4 already scripts
the fix: *"This is sped up — it is not cut."* Say that line, and only speed up
playback — never remove a step and call the result a single take.

### SR-05 — `/cf-ideas` running live
**Feeds:** Day 5 beat 3 · Day 8 beat 1 · Day 11 beat 1
**Run:** `/cf-ideas` with the intake note in place. Let the angles stream in.
**In frame:** The numbered angles printing, and the approval gate asking which to
promote (`cf-ideas.md` prints the angles and waits). The written
`notes/ideas-<date>-<slug>.md` path.
**Roll:** 2–3 min.
**Ruined by:** Cutting away before the gate. The gate asking you to choose is the
whole "you approve, it doesn't decide" argument the account makes all month.

### SR-06 — `/cf-script` running live, ending on the file
**Feeds:** Day 2 beats 3+5 · Day 4 command 1 · Day 8 beat 2 · Day 10 beat 3 ·
Day 11 beat 2 · Reel 2 shot 1
**Run:** `/cf-script` on the promoted card. Let the response actually start
generating on camera — Day 2 beat 3 says explicitly: don't cut away. Finish by
opening `content-machine/scripts/<card-id>-script.md`.
**In frame:** The command being typed. Generation in progress. The approval gate
reading the hook and CTA back to you. The saved file, opened, real.
**Roll:** 3–5 min.
**Ruined by:** Cutting the moment it starts generating so the wait is hidden. The
wait is the receipt — an instant result reads as pre-recorded.

### SR-07 — `/cf-render` writing the shot brief
**Feeds:** Day 3 beat 4 · Day 4 command 2 · Day 8 beat 3 · Day 10 beat 3 ·
Day 11 beat 3
**Run:** `/cf-render` on the scripted card.
**In frame:** The brief forming. The approval gate stating the shot count, the
brief path, **and that generating spends your own Higgsfield credits** — that
line is in the shipped skill and it is the single most trust-positive frame
available to you. The written `briefs/<card-id>-higgsfield.md` path.
**Roll:** 3–5 min.
**Ruined by:** Implying it generated the video. It wrote a file. Day 17 beat 4
has the wording for the product side: *"It doesn't generate them — my account, my
credits, my call."*

### SR-08 — `/cf-render` into `/cf-assemble`, one unbroken take
**Feeds:** Day 22 (the entire premise) · Day 7 beat 3 (assemble pull)
**Run:** Both commands back to back. **Do not stop the recording between them**
— Day 22 beat 3 states this as a requirement, and it is the only thing that
makes the day different from Day 4.
**In frame:** A visible clock or timestamp in a corner for the whole take (Day 22
visual note asks for this). The handoff: assemble reading the brief and the
assets folder, then writing `posts/<card-id>-post.md`.
**Roll:** 6–10 min contiguous.
**Ruined by:** A notification banner or a Cmd-Tab in the middle. Once you break
the take you cannot claim it, and the claim is the content.

### SR-09 — `/cf-schedule` and the hard approval gate halting
**Feeds:** Day 4 command 3 · Day 11 beat 4 · Day 26 beat 3 · **Day 30 beat 2**
**Run:** `/cf-schedule` on the assembled card. Run it to the gate **and stop
there on camera.**
**In frame:** The per-platform print-out — exact caption, asset filename, account
handle, date, time, timezone — and the prompt asking you to reply `approve`.
Then the cursor sitting there, waiting, doing nothing. Day 30 beat 2 is "It does
not publish for you. Every stage stops at a gate and waits" — this is that shot,
and it is the only footage in the month that proves a negative.
**In frame (Day 26 close):** the resulting `schedule/<card-id>-postiz.md` and the
card in the panel's Scheduled column (see SR-21).
**Roll:** 4–6 min, plus 10 held seconds on the waiting gate.
**Ruined by:** Blurring the account handle so heavily the frame reads as
redacted. Use a real handle you're happy to show, or a test channel.

---

## SESSION C — Claude Code running the Digital Product Machine
*Same terminal, `product-machine`. Budget a second long sitting. Note SR-10 and
SR-11 need **two different ideas** — one that fails the gate, one that passes.*

### SR-10 — `/dp-validate` returning an unconvinced verdict
**Feeds:** Day 15 (whole skit) · Reel 3 (the argument it illustrates)
**Run:** `/dp-validate` on an idea you genuinely think is mediocre. Let the memo
come back lukewarm. Answer the GO / NO-GO / MORE RESEARCH gate honestly.
**In frame:** The demand signals with their live URLs and read-dates. The verdict.
The gate asking *you* to decide. `validation.md` still reading
`DECISION: PENDING`, and the card staying at stage 0.
**Roll:** 5–8 min.
**Ruined by:** Fishing for a NO. Day 15's visual note bans "cherry-picked" output
— if the mediocre idea comes back positive, that is the take you have; pick a
different idea and re-run, don't argue the model into a no.

### SR-11 — `/dp-validate` GO straight into `/dp-build`
**Feeds:** Day 24 (whole reel) · Day 18 slides 2–3
**Run:** A second, stronger idea. `/dp-validate` → answer GO → `/dp-build`,
without stopping the recording (Day 24 beat 3: "cut straight to /dp-build").
**In frame:** Line 1 of `validation.md` being rewritten to `DECISION: GO <date>`.
`dp-build`'s precondition check on that line. The scope gate showing
`build/00-outline.md` and asking you to cut it.
**Roll:** 10–15 min contiguous.
**Ruined by:** Skipping the scope gate. It is the second place the machine makes
you decide, and it is what backs "you still review the work" on Day 27.

### SR-12 — `/dp-package` landing four files in real time
**Feeds:** Day 17 (whole reel — this day is unstylised end to end) · Day 18 slide 4
**Run:** `/dp-package` on the built product, with a Finder or `ls` view of
`notes/<slug>/package/` visible so files appear as they are written.
**In frame:** `manifest.md`, `README-for-buyer.md`, `terms.md`,
`media-briefs.md` appearing. A visible clock (Day 17's visual note asks for it).
The price gate asking you for the number. Then open `media-briefs.md` and point
at it for beat 4 — Higgsfield prompts written, not generated.
**Roll:** 6–10 min.
**Ruined by:** Stylising it. Day 17 explicitly says no Higgsfield footage, no
acted segments, no polish. Boring is the format.

### SR-13 — `/dp-launch` and the compliance sweep running
**Feeds:** Day 25 beat 5 · Day 18 slide 5 · **Day 27 beat 5** · Day 30
**Run:** `/dp-launch`, then let step 4's sweep run on camera:
`grep -rniE "guarantee[d]? (income|results|earnings)|make \$|passive income|…"`
over `launch/`.
**In frame:** `sales-page.md`, `emails.md`, `social.md`,
`promo-video-briefs.md`, `needs-user.md` written. The grep returning clean — or
returning a hit and you deleting the claim. Either outcome is good footage;
a hit you fix on camera is better.
**Roll:** 8–12 min.
**Ruined by:** Nothing, if you let a real hit stand and fix it. Cutting a hit out
because it looks bad is the mistake — Reel 4 is built on the opposite instinct.

### SR-14 — `/dp-schedule` gate, hard stop
**Feeds:** Day 18 slide 6 · Day 30 beat 2 (alternate to SR-09)
**Run:** `/dp-schedule` to the approval gate. Stop.
**In frame:** `schedule/postiz-plan.md` with channel, time+timezone, caption,
asset filename, link. The asset-existence check. The gate waiting.
**Roll:** 4–6 min.
**Ruined by:** Filming a queued post in a Postiz account you don't have. Read
point 3 at the top of this file.

---

## SESSION D — The admin panel
*Browser on `~/claudefleet/admin.html`. Short session, huge coverage — six of the
reels' screen-record shots live here. Do this **after** Session B so the board
has real cards on it.*

### SR-15 — The five-column board with cards in different stages
**Feeds:** Reel 1 shot 4 (0:16–0:24) · Reel 5 shot 4 (0:18–0:26) · Day 29 beat 1
**Run:** Open the panel, Import JSON, pick `~/claudefleet/pipeline.json`.
**In frame:** All five columns — Idea, Script, Render, Assemble, Scheduled — with
your real cards sitting across them. Reel 5's VO is "a card visibly sitting in
one column", so make sure at least one column has a card parked mid-pipeline.
**Roll:** 60 s, slow scroll, no cursor thrashing.
**Ruined by:** Filming the demo data. First open loads demo cards. Import your
own file first, or hit **Clear demo data** — a viewer who reads the orange banner
and sees you present demo cards as your pipeline is gone for good.

### SR-16 — Machine selector switching, stage names changing
**Feeds:** Reel 6 shot 2 (0:03–0:12) · Day 21 beat 2 · Day 19 (screen-record alt)
**Run:** Change the Machine dropdown from Autopilot Content Machine to Digital
Product Machine.
**In frame:** The column headers changing Idea/Script/Render/Assemble/Scheduled →
Validate/Build/Package/Launch Kit/Scheduled, and the Next-action box following.
**Roll:** 30 s. Do it twice so the editor has a clean version.
**Ruined by:** Switching too fast to read. The whole shot is the stage names
changing; hold two beats on each state.

### SR-17 — The same board, both machines, one install
**Feeds:** Reel 6 shot 3 (0:12–0:20) · Day 21 beat 1 · Day 29 beat 2
**Run:** With both machines carrying real cards, pan between them in the one
panel, one browser tab.
**In frame:** One window. One file path in the title bar. Two pipelines.
**Roll:** 45 s.
**Ruined by:** Two browser windows side by side. The claim is "same admin panel,
learn it once" — two windows visually contradicts the line being spoken.

### SR-18 — The run log, append-only, with a real `/cf-render` line
**Feeds:** Reel 2 shot 4 (0:20–0:27)
**Run:** Scroll the Run log section after Session B's real run.
**In frame:** The "Append-only" label and the log line your `/cf-render` actually
wrote, including whatever it says about shots and credits.
**Roll:** 30 s.
**Ruined by:** Typing `"/cf-render — 4 shots, 0 credits spent"` into the log form
to match the reel script. The panel lets you type into the log; that is for your
own notes, not for props. Use the real line and adjust the VO if needed.

### SR-19 — Service status tiles, with the honesty caption
**Feeds:** Day 27 beat 2 · Day 30 beat 3 · Reel 6 shot 4 (visual under the text card)
**Run:** Scroll to Service status. Show CLAUDE / HIGGSFIELD / POSTIZ, flip one
toggle, hit "Set to now", type a real note.
**In frame:** The three tiles and their roles. Your own note text.
**Roll:** 45 s.
**Ruined by:** Letting it read as monitoring. The panel cannot contact those
services — a green dot means *you said it was working*. Say that on camera; it is
the same disclosure Day 30 beat 3 makes about the three paid subscriptions.

### SR-20 — The demo banner firing, and Clear demo data
**Feeds:** Reel 4 shot 4 (0:19–0:27)
**Run:** Open a fresh copy of `admin.html` in a clean browser profile so local
storage is empty. The orange demo banner appears.
**In frame:** The banner, and the **Clear demo data** button, and the confirm.
Reel 4's VO is "it shipped with demo cards flagged as real data" — this shot is
the *fixed* behaviour, so the banner correctly firing is the point.
**Roll:** 45 s.
**Ruined by:** Recording in a profile that already has your state. Use a new
browser profile or a private window; do not delete your real pipeline to get the
shot.

### SR-21 — The Import round-trip: terminal writes, board catches up
**Feeds:** Day 26 beats 3+5 ("AFTER") · Day 29 beat 4 · Day 2 (optional close)
**Run:** Split screen or quick cut: run a skill in the terminal, then in the panel
click **Import JSON**, pick `~/claudefleet/pipeline.json`, watch the card move.
**In frame:** The card in its new column afterwards. For Day 26, the card sitting
in **Scheduled**.
**Roll:** 2 min.
**Ruined by:** Presenting it as live sync. There is none — the file is the
handoff. Show the Import click; it is one extra second and it is true.

### SR-22 — The cost tracker, empty on purpose *(optional)*
**Feeds:** Day 27 beat 2 · Day 30 beat 3
**Run:** Scroll to Cost tracker. Add one row with a real invoice amount you
actually paid, or leave it empty and say why.
**In frame:** No prices shipped. Your own currency.
**Ruined by:** Typing an invented subscription price to fill the table. You do
not know today's Claude / Higgsfield / Postiz pricing and the product
deliberately ships none. Empty is honest; invented is the exact failure mode.

---

## SESSION E — The real file tree and the artifacts
*Finder + your editor. Do this after B and C so the artifacts exist. Mostly
stills and slow scrolls — fast to shoot, feeds a lot.*

### SR-23 — The fleet home tree
**Feeds:** Day 2 beats 1–2 · Day 29 beat 4 · Day 21 beat 1
**Run:** Finder on `~/claudefleet`: `logs/`, `pipeline.json`, `admin.html`,
`content-machine/` with `assets notes scripts briefs posts schedule` inside.
Switch to list view so **Date Modified** shows.
**In frame:** The six subfolders (this is bug 2 from Reel 4, fixed). Real
modification timestamps from today.
**Roll:** 60 s.
**Ruined by:** A Finder sidebar full of your other clients' and projects' folder
names. Clean sidebar, or a new Finder window sized to exclude it.

### SR-24 — One agent employee file, scrolled in full
**Feeds:** Day 2 beat 2 · Day 23 beat 3
**Run:** Open `~/.claude/agents/cf-script-writer.md` (or any of the five) and
scroll the whole thing at readable speed.
**In frame:** The actual instructions. Day 2 beat 2 says: "no zooming past it."
**Roll:** 60–90 s.
**Ruined by:** Scrolling faster than it can be read. The point is that a viewer
could pause and read real content; speed makes it look like there is nothing
there.

### SR-25 — The real script file
**Feeds:** Reel 2 shot 2 (0:03–0:12) · Day 10 beat 3 · Day 2 beat 5
**Run:** Open `content-machine/scripts/<card-id>-script.md` from Session B.
**In frame:** The hook, the beat table with timecodes, the alternative hooks —
exactly the three things Reel 2's VO names.
**Roll:** 45 s slow scroll.
**Ruined by:** Opening a script you wrote by hand. This file has to be the output
of the run in SR-06 or the reel's premise ("I asked my content machine to write
the ad for itself") is false.

### SR-26 — The real Higgsfield brief
**Feeds:** Reel 2 shot 3 (0:12–0:20) · Day 3 beat 4 · Day 22
**Run:** Open `content-machine/briefs/<card-id>-higgsfield.md`.
**In frame:** The shot table (`shot-01`…), durations, camera and motion notes,
the **what must not appear in frame** column, the continuity block, the
regeneration log with its credits column. Reel 2's VO names "four shots, camera
moves, what must never appear in frame" — hold on that column.
**Roll:** 60 s.
**Ruined by:** Nothing much — this is the easiest strong shot in the project.
Just make sure the credits column is visibly zero or empty, because you have not
spent any.

### SR-27 — The `dp-validate` skill file on the gate line
**Feeds:** Reel 3 shot 3 (0:10–0:18)
**Run:** Open `~/.claude/skills/dp-validate/SKILL.md` and scroll to the
precondition and the **Human approval gate — mandatory** section.
**In frame:** The line stating no GO, no build, and the gate text: "You never
make this call."
**Roll:** 30 s.
**Ruined by:** Filming the repo copy instead of the installed copy while the VO
says "the real skill file". Either is real — just don't let a path on screen
contradict what you are saying.

### SR-28 — The package folder, four files
**Feeds:** Day 17 beat 2 · Day 18 slide 4 · Day 25 beat 2
**Run:** Open `product-machine/notes/<slug>/package/` and each of
`manifest.md`, `README-for-buyer.md`, `terms.md`, `media-briefs.md`.
**In frame:** `terms.md` on the 30-day money-back paragraph — the only guarantee
allowed anywhere in this account's content, so it is worth a held frame.
**Roll:** 90 s.
**Ruined by:** Skipping `terms.md`. It is the single most compliance-useful frame
you own.

### SR-29 — Carousel stills, five stage artifacts
**Feeds:** Day 18 slides 2–6 (the visual note requires a *real* screenshot per slide)
**Run:** One clean screenshot each of: `validation.md` (first line `DECISION: GO`),
`build/00-outline.md`, `package/manifest.md`, `launch/sales-page.md`,
`schedule/postiz-plan.md`.
**In frame:** Enough text to be legible when shrunk into a slide corner; crop out
window chrome and any path containing your username.
**Roll:** Stills, 10 min total.
**Ruined by:** Using an icon or a mockup because the real file looks plain. Day
18's note is explicit: real artifacts, not mockups or icons.

### SR-30 — Two folders, then one shared install
**Feeds:** Day 29 beats 1–2 (the bundle close before/after)
**Run:** "BEFORE": `content-machine/` and `product-machine/` shown as two
separate trees. "AFTER": the same two, both sitting inside the one
`~/claudefleet` with one `pipeline.json` and one `admin.html` above them.
**In frame:** The single shared `pipeline.json` and `admin.html` at fleet-home
root in the AFTER shot — that is literally the "one engine" claim.
**Roll:** 90 s.
**Ruined by:** Any countdown, "spots left", or price-strike overlay. Day 29 beat
5 bans it and the caption says so out loud.

### SR-31 — The machine folder on a plain desktop *(optional, credit-saver)*
**Feeds:** Day 1 beat 2
**Run:** A clean desktop with the `autopilot-content-machine` folder on it, then
open it.
**Why:** Day 1's visual note asks Higgsfield for a glowing folder icon, but beat 2
is literally "a folder titled 'Autopilot Content Machine' sitting on a desktop."
If credits are tight, the real folder costs nothing and is more on-brand for an
account whose whole argument is "I show you the folder."
**Roll:** 30 s.
**Ruined by:** A desktop covered in your other work. Empty desktop, one folder.

---

## SESSION F — The live storefront

### SR-32 — Full site scroll
**Feeds:** Day 27 beat 2 · Day 29 · Reel 6 (visual under the pricing text cards)
**Run:** Open `https://site-delta-hazel-30.vercel.app` in a clean browser window
and scroll top to bottom, unhurried.
**In frame, in order:** the hero, "One engine. Five stages.", **"Read this before
you buy"** (the requirements block naming the three paid subscriptions), the two
machine cards at $99, the $149 both-machines block, **"No testimonials here
yet"**, and the FAQ. That testimonials section is a genuine differentiator in
this niche — hold on it.
**Roll:** 90 s.
**Ruined by:** Clicking a buy button. The three Gumroad hrefs are still
placeholders; a click that goes nowhere on camera is worse than no click at all.
Re-shoot this once the links and the real domain are live — the technique guide
already flags that the ad reads more credibly with a real domain visible.

---

## SESSION G — Phone / native Instagram
*Capture on the phone, not the desktop. These are the only items you cannot
batch — they depend on real audience responses arriving.*

### SR-33 — Real poll and slider results
**Feeds:** Day 6 frame 2 · Day 12 · Day 20
**Run:** Post the story sticker, wait for results to land, then screenshot or
screen-record the results view.
**In frame:** The real split, whatever it is.
**Roll:** Stills.
**Ruined by:** Mocking up a result split because the real one is unflattering or
thin. All three days' visual notes ban it explicitly, and a 6-vote poll shown
honestly is worth more here than a fabricated landslide.

### SR-34 — Real DM and comment threads, identity-blurred
**Feeds:** Day 7 beat 1
**Run:** Screen-record scrolling the week's actual keyword replies and comments.
**In frame:** The questions, legible. Names, handles and profile photos blurred.
**Roll:** 60 s.
**Ruined by:** Blurring so aggressively the frame is unreadable, or writing
yourself DMs from a second account. Day 7's note ties this to the
fabricated-testimonial rule: these are questions, never presented as praise.

---

## SESSION H — The bug receipts, from git
*This is Reel 4 — the reel `production-scripts.md` calls the most valuable and
least obvious in the set. The three bugs are already fixed, in commit `ae2b423`.*

**Do not re-break the product to "discover" a bug on camera.** Staging a
rediscovery of a bug you already fixed is a fake screen recording wearing an
honest costume. Git already holds the evidence; film the evidence.

### SR-35 — The fix commit and its diff
**Feeds:** Reel 4 shots 2–3 (0:03–0:19) · Day 7 beat 4
**Run:** `git show --stat ae2b423`, then
`git show ae2b423 -- products/_engine/INSTALL.md`, scrolled to the two hunks.
**In frame:** The commit message naming three defects found by installing from
the shipped zip. The `-export FLEET_SRC=".../claudefleet-content-machine"` line
against the `+` line naming `autopilot-content-machine`. The
`-mkdir … {assets,notes}` line against the `+` version creating all six
directories. Real commit date in the header.
**Roll:** 90 s.
**Ruined by:** Cropping the commit date and hash out. They are what make it a
record instead of a screenshot.

### SR-36 — Bug 1 reproduced honestly *(optional)*
**Feeds:** Reel 4 shot 2 (0:03–0:11)
**Run:** Paste the *old* `FLEET_SRC` line and run its `ls`. It errors, genuinely,
because no zip produces that folder name.
**In frame:** The command, the error, then the recovery line the fix added:
`ls ~/Downloads | grep -iE 'content-machine|product-machine'`.
**Roll:** 45 s.
**Ruined by:** Saying "watch me find this bug." You are demonstrating a fixed
bug, not finding one. Reel 4's VO is past tense — keep it there.

### SR-37 — `verify-coherence.sh` running green
**Feeds:** Reel 4 shot 5 (0:27–0:34) · Day 28 point 3
**Run:** `bash products/verify-coherence.sh`
**In frame:** The ticks scrolling per machine, and the final
`COHERENCE OK — docs, seed data and panel all match the shipped executables.`
Include the seed-data checks, which name the exact three bugs the reel just
described.
**Roll:** 45 s.
**Ruined by:** Filming it after an edit that makes it fail, then cutting the
failure. If it fails, fix the product first — that is the whole thesis of this
reel.

---

## Setup checklist — before any recording

**Type size.** Bump the terminal and editor font until a full command line is
comfortable to read at arm's length *on a phone*. Test it: record five seconds,
AirDrop it, watch it on your phone. If you squint, it is too small, and no
amount of editing fixes it afterwards. Roughly double your normal working size is
the usual landing spot.

**Window shape for the 9:16 crop.** The delivery frame is 1080×1920. Do not
record a wide desktop and hope: resize the window you are filming to a tall,
narrow shape and record just that window, so the crop keeps the command line
instead of throwing half of it away. Keep the action in a centred column —
anything at the far left or right edge is gone after the crop.

**Notifications off.** Do Not Disturb / Focus on. Quit Mail, Slack, Messages,
calendar apps. Silence the terminal bell. One banner sliding in during SR-08
destroys the one shot that has to be unbroken.

**Hide what isn't yours to show.** Before you roll:
- Shell prompt — trim it if it carries a hostname or path you'd rather not publish.
- Finder sidebar and browser bookmarks bar — use a clean window or a fresh
  browser profile. Other clients' folder names are the most common leak.
- Browser tab titles, open tab strip, autofill dropdowns.
- Never film the contents of `~/.claude/settings.json` — other plugins' hooks and
  possibly credentials live there. `jq '.hooks | keys'` output only.
- `history`, and any command containing a key or token.
- Menu-bar extras that name a VPN, a device, or an account.

**But leave the real clocks and timestamps in.** This is the part people cut by
instinct and should not. The menu-bar clock, the ISO timestamps in
`logs/run.log`, Finder's Date Modified column, the git commit date, the on-screen
stopwatch in SR-01 — a recording with consistent, moving, mutually-agreeing
timestamps is very hard to fake and reads instantly as real. Day 17, Day 22 and
Day 26 all ask for a visible clock by name. Print `date` at the top of a long
take if there is no clock in frame.

**One more pass:** open the recording before you build anything on it, and watch
it once at full size looking only for things that shouldn't be there. Cheaper
than discovering it in the edit.

---

## The honesty rules for this footage

Restated from `content-system.md` because this is the exact class of mistake the
niche judges on, and a screen recording is where it happens.

1. **Never stage a fake dashboard.** If a UI is on screen it is real and it is
   yours. The admin panel ships with demo data — import your own file or clear it
   before you film. Presenting demo cards as your pipeline is the same offence as
   a mockup, and the panel's own orange banner will be in frame contradicting you.
2. **Never fabricate a balance, a revenue screen, or an income screenshot.** This
   is flagged in `content-system.md` as the #1 scam tell this audience is trained
   to spot. Day 30 beat 5 makes a virtue of not having one: *"I don't have a
   revenue screenshot, because I don't have one."*
3. **Never present sped-up footage as unedited.** If you speed it, say so, in the
   words Day 26 already scripts: **"This is sped up — it is not cut."** Speed the
   playback; never remove a step. "Unedited" and "single take" are claims, and
   they are checkable by anyone who counts the cuts.
4. **Never invent a log line, a poll result, a price, or a credit count** to match
   a script. If the real output disagrees with the script, the script changes.
5. **Never re-break the product to discover a bug on camera.** Fixed bugs are
   filmed from git (Session H), in past tense.
6. **Never caption an acted bit as a real customer.** Day 15's Skeptic and Day
   25's Client are played characters — both days already carry a
   "(dramatization)" production note and an on-camera break of the illusion. The
   real screen-record that follows the bit is what grounds it.
7. **No fake urgency.** No countdown, no "3 spots left", no price-strike theatre —
   including as an overlay in the edit. Day 29 says it out loud: "no countdown, no
   fake spots left — it's just available."
8. **No guarantee except the 30-day money-back refund.** That one is real, it is
   in the shipped `terms.md` (SR-28), and it is the only one that may appear.
9. **The service tiles are a notebook, not a monitor.** Do not let a green dot
   imply the panel is checking anything. It is checking that you said so.
10. **Blur identities, keep the substance.** In SR-34, names and handles go;
    questions stay legible. A fully redacted frame reads as invented.

---

## Reuse map — record once, cut many

| Capture | Also feeds | Notes |
|---|---|---|
| **SR-04** master content run | Days 26, 27, 11, 8, 4, 2, 22 and Reel 2 | Roll one long take; SR-05–SR-09 are cut-outs of it. Highest leverage capture in the project. |
| **SR-01** timed install | Day 5 · Reel 4 shot 1 | The unzip beat in Reel 4 pulls straight from Day 5's take. |
| **SR-06** `/cf-script` | Days 2, 4, 8, 10, 11 · Reel 2 shot 1 | Five days, one command, one recording. |
| **SR-07** `/cf-render` | Days 3, 4, 8, 10, 11 · Day 22 (with SR-08) | The credits disclosure frame is reusable everywhere the price comes up. |
| **SR-09** gate halting | Days 4, 11, 26 · **Day 30 beat 2** | The one shot that proves the product does *not* do something. |
| **SR-11** validate→build | Day 24 · Day 18 slides 2–3 | Stills for the carousel come from this take's artifacts. |
| **SR-12** `/dp-package` | Day 17 · Day 18 slide 4 · Day 25 beat 5 | Day 25's "real screen-record snippet" is a 3-second pull from here. |
| **SR-15** the board | Reel 1 shot 4 · Reel 5 shot 4 · Day 29 | Two of six reels' only screen-record shot. Shoot it clean once. |
| **SR-16 + SR-17** panel, both machines | Reel 6 shots 2–3 · Days 19, 21, 29 | Reel 6's two screen-record shots and the whole "one engine" week. |
| **SR-23** fleet tree | Days 2, 21, 29 | Same 60 seconds under three different voiceovers. |
| **SR-25 + SR-26** script + brief files | Reel 2 shots 2–3 · Days 3, 10, 22 | Reel 2 is entirely SR-06, SR-25, SR-26, SR-18 — four captures, one reel. |
| **SR-32** site scroll | Days 27, 29 · Reel 6 | Re-shoot after the Gumroad links and real domain land. |
| **SR-35 + SR-37** git + coherence | Reel 4 · Day 7 beat 4 · Day 28 | Day 30 beat 5 calls back to Day 7's clip — cut it from this footage, labelled as a callback, not replayed as new. |

**Shoot order if you only get two sittings:** Session A then Session B (that is
Days 2, 3, 4, 5, 8, 11, 22, 26, 27 and Reel 2 covered). Then Session D + E in one
short sitting (Reels 1, 4, 5, 6 and Days 18, 21, 29). Sessions C, F, G and H fill
in after.

**If Higgsfield credits run out entirely:** the days that still ship unchanged
are every screen-record day above — Days 2, 3, 4, 5, 7, 8, 11, 15, 17, 21, 22,
24, 26, 27, 28, 29, 30 and Reels 2 and 4 — because none of them were ever going
to spend a credit. Day 1's generated folder shot has a free substitute in SR-31,
and Day 21's cutaway is already marked optional in `week-3.md` ("cut straight
from that into the real recording" — so cut straight into it). What you cannot
substitute is Ava: Days 10, 14, 16, 19, 23 need a generated character and have no
screen-record fallback. Spend there first.
