# Start here — your first hour

By the end of this page you have the machine installed, an intake filled in, and one real
card moved through two stages (**Idea → Script**) with your own niche and offer.

Stages 1 and 2 need **only Claude Code**. You do not need Higgsfield or Postiz today —
set those up tomorrow, before you run `/cf-render`. Do the steps in this order; the
numbers are minutes.

---

## 1. (2 min) Check the three prerequisites

```zsh
claude --version    # Claude Code, working, on a paid plan or API billing
python3 -V          # required by the hooks
jq --version        # only needed for the automatic hook merge; brew install jq
```

If `claude --version` fails, stop and fix that first — nothing here works without it. If
`jq` is missing you can still continue (you'll merge hooks by hand in step 3).

## 2. (1 min) Point the installer at your unzipped folder

Open a terminal and edit the first line to the real path:

```zsh
export FLEET_SRC="$HOME/Downloads/autopilot-content-machine"
export MACHINE_DIR="content-machine"
export CLAUDEFLEET_HOME="$HOME/claudefleet"
ls "$FLEET_SRC" && ls "$FLEET_SRC/_engine"     # both must list files
```

If either `ls` errors, `FLEET_SRC` is wrong. Fix it before continuing — a wrong path here
is the single most common reason this install "doesn't work".

## 3. (6 min) Run the install

Open `_engine/INSTALL.md`. **Read `_engine/hooks/README.md` first** — the hooks run shell
commands on your machine, and you should know what they do before merging them. Then copy
the single code block under *"2–6. The whole install, copy-pasteable"* and paste it into
the same terminal window you used in step 2.

It creates `~/claudefleet/`, seeds `pipeline.json`, copies agents to `~/.claude/agents/`,
skills to `~/.claude/skills/<name>/SKILL.md`, the dashboard to `~/claudefleet/admin.html`,
backs up your `settings.json`, and merges the three hooks. No jq? Use the manual merge in
the same file.

## 4. (3 min) Verify before you build on it

```zsh
ls ~/.claude/skills/*/SKILL.md                  # five cf-* skills, each with a SKILL.md
ls ~/.claude/agents                             # the machine's agent files
jq '.hooks | keys' ~/.claude/settings.json      # must include SessionStart, PostToolUse, Stop
jq -r '.hooks.SessionStart[-1].hooks[0].command' ~/.claude/settings.json | zsh
```

The last command should print a one-line pipeline snapshot. Nothing printed means the
hook can't find `~/claudefleet/pipeline.json`.

## 5. (10 min) Fill in the intake — the highest-leverage 10 minutes here

Everything the machine writes is downstream of this file. Pick a short slug for this
business or offer (letters, numbers, hyphens — e.g. `detailing-co`); you'll pass it as the
first argument to `/cf-ideas` every time. Create the file:

```zsh
mkdir -p ~/claudefleet/content-machine/notes
${EDITOR:-nano} ~/claudefleet/content-machine/notes/<your-offer-slug>-intake.md
```

Answer these eight questions in plain sentences. Be specific; "small businesses" produces
generic output, "single-location dental practices in mid-size US cities" does not.

1. **Who exactly is the audience?** Job, situation, and what they're trying to get done.
2. **What is the offer?** The one thing you want them to buy, book or join.
3. **What do they believe today that is wrong or costly?** The wedge for every hook.
4. **What proof do you actually have?** Only things that are true and yours — cases,
   before/afters, credentials, first-hand experience. If it's thin, say so; the machine
   will write around it rather than invent it.
5. **Which platforms and what format?** e.g. IG Reels + TikTok, 9:16, 20–35s.
6. **Voice and hard bans.** Tone, and the words, claims and formats you never use.
7. **Compliance limits.** Anything you're legally or contractually barred from claiming
   (health, finance, legal, client NDAs). List it here or it will show up in a script.
8. **Cadence target.** Posts per week you actually intend to sustain.

Save it. This file gets read at the top of every stage.

## 6. (2 min) Open the dashboard

```zsh
open ~/claudefleet/admin.html          # macOS   (Linux: xdg-open)
```

It opens with demo data. Click **Import JSON**, choose `~/claudefleet/pipeline.json`, and
you're looking at your own five columns. The panel cannot write to disk — after any edit
you make *in the panel*, click **Export JSON** and move the download back:

```zsh
mv ~/Downloads/pipeline.json ~/claudefleet/pipeline.json
```

Rule that keeps both sides honest: **Import before you look, Export after you edit**, and
never leave unexported panel edits sitting while Claude is working the same file.

## 7. (1 min) Start the session from the fleet home

```zsh
cd ~/claudefleet && claude
```

Start here every time. `pipeline.json` lives here, and the `Stop` hook only logs sessions
whose working directory is inside it.

## 8. (10 min) Move your first card: `/cf-ideas`

In the session, type (using the slug you picked in step 5):

```
/cf-ideas <your-offer-slug>
```

It reads your intake, and the angle scout agent returns a batch of angles and hooks with
the reasoning behind each. **Your job is to cut.** Kill anything that is off-voice, makes
a claim you can't back, or that you'd be embarrassed to post. Approve the survivors —
those become cards in **Idea**. Three to five approved hooks is a good first batch; nine
is not better.

## 9. (15 min) Move it again: `/cf-script`

Pick one approved card and run:

```
/cf-script
```

You get a hook line, the full script, and three alternative hooks. Read it out loud with a timer
— if it doesn't land in your target duration at your natural speaking pace, say so and
have it tightened. Check it against intake answers 4, 6 and 7 (proof, bans, compliance).
Approve, and the card sits in **Script**, ready for `/cf-render` tomorrow.

## 10. (2 min) Confirm the state actually moved

```zsh
jq '[.cards[] | {id, stage, title}]' ~/claudefleet/pipeline.json
tail -5 ~/claudefleet/logs/run.log
```

Your card's `stage` index should have advanced, and the log should show today's writes.
Re-import into the dashboard to see it on the board. That's the loop — everything after
this is the same four moves with different work.

---

## Tomorrow, before `/cf-render`

1. Create your **Higgsfield** account and fund it. Generate one throwaway clip by hand so
   you know the interface before the machine hands you prompts.
2. Stand up **Postiz** (hosted or self-hosted) and connect one social account end to end.
   Post one manual test through it. A broken connection discovered at schedule time costs
   you a publishing slot.
3. Verify current pricing on each vendor's own pricing page before you commit — see
   `04-requirements-and-costs.md`.
4. Then run `/cf-render`, `/cf-assemble`, `/cf-schedule` on the card you scripted today,
   and read `03-operating-runbook.md` for the ongoing rhythm.

## If something didn't work

| Symptom | Cause / fix |
|---|---|
| `/cf-ideas` isn't recognized | Skills didn't land as directories. Every skill must be `~/.claude/skills/<name>/SKILL.md`. Re-run step 3, restart Claude Code. |
| Snapshot line prints nothing | `pipeline.json` missing or malformed: `ls ~/claudefleet/pipeline.json` then `jq -e . ~/claudefleet/pipeline.json`. |
| `run.log` never appears | Hooks not merged, or you started the session outside `~/claudefleet`. See `_engine/hooks/README.md`. |
| Panel shows demo data | You didn't Import. Click **Import JSON** and pick `~/claudefleet/pipeline.json`. |
| Panel edits vanish | You closed the tab without **Export JSON**, or the browser blocks storage on `file://`. Serve it: `cd ~/claudefleet && python3 -m http.server 8787`. |
| Panel and `pipeline.json` disagree on stage names | The panel's built-in config wins. Edit the `stages` array in `pipeline.json` to `["Idea","Script","Render","Assemble","Scheduled"]`. |
| Output is generic | The intake is generic. Go back to step 5 and get specific; nothing downstream fixes a vague intake. |
