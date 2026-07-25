# Autopilot Content Machine — The Build Prompt Pack

Seventeen prompts. Nine build the machine on your computer. Eight run it forever after.

Paste them into Claude Code **in order**, one at a time, from your fleet home
(`cd ~/claudefleet && claude`). Fill every `[BRACKETED_VARIABLE]` before you hit enter —
a prompt with brackets left in it will produce a card called `[NICHE]` and you will have
to redo the stage.

## What this pack assumes you already have

- **Claude Code**, installed and authenticated (`claude --version` prints a version).
  Requires a paid Claude plan or API billing — an ongoing monthly cost. Check current
  pricing on Anthropic's own pricing page.
- **A Higgsfield account** with generation credit available. Higgsfield is where the video
  and image assets actually get made; this machine writes the briefs, it does not render
  media and cannot spend credits you have not bought. Check current pricing on
  Higgsfield's own pricing page.
- **A Postiz account** — hosted, or self-hosted (it is open source). This is where posts
  get scheduled and published, connected to your own social accounts. Check current
  pricing on Postiz's own pricing page, or run your own instance.
- `python3` and (optionally) `jq`, per `_engine/INSTALL.md`.

Without all three services the machine does not run. There is no free path and this
product does not include access to any of them.

## The engine, in one paragraph

`~/claudefleet/pipeline.json` is the single source of truth. It holds `stages`
(`Idea`, `Script`, `Render`, `Assemble`, `Scheduled`), a `cards` array where each card is
one piece of content with a `stage` index 0–4, a `log` array of runs, a `costs` array you
fill from your own invoices, and a `services` block. Five slash commands move a card one
stage to the right: `/cf-ideas` → `/cf-script` → `/cf-render` → `/cf-assemble` →
`/cf-schedule`. Five subagents do the specialist work inside those stages. Three hooks log
what happened. One local HTML file shows you the board.

## Reading the stage names

| Index | Stage | A card sitting here has… |
|---|---|---|
| 0 | Idea | an angle and a hook, nothing written |
| 1 | Script | a finished short-form script + alternative hooks |
| 2 | Render | Higgsfield generation briefs, assets not yet made |
| 3 | Assemble | rendered assets in `assets/`, QC'd, captions final |
| 4 | Scheduled | queued in Postiz with a date, time and channel |

---

# PART A — BUILD PROMPTS

Run these once. In order. Do not skip Prompt A9.

---

### Prompt A1 — Preflight and scaffold

**When you run it:** first, in a fresh Claude Code session, before anything else exists.
**What you get back:** a verified `~/claudefleet/` tree, `admin.html` in place, and a written preflight report naming anything missing.

```
You are setting up the ClaudeFleet Autopilot Content Machine on my computer. Work only
inside the two paths I name below — do not touch anything else in my home directory.

INPUTS
- Unzipped product folder: [FLEET_SRC_PATH]   (e.g. ~/Downloads/claudefleet-content-machine)
- Fleet home to create: [CLAUDEFLEET_HOME]    (default: ~/claudefleet)

STEPS
1. Run a preflight and report each result as PASS or FAIL with the actual output:
   claude --version ; python3 -V ; jq --version ; ls [FLEET_SRC_PATH]/_engine
   jq is optional — mark it OPTIONAL-MISSING rather than FAIL if absent.
2. Create this tree, without overwriting anything that already exists:
   [CLAUDEFLEET_HOME]/logs
   [CLAUDEFLEET_HOME]/content-machine/scripts
   [CLAUDEFLEET_HOME]/content-machine/briefs
   [CLAUDEFLEET_HOME]/content-machine/assets
   [CLAUDEFLEET_HOME]/content-machine/notes
   [CLAUDEFLEET_HOME]/content-machine/posts
   [CLAUDEFLEET_HOME]/content-machine/schedule
3. Copy [FLEET_SRC_PATH]/_engine/admin-panel/index.html to [CLAUDEFLEET_HOME]/admin.html.
4. Do NOT create pipeline.json yet — Prompt A3 writes it. Confirm it does not exist.
5. Print the resulting tree with `find [CLAUDEFLEET_HOME] -maxdepth 2`.

OUTPUT FORMAT
A short PREFLIGHT table (check | result | evidence), then the tree, then a section
"BLOCKERS" listing anything that must be fixed before Prompt A2 — or the single word NONE.

CONSTRAINT
If any PASS check actually failed, say so plainly and stop. Do not create directories to
paper over a missing dependency, and do not guess at versions you did not run.
```

**If it goes wrong:** `claude --version` failing usually means Claude Code is not on PATH — reinstall it before continuing; nothing downstream works without it.

---

### Prompt A2 — Intake note

**When you run it:** immediately after A1, once per business or offer you run through the
machine. Run it again with a new `[OFFER_SLUG]` for each additional offer.
**What you get back:** `content-machine/notes/[OFFER_SLUG]-intake.md` — the file every
later stage reads.

```
You are the strategist for my content machine. Write my intake note. Every later stage
(/cf-ideas, /cf-script, /cf-render, /cf-assemble, /cf-schedule) reads this file — it is
the machine's only config file — so it must be specific enough to constrain a writer who
has never met me. Prompts A7 and A8 will come back and deepen two of its sections.

INPUTS — use only what I give you here. Do not research, invent or embellish.
- Offer slug, short and filename-safe: [OFFER_SLUG]
- Business / creator name: [BUSINESS_NAME]
- Niche, in one sentence: [NICHE]
- The offer I want content to lead toward: [OFFER]
- Who it is for, specifically: [AUDIENCE]
- Where they hang out and what they already believe: [AUDIENCE_CONTEXT]
- Proof I actually own — my own results, my own client work, my own screenshots, nothing
  borrowed or invented: [PROOF_OWNED]
- What I've already posted, so nothing repeats: [ALREADY_POSTED]
- Three things I say that competitors do not: [DIFFERENTIATORS]
- Words, claims and topics I will never use: [BANNED_LIST]
- Visual style in plain language: [VISUAL_STYLE]
- Platforms I post to: [PLATFORMS]
- Target clip length: [CLIP_LENGTH] seconds

STEPS
1. Write [CLAUDEFLEET_HOME]/content-machine/notes/[OFFER_SLUG]-intake.md with these sections:
   Identity · Audience (with 3 named pains in their words, drawn only from my inputs)
   · Offer and the one action every post drives toward · Proof I own · What's already been
   posted · Voice (5 rules, each with a one-line DO and DON'T example written in my voice)
   · Visual grammar (colour, pacing, framing, on-screen text policy — Prompt A7 rewrites
   this section in full) · Banned list · Compliance rules · Distribution (start with just
   my platforms from [PLATFORMS]; Prompt A8 expands this into channels, timezone, cadence
   and the Postiz pre-flight checklist).
2. Under Compliance rules, write these three verbatim and non-negotiable: no invented
   statistics or third-party claims; no income or results promises of any kind; any number,
   price or testimonial must come from me and be marked [SOURCE: owner-supplied].
3. End with an "UNKNOWNS" list: every field I left thin, phrased as a question to me.

CONSTRAINT
Do not fill an UNKNOWN with a plausible guess. A blank I can fill in ninety seconds is
worth more than a confident fabrication that poisons a hundred scripts.
```

**If it goes wrong:** a vague `[NICHE]` ("fitness") produces generic voice rules — rewrite it as a sentence naming who and what ("strength coaching for desk workers over 40") and rerun.

---

### Prompt A3 — Seed pipeline.json

**When you run it:** after the intake note exists.
**What you get back:** `~/claudefleet/pipeline.json`, valid, seeded with your machine and three real starter cards at stage 0.

```
Create the pipeline state file for my content machine. This file is the single source of
truth for the whole business — the admin panel imports it, the hooks read it, and every
skill mutates it. Get the key names exactly right.

INPUTS
- Fleet home: [CLAUDEFLEET_HOME]
- Currency for cost tracking: [CURRENCY]
- Offer slug: [OFFER_SLUG]
- Read [CLAUDEFLEET_HOME]/content-machine/notes/[OFFER_SLUG]-intake.md for niche and offer.

STEPS
1. Read [FLEET_SRC_PATH]/_engine/pipeline.example.json to learn the exact schema.
2. Write [CLAUDEFLEET_HOME]/pipeline.json with:
   - "schema": 1, "demo": false, "machine": "content", "selectedStage": 0
   - "currency": "[CURRENCY]"
   - "stages": ["Idea","Script","Render","Assemble","Scheduled"]
   - "services": claude/higgsfield/postiz, each with connected:false, lastRun:null and a
     note naming what I still have to connect. Set claude.connected to true only.
   - "cards": exactly three, ids c-0001..c-0003, machine "content", stage 0, ISO-8601
     "created" timestamps, and titles that are three genuinely different content ANGLES
     for my niche taken from the intake note — not placeholders. Each gets a "notes" field
     stating the audience pain it hits and why it suits [PLATFORMS].
   - "log": one entry, id l-0001, text "setup — pipeline seeded from the intake note"
   - "costs": three entries for Claude, Higgsfield and Postiz for the current month with
     "amount": 0 and a note saying "fill from your own invoice".
3. Validate: run `python3 -m json.tool [CLAUDEFLEET_HOME]/pipeline.json > /dev/null` and
   paste the result. Then print a stage-count summary.

CONSTRAINT
Every cost amount stays 0. You do not know what Claude, Higgsfield or Postiz charge me —
never write a number into "costs" that I did not give you, and never quote vendor pricing.
```

**If it goes wrong:** if `json.tool` errors, a smart quote or trailing comma got in — have Claude rewrite the whole file rather than patching it.

---

### Prompt A4 — Install and adapt the five skills

**When you run it:** after pipeline.json validates.
**What you get back:** five directories under `~/.claude/skills/` each containing a `SKILL.md` adapted to your niche.

```
Install the five ClaudeFleet content-machine skills and adapt each one to my business.
A skill is a Claude Code slash command: a markdown file with YAML frontmatter containing
a description and an argument-hint (no name key — Claude Code takes the command's name
from the filename, e.g. cf-script.md becomes /cf-script), saved as
~/.claude/skills/<name>/SKILL.md.

INPUTS
- Source skills: [FLEET_SRC_PATH]/skills/
- Intake note: [CLAUDEFLEET_HOME]/content-machine/notes/[OFFER_SLUG]-intake.md
- Fleet home: [CLAUDEFLEET_HOME]

STEPS
1. Copy each source skill to ~/.claude/skills/<name>/SKILL.md for: cf-ideas, cf-script,
   cf-render, cf-assemble, cf-schedule. If a source file is missing, write it from the
   stage contract in step 3 rather than skipping it.
2. Adapt each SKILL.md so it: reads the intake note before doing anything; reads
   [CLAUDEFLEET_HOME]/pipeline.json; operates on one card at a time identified by id;
   on success bumps that card's "stage" index by exactly 1, appends to its "notes", and
   pushes a "log" entry with ts, machine "content", the new stage index, and text naming
   the command that ran and what it produced.
3. Enforce these stage contracts inside the skill bodies:
   /cf-ideas    writes new cards at stage 0. Never advances an existing card.
   /cf-script   0 -> 1. Artifact: content-machine/scripts/<card-id>-script.md
   /cf-render   1 -> 2. Artifact: content-machine/briefs/<card-id>-higgsfield.md
   /cf-assemble 2 -> 3. Artifact: content-machine/posts/<card-id>-post.md. Requires asset
                files present in content-machine/assets/<card-id>/, and
                content-machine/assets/<card-id>/final.mp4 before advancing.
   /cf-schedule 3 -> 4. Artifact: content-machine/schedule/<card-id>-postiz.md. Requires
                my explicit approval in the session before writing.
4. Add to every skill: "Never advance a card past a stage whose artifact does not exist
   on disk. Report the missing file and stop."
5. List the installed skills with `ls ~/.claude/skills/*/SKILL.md`.

CONSTRAINT
Frontmatter must parse as YAML with a non-empty description, or Claude Code silently
ignores the skill. Print the frontmatter block of each file you wrote so I can see it.
```

**If it goes wrong:** a skill that does not appear after restarting Claude Code is almost always a file saved as `~/.claude/skills/cf-script.md` instead of `~/.claude/skills/cf-script/SKILL.md`.

---

### Prompt A5 — Install and adapt the five agents

**When you run it:** after the skills are installed.
**What you get back:** five files in `~/.claude/agents/` — the specialists your skills delegate to.

```
Install the five content-machine subagents and tune them to my brand. A Claude Code
subagent is ~/.claude/agents/<name>.md with YAML frontmatter carrying name, description
(containing at least two <example> blocks), tools, and model.

INPUTS
- Source agents: [FLEET_SRC_PATH]/agents/
- Intake note: [CLAUDEFLEET_HOME]/content-machine/notes/[OFFER_SLUG]-intake.md
- Model preference for volume work: [MODEL_FOR_VOLUME]  (e.g. sonnet)

STEPS
1. Install these five, writing any that are missing from source:
   cf-angle-scout          — researches and triages short-form content angles from the
                             intake note, each tagged OWNED, OBSERVED (with URL and date)
                             or ASSUMPTION. Used by /cf-ideas.
                             tools: Read, Write, Grep, Glob, WebSearch, WebFetch.
   cf-script-writer        — turns one approved angle into a timed short-form script:
                             hook, beats, spoken lines, on-screen text, CTA and three
                             alternative hooks. Used by /cf-script.
                             tools: Read, Write, Edit, Glob.
   cf-shot-designer        — converts a finished script into a shot-by-shot Higgsfield
                             generation brief with a continuity block. Used by /cf-render.
                             tools: Read, Write, Edit, Glob.
   cf-caption-writer       — writes the per-platform captions, hashtags, alt text and
                             first-comment copy for a rendered card, and runs the claim
                             check over every line it produces. Used by /cf-assemble.
                             tools: Read, Write, Edit, Glob.
   cf-distribution-planner — turns an approved post pack into a Postiz posting plan, one
                             slot per platform, checked against cards already scheduled so
                             slots don't collide. Used by /cf-schedule.
                             tools: Read, Write, Edit, Glob.
2. Give every agent a description with <example> blocks showing a realistic trigger from
   MY niche (taken from the intake note), not a generic one.
3. Set model: [MODEL_FOR_VOLUME] on the four producing agents. cf-distribution-planner
   ships on a cheaper model (haiku) since slot arithmetic doesn't need a stronger one —
   leave it there unless your batch sizes say otherwise.
4. Every agent's hard rules must forbid inventing a statistic, price, ranking, testimonial,
   result, follower count or income claim not marked [SOURCE: owner-supplied], and forbid
   anything on the intake note's banned list. The claim check itself lives inside the skill
   that calls the agent — /cf-script and /cf-assemble both check the returned draft
   themselves and reject and re-request before writing anything — there is no separate
   reviewer agent.
5. Print each file's frontmatter and confirm with `ls ~/.claude/agents/`.

CONSTRAINT
Do not invent a sixth agent or a reviewer role that doesn't exist in [FLEET_SRC_PATH]/agents/.
If a source file is missing, copy it faithfully rather than improvising a replacement.
```

**If it goes wrong:** if `/agents` does not list them after a restart, the `description` field is missing or the `<example>` blocks broke the YAML — quote them.

---

### Prompt A6 — Wire the hooks

**When you run it:** after agents are installed. Read `_engine/hooks/README.md` first — hooks run shell commands on your machine.
**What you get back:** a merged `~/.claude/settings.json` with a timestamped backup beside it, and proof the session-start snapshot prints.

```
Merge the three ClaudeFleet hooks into my Claude Code settings without destroying what is
already there. My settings.json may already contain hooks from plugins and my own setup.

INPUTS
- Hook source: [FLEET_SRC_PATH]/_engine/hooks/settings-hooks.json
- Fleet home: [CLAUDEFLEET_HOME]

STEPS
1. Show me the current contents of ~/.claude/settings.json before touching it. If it has
   an existing "hooks" object, list every event key it already uses.
2. Back it up: cp ~/.claude/settings.json ~/.claude/settings.json.bak.$(date +%Y%m%d%H%M%S)
   and confirm the backup file exists on disk.
3. Merge, APPENDING to existing arrays — never replacing the hooks object, never dropping
   an unrelated top-level key. Use the jq recipe from _engine/INSTALL.md if jq is present;
   otherwise edit by hand and show me the diff. Write to a temp file, validate it parses,
   and only then move it into place.
4. If [CLAUDEFLEET_HOME] is not the default ~/claudefleet, add a top-level
   "env": { "CLAUDEFLEET_HOME": "[CLAUDEFLEET_HOME]" } key so hooks launched from a GUI
   still find the pipeline.
5. Verify, and paste the raw output of each:
   jq '.hooks | keys' ~/.claude/settings.json     -> must include SessionStart, PostToolUse, Stop
   jq -r '.hooks.SessionStart[-1].hooks[0].command' ~/.claude/settings.json | zsh
   The second must print a ClaudeFleet line with my five stage names and counts.

OUTPUT FORMAT
Before/after key lists, the backup filename, then the two verification outputs verbatim.

CONSTRAINT
If the merged file fails to parse, restore the backup immediately and tell me — do not
attempt a second merge on top of a broken file.
```

**If it goes wrong:** the snapshot printing nothing means the hook cannot find `pipeline.json` — check `ls $CLAUDEFLEET_HOME/pipeline.json` and the `env` key from step 4.

---

### Prompt A7 — Put your visual grammar in the intake note

**When you run it:** once, after hooks are live; again whenever your visual style changes.
**What you get back:** an upgraded **Visual grammar** section inside
`content-machine/notes/[OFFER_SLUG]-intake.md` — the constraints `/cf-render` hands to the
`cf-shot-designer` agent on every card.

> **Why it goes in the intake note and not a separate spec file.** `/cf-render` passes
> "the visual constraints from the intake note" to `cf-shot-designer`. The intake note is
> the only config file the skills actually read. A separate `render-spec.md` would sit
> there unread. Note also that the shot table, the prompt paragraph order and the
> regeneration log are already fixed by `cf-shot-designer`'s own output contract — do not
> redefine them here, or you will be writing a template that fights the agent. What
> belongs here is only what is genuinely *yours*: the look, the limits of your account,
> and your text policy.

```
Update my intake note's Visual grammar section so the shot designer is properly
constrained. Edit the existing file in place; do not create a new one and do not touch
any other section.

INPUTS
- Intake note to edit: [CLAUDEFLEET_HOME]/content-machine/notes/[OFFER_SLUG]-intake.md
- Controls and options my Higgsfield account actually gives me: [HIGGSFIELD_FEATURES_I_HAVE]
- Aspect ratio: [ASPECT_RATIO]        - Shots per clip: [SHOTS_PER_CLIP]
- Clip length: [CLIP_LENGTH] seconds  - Look in one sentence: [LOOK]

STEPS
1. Rewrite the "Visual grammar" section of the intake note so it contains, in order:
   a) A HOUSE STYLE block derived from [LOOK], written as concrete nouns a generator can
      act on — subject, wardrobe, palette, lighting, location type, time of day. This is
      the block every shot prompt will inherit, so it must be specific enough that two
      different clips look like the same channel.
   b) FORMAT: aspect ratio [ASPECT_RATIO], target clip length [CLIP_LENGTH]s, and roughly
      [SHOTS_PER_CLIP] shots per clip. Say plainly that more shots costs more credits.
   c) ON-SCREEN TEXT POLICY. Default: request no words inside generated frames and burn
      captions in during editing — generated in-frame text is the most common reason a
      shot has to be regenerated.
   d) MUST NOT APPEAR: my standing negative list — watermarks, logos, readable brand
      names, bystanders' faces, extra limbs, anything in my banned list.
   e) MY HIGGSFIELD CONTROLS: only the controls from [HIGGSFIELD_FEATURES_I_HAVE].
2. Add an "ASK HIGGSFIELD / CHECK MY ACCOUNT" list at the end of the section for any
   control I asked for that is not in [HIGGSFIELD_FEATURES_I_HAVE].
3. Print the rewritten section back to me so I can check it before it drives real spend.

CONSTRAINT
Use ONLY the controls listed in [HIGGSFIELD_FEATURES_I_HAVE]. Do not name Higgsfield
models, presets, plans or prices, and do not invent a control — put anything uncertain in
the ASK HIGGSFIELD list instead. Do not add a shot table or a prompt template; the
cf-shot-designer agent owns that format.
```

**If it goes wrong:** briefs that produce garbled words in-frame mean the on-screen text policy was ignored — tighten the MUST NOT APPEAR list and burn captions in your editor instead.

**What to do when an individual shot fails** is a procedure, not config, so it lives in
`03-operating-runbook.md` → *When something fails* → "A generation comes back unusable",
which gives you the change-one-thing retry order.

---

### Prompt A8 — Put your distribution settings in the intake note

**When you run it:** after your social accounts are connected inside Postiz.
**What you get back:** a **Distribution** section inside
`content-machine/notes/[OFFER_SLUG]-intake.md`, replacing the thin "Platforms" section —
the channels, timezone and cadence `/cf-schedule` hands to the `cf-distribution-planner`
agent, plus your pre-flight checklist and which handoff path you use. The queuing steps
themselves live in the runbook.

> **Why it goes in the intake note.** `/cf-schedule` passes "the platforms, the account
> handles, the operator's timezone and their stated cadence" to `cf-distribution-planner`.
> It reads those from the intake note. A standalone `channels.md` would never be opened by
> any skill or agent.

```
Update my intake note so the distribution planner is properly constrained. Replace the
existing "Platforms" section with a fuller "Distribution" section. Edit the file in
place; do not create a new one and do not touch any other section.

Postiz is my own account connected to my own social accounts. This machine's job ends at
"approved, formatted, and queued with a time". It must never publish without my say-so.

INPUTS
- Intake note to edit: [CLAUDEFLEET_HOME]/content-machine/notes/[OFFER_SLUG]-intake.md
- Postiz setup: [HOSTED_OR_SELF_HOSTED] at [POSTIZ_URL]
- Channels I have actually connected in Postiz, with handles: [CHANNELS]
- My timezone: [TIMEZONE]
- Posts per channel per week I am committing to: [CADENCE]
- Windows that have worked for me so far, or "unknown": [KNOWN_GOOD_TIMES]

STEPS
1. Write the "Distribution" section containing:
   a) A CHANNEL TABLE: channel, handle, aspect ratio, max caption length, hashtag
      convention, link policy, and any format constraint I stated. Mark anything you are
      not certain of as "VERIFY IN POSTIZ" rather than asserting it.
   b) TIMEZONE: [TIMEZONE], stated once and explicitly, because every slot the planner
      writes must carry a named zone.
   c) CADENCE: [CADENCE] per channel per week, and the minimum gap between two posts on
      the same account.
   d) POSTING WINDOWS: for each channel, [CADENCE] candidate slots with weekday and local
      time in [TIMEZONE]. If [KNOWN_GOOD_TIMES] is "unknown", spread slots across
      different days and times and label the whole table "HYPOTHESIS — replace with your
      own data after four weeks". Do not present any slot as a proven best time.
   e) PRE-FLIGHT CHECKLIST run before any card reaches stage 4 Scheduled. Keep it to
      things that are checkable against this section — aspect ratio, caption length,
      hashtag convention, link policy, asset present and playable, account connected.
   f) One line naming which handoff path I use — hosted paste, or self-hosted with API
      access — so it is decided once rather than per card. The steps for both live in
      03-operating-runbook.md; do not restate them here.
2. Update pipeline.json's services.postiz note with my setup, leaving connected as false
   until I confirm a test post scheduled successfully.
3. Print the new section back to me.

CONSTRAINT
No invented engagement statistics, no "optimal time" claims, no Postiz pricing, no guessed
platform limits. Every timing recommendation is labelled as an untested hypothesis until
my own data replaces it.
```

**If it goes wrong:** a caption that silently truncates on a platform means the max-length column was guessed — verify it inside Postiz and correct the table.

**The actual queuing steps** — both the hosted paste path and the self-hosted API path,
including where your token must never go — are a procedure, not config, so they live in
`03-operating-runbook.md` → *Handing a card off to Postiz*.

---

### Prompt A9 — End-to-end smoke test

**When you run it:** last build step, before you trust the machine with real work.
**What you get back:** one throwaway card driven from Idea to Scheduled, plus a PASS/FAIL report on all five stages, the hooks, and the admin panel.

```
Run a full end-to-end smoke test of my content machine using one disposable card. The
goal is to prove every moving part works before I put real client work through it. Do not
schedule anything publicly — stop at the point of publication.

INPUTS
- Fleet home: [CLAUDEFLEET_HOME]
- Offer slug: [OFFER_SLUG]
- Test angle to use: [TEST_ANGLE]  (something real from my niche, but throwaway)

STEPS
1. Snapshot pipeline.json (copy it to notes/pipeline.pre-smoke.json) so I can roll back.
2. Run /cf-ideas [OFFER_SLUG], steering it toward [TEST_ANGLE]. Approve only that one
   angle. Confirm a new card appears at stage 0 with a real id.
3. Run /cf-script on that card. Confirm: card stage is now 1, the file
   content-machine/scripts/<id>-script.md exists and is non-empty, and a log entry was
   appended.
4. Run /cf-render on it. Confirm stage 2 and content-machine/briefs/<id>-higgsfield.md
   exists.
5. STOP. Tell me to paste one shot prompt into Higgsfield myself, generate one clip, drop
   it into content-machine/assets/<id>/, then cut (or just copy, for this smoke test) a
   final.mp4 into the same folder — /cf-assemble will not advance the card without one.
   Wait for me to confirm.
6. Run /cf-assemble. Confirm it refuses while the asset folder is empty or final.mp4 is
   missing (this is the guard working — report that as a PASS), then passes once both are
   there. Confirm stage 3.
7. Run /cf-schedule in dry-run: produce the full Postiz handoff package and the pre-flight
   checklist, but do NOT queue anything and do not move the card to stage 4 until I
   explicitly approve in this session.
8. Exit checks: cat logs/run.log (expect file and session-end lines); restart and confirm
   the SessionStart hook prints the stage counts; open admin.html, Import JSON, confirm
   the card sits in the right column.

OUTPUT FORMAT
A table: step | expected | actual | PASS/FAIL. Then "DELETE THE TEST CARD?" with the exact
command to restore my snapshot.

CONSTRAINT
Report failures as failures. A step you skipped is a FAIL, not a PASS — a green smoke test
that lied is worse than no smoke test.
```

**If it goes wrong:** if `/cf-assemble` advances a card with an empty assets folder, the guard from Prompt A4 step 4 did not make it into the skill — fix the skill, do not work around it.

---

# PART B — OPERATING PROMPTS

These are the ones you actually live in. B1 through B5 are the daily loop, B6 is the
weekly batch, B7 the review, B8 the fixer.

---

### Prompt B1 — Fill the idea bank

**When you run it:** whenever stage 0 has fewer than ten cards; typically once a fortnight.
**What you get back:** 12–20 new cards at stage 0, each with an angle, a hook and the pain it targets.

```
Refill my idea bank. Use the cf-angle-scout agent. I want angles I can actually shoot,
not topic titles.

INPUTS
- Intake note: [CLAUDEFLEET_HOME]/content-machine/notes/[OFFER_SLUG]-intake.md
- Raw material from the last two weeks — questions, objections, DMs, comments, things I
  said out loud: [RAW_INPUT]
- Number of angles: [COUNT]  (12–20 works; more than 20 and quality drops)
- Angles to avoid because I already ran them: [RECENT_ANGLES]

STEPS
1. Read the intake note and every card title already in pipeline.json, so nothing repeats.
2. Delegate to cf-angle-scout. Require [COUNT] angles spread across at least four of
   these formats: myth-correction, one-mistake, before/after, behind-the-scenes,
   question-answered, contrarian take, tiny-tutorial.
3. For each angle produce: a working title; the specific audience pain from the intake note it
   hits; a 3-second opening hook line written in my voice; the single takeaway; the format
   tag; and a difficulty score 1–3 for how hard it is to render in Higgsfield.
4. Before anything is written, drop any angle that only works if a statistic, a case
   study, a testimonial or an income figure would have to be invented. If an angle needs a
   number I have not supplied, keep the angle and put the number on a NEEDS-SOURCE list
   instead of guessing it.
5. Append the survivors to pipeline.json as cards at stage 0 with sequential ids, ISO
   timestamps and the detail above in "notes". Append one log entry naming the count.
6. Print the [COUNT] hooks as a numbered list so I can strike the ones I hate.

CONSTRAINT
Every angle must be defensible with what I already know or can demonstrate. No invented
statistics, no "studies show", no competitor claims, no numbers I did not supply. An angle
that needs a fact I do not have goes in a separate NEEDS-SOURCE list instead of the bank.
```

**If it goes wrong:** angles that all sound the same mean `[RAW_INPUT]` was thin — feed it actual customer questions, not a topic list.

---

### Prompt B2 — Script one card

**When you run it:** on any stage-0 card you have decided to shoot.
**What you get back:** `content-machine/scripts/<card-id>-script.md` with a shootable script and three alternative hooks; card moves to stage 1.

```
Run /cf-script on card [CARD_ID] to move it from stage 0 (Idea) to stage 1 (Script).

INPUTS
- Card id: [CARD_ID]
- Target length: [CLIP_LENGTH] seconds
- Primary platform: [PRIMARY_PLATFORM]
- Anything I want said or avoided this time: [SPECIAL_NOTES]

STEPS
1. Read the intake note, then the card's title and notes from pipeline.json.
2. Delegate to cf-script-writer. The script must contain, in this order:
   - HOOK: the first 3 seconds, written as spoken words, under 12 words.
   - BODY: beats numbered to fit [CLIP_LENGTH] at a natural speaking pace of roughly
     2.5 words per second — show the word count and your arithmetic.
   - TURN: the one line that reframes the problem.
   - CTA: one action, tied to the offer in the intake note. Never more than one.
   - B-ROLL COLUMN: for each beat, what should be on screen. This is what /cf-render
     turns into shots, so it must be visually concrete, not abstract.
3. Produce three alternative hook lines with the same promise and different mechanisms —
   contrarian, specific-number (only if I actually own that number), and question.
4. Check the returned script yourself before writing it. Reject and re-request anything
   that contains a statistic, client result, testimonial, review, follower count or
   earnings figure that didn't come from the intake note — put any number I must supply on
   a needsUser list instead of guessing it. Captions come later, at /cf-assemble, once
   there is a finished clip to write them against.
5. Write content-machine/scripts/[CARD_ID]-script.md, bump the card to stage 1, append to
   its notes, and append a log entry.

QUALITY BAR
Read the hook aloud in your head. If it could open a video in any other niche unchanged,
it is too generic — rewrite it until it could only belong to my business.
```

**If it goes wrong:** a script that overruns when you read it aloud means the words-per-second arithmetic was skipped — ask for the count and cut beats, do not speed up delivery.

---

### Prompt B3 — Write the render briefs

**When you run it:** on a stage-1 card, right before a Higgsfield session.
**What you get back:** `content-machine/briefs/<card-id>-higgsfield.md` — paste-ready shot prompts; card moves to stage 2.

```
Run /cf-render on card [CARD_ID] to move it from stage 1 (Script) to stage 2 (Render).
Output must be pasteable into Higgsfield with zero editing.

INPUTS
- Card id: [CARD_ID]
- Shots to produce: [SHOTS_PER_CLIP]
- Anything about this clip that differs from house style: [OVERRIDES]

STEPS
1. Read content-machine/notes/[OFFER_SLUG]-intake.md — the Visual grammar section is the
   binding constraint — then the script at content-machine/scripts/[CARD_ID]-script.md.
2. Delegate to cf-shot-designer, passing the script, the beat timecodes, the aspect ratio
   and the Visual grammar constraints. The agent owns the shot-table and prompt format;
   your job is to hold it to the house style block verbatim, not to restate its layout.
3. Produce [SHOTS_PER_CLIP] shots that between them cover every beat of the B-roll column.
   Each shot needs: the script line it covers, duration in seconds summing to the script's
   total, the full prompt paragraph, a negative prompt, and a one-line "what would make
   this shot unusable" note.
4. Add a GENERATION ORDER section: which shot to make first as a style test, so I burn one
   shot's worth of credit finding out the look is wrong instead of [SHOTS_PER_CLIP].
5. End the brief with the empty regeneration log the agent produces (shot, attempt,
   result, credits) so I can fill in real credits after the session — /cf-render reads
   my figure from me and never estimates it.
6. Write content-machine/briefs/[CARD_ID]-higgsfield.md, bump the card to stage 2, log the
   run, and remind me that generation happens in my own Higgsfield account on my own
   credits.

CONSTRAINT
Do not invent Higgsfield model names, presets, parameters or prices. If the brief needs a
control that is not in the intake note's MY HIGGSFIELD CONTROLS list, put it under OPEN
QUESTIONS and leave the prompt
written in plain descriptive language that works regardless of which control I use.
```

**If it goes wrong:** shot durations that do not sum to the script length mean shots were designed independently — ask for the sum and rebalance before generating anything.

---

### Prompt B4 — Assemble and QC

**When you run it:** after the generated assets are sitting in `assets/<card-id>/`.
**What you get back:** a QC verdict, final caption, on-screen text sheet, and a card at stage 3.

```
Run /cf-assemble on card [CARD_ID] to move it from stage 2 (Render) to stage 3 (Assemble).

INPUTS
- Card id: [CARD_ID]
- Asset folder: [CLAUDEFLEET_HOME]/content-machine/assets/[CARD_ID]/
- Credits this card actually cost me: [CREDITS_SPENT]
- Shots I already know are bad: [KNOWN_BAD_SHOTS]

STEPS
1. Refuse to proceed if the asset folder is empty or missing — report which files you
   expected from the brief and which are actually there, and stop.
2. Build an ASSEMBLY SHEET: shot order, source filename, in/out timing, the script line it
   carries, and the on-screen text for that segment (with the caption-safe area rule from
   the intake note's visual grammar).
3. Run a QC pass against the brief's "what would make this shot unusable" notes plus
   [KNOWN_BAD_SHOTS]. For each failure, say whether to regenerate, retime, or cut — and
   name the cheapest fix first.
4. Delegate to cf-caption-writer with the script, the platforms, the intake note's
   forbidden-claims list and the offer's CTA. Ask for one primary caption per platform, one
   alternative for the first platform, hashtags grouped broad and specific, alt text, and
   first-comment text where the platform uses it.
5. Run the claim check yourself on every line cf-caption-writer returns. Any earnings
   claim, guaranteed outcome, invented statistic, invented testimonial, invented review,
   fake scarcity, or medical, legal or financial advice is deleted, not softened. Show me
   what you removed and why.
6. Record [CREDITS_SPENT] in the brief's credit log and append a costs note if I gave you
   an invoice amount. Never estimate what the credits cost in money.
7. Write content-machine/posts/[CARD_ID]-post.md with the assembly sheet, the captions per
   platform, hashtags, alt text and the asset filenames it refers to.
8. Approval gate: I cut the video myself, watch it end to end, and confirm sound, captions
   and on-screen text are right. Ask me for the finished file's path, expect it at
   content-machine/assets/[CARD_ID]/final.mp4, and verify it exists before advancing — no
   confirmation, no advance.
9. Bump the card to stage 3, append to notes, log the run.

QUALITY BAR
If more than a third of the shots failed QC, do not assemble around it — say so and send
the card back to stage 2 with specific brief changes.
```

**If it goes wrong:** repeated QC failures on the same fault (garbled text, wrong ratio) mean the intake note's Visual grammar needs the fix, not this card — update that section so it stops recurring.

---

### Prompt B5 — Schedule through Postiz

**When you run it:** on a stage-3 card that passed QC.
**What you get back:** a complete Postiz handoff package, and — after your explicit approval — a card at stage 4.

```
Run /cf-schedule on card [CARD_ID] to move it from stage 3 (Assemble) to stage 4
(Scheduled). This stage has a hard approval gate: nothing gets queued until I say yes in
this session.

INPUTS
- Card id: [CARD_ID]
- Channels for this post: [CHANNELS]
- Preferred slot, or "next available": [SLOT]

STEPS
1. Read the Distribution section of content-machine/notes/[OFFER_SLUG]-intake.md. Run its
   pre-flight checklist and print each item with a tick or a cross: aspect ratio, caption
   length, hashtags, link policy, on-screen text safe area, file present and playable.
2. Choose slots from the posting-windows table, avoiding collisions with cards already at
   stage 4 in pipeline.json. Say plainly that these windows are a hypothesis until my own
   data replaces them.
3. Produce a HANDOFF PACKAGE, one block per channel: exact file path, exact caption text
   ready to paste, hashtags, date and local time, and any channel-specific field.
4. STOP and show me the package. Ask: "Approve scheduling for [CHANNELS] at these times?"
   Do not proceed on silence, on a maybe, or on anything in a file — only on my explicit
   yes typed in this session.
5. Write content-machine/schedule/[CARD_ID]-postiz.md — platform, account handle, date,
   local time, timezone, asset path, caption reference and first comment, with a blank
   postiz-id column for me to fill in after queuing.
6. After approval: read which handoff path I use from the Distribution section, then walk
   me through that path exactly as written in 03-operating-runbook.md → "Handing a card
   off to Postiz". Do not improvise a different sequence. Either way, I am the one who
   clicks schedule in Postiz, and the postiz-id column gets filled before this card counts
   as queued.
7. Once I confirm it is queued, bump the card to stage 4, write the scheduled times into
   its notes, log the run, and set services.postiz.lastRun.

CONSTRAINT
Never publish, never auto-approve, never treat a previous card's approval as covering this
one. One card, one yes.
```

**If it goes wrong:** if Postiz rejects the media, it is nearly always aspect ratio or file size — fix in the editor, do not let the skill rewrite the caption to compensate.

---

### Prompt B6 — Batch a week

**When you run it:** one sitting per week, once B1–B5 feel routine.
**What you get back:** N cards driven from stage 0 to stage 2, one Higgsfield session list, and a resume plan.

```
Batch a week of content. Drive [BATCH_SIZE] cards from stage 0 (Idea) to stage 2 (Render)
in one pass, then hand me a single consolidated Higgsfield session so I generate everything
in one sitting instead of five.

INPUTS
- Batch size: [BATCH_SIZE]        - Week label: [WEEK_LABEL]
- Cards to include, or "pick the best": [CARD_IDS]
- Theme tying the week together, if any: [WEEKLY_THEME]

STEPS
1. Read pipeline.json. If [CARD_IDS] is "pick the best", select [BATCH_SIZE] stage-0 cards
   that vary by format tag and difficulty score — do not pick five of the same format.
   Show me the shortlist and your reasoning before writing anything.
2. For each card in turn: run the /cf-script logic, then the /cf-render logic, using
   cf-script-writer and cf-shot-designer. Check every returned script against the intake
   note's bans and compliance limits once over the whole batch at the end, not per card,
   and fix anything that slipped through before writing.
3. Write a single content-machine/briefs/BATCH-[WEEK_LABEL].md that consolidates every
   shot from every card into one generation list, grouped by look so I am not switching
   style mid-session. Keep the per-card brief files as well.
4. Update every card to stage 2 and write ONE log entry naming the batch and card ids.
5. Print a RESUME PLAN: exactly which command to run on which card after generation
   (/cf-assemble per card), and the asset folder each set of clips must land in.
6. Print a BUDGET LINE: total shots requested across the batch, so I can check that against
   my own Higgsfield credit balance before I start. Do not convert shots into money.

CONSTRAINT
If any card fails the compliance check, leave it at its current stage and continue with
the rest. Report partial completion honestly — a batch that claims 5 of 5 when 4 shipped
is a lie I will find out about on Thursday.
```

**If it goes wrong:** running out of Higgsfield credits mid-batch — check the budget line against your balance before generating, and split the batch across two sessions.

---

### Prompt B7 — Weekly review

**When you run it:** same slot every week, after your scheduled posts have gone live.
**What you get back:** `content-machine/notes/review-<week>.md` with what shipped, what performed, real costs, and next week's directives.

```
Run my weekly content review. Be blunt. I would rather hear that a format is not working
than read a summary that makes the week sound productive.

INPUTS
- Week label: [WEEK_LABEL]
- Performance numbers I pulled myself, per post: [PERFORMANCE_DATA]
- Invoice amounts I actually paid this month: [ACTUAL_COSTS]
- What felt hard or slow this week: [FRICTION]

STEPS
1. Read pipeline.json and logs/run.log for [WEEK_LABEL]. Report: cards created, cards
   moved per stage, cards published, and cards stuck — with how many days each has sat.
2. Analyse [PERFORMANCE_DATA] ONLY. Group by format tag and hook type from the card notes.
   Name the best and worst performer and what structurally differed between them. If the
   sample is too small to conclude anything, say exactly that instead of finding a pattern.
3. Write [ACTUAL_COSTS] into pipeline.json's costs array for the current month, one entry
   per service, with a note naming the invoice. Report total spend in [CURRENCY] and cost
   per published post. State that these are my numbers, not estimates.
4. From [FRICTION], name the single biggest bottleneck and propose one concrete change to
   the intake note — a specific edit to a named section, not a principle.
5. Write three DIRECTIVES for next week: things to do more of, stop, and test. Each must
   be checkable next Friday.
6. Save all of it to content-machine/notes/review-[WEEK_LABEL].md and log the run.

CONSTRAINT
Use no numbers except the ones I gave you. Do not project future performance, do not
extrapolate reach, and do not tell me what this is worth — you have no way to know.
```

**If it goes wrong:** a review that reads as uniformly positive means the critic instinct switched off — rerun it with "name the two weakest things I did this week" appended.

---

### Prompt B8 — Debug a stuck card

**When you run it:** when a card has not moved in a week, or a skill refuses to advance it.
**What you get back:** a root-cause diagnosis, the exact fix, and either an unstuck card or an honest reason it should be killed.

```
Card [CARD_ID] is stuck at stage [STAGE_NAME] and I do not know why. Diagnose it properly
before changing anything — I would rather you find the cause than force the card forward.

INPUTS
- Card id: [CARD_ID]         - Stage it is stuck at: [STAGE_NAME]
- What I saw or what the skill said: [SYMPTOM]

STEPS
1. Gather evidence before forming a theory. Print: the card's full JSON from pipeline.json;
   whether the artifact required by its stage exists on disk (scripts/[CARD_ID]-script.md
   for stage 1, briefs/[CARD_ID]-higgsfield.md for stage 2,
   assets/[CARD_ID]/final.mp4 and posts/[CARD_ID]-post.md for stage 3); every
   logs/run.log line mentioning the card; and every log array entry for it.
2. Check the four usual causes in order and report each as ruled in or out:
   a) the stage's artifact is missing or empty, so the guard correctly refuses;
   b) the card's stage index and its artifacts disagree — something was hand-edited or the
      admin panel was exported over a newer pipeline.json;
   c) the skill or agent file is missing, or its frontmatter stopped parsing;
   d) an external blocker — no Higgsfield credit, an expired Postiz channel token.
3. State the root cause in one sentence. If it is (b), tell me which side is right and why
   before you change either. If it is (c), fix the file and say what was wrong with it.
4. Apply the smallest fix that resolves the cause. Never advance a card past a stage whose
   artifact does not exist just to clear the board.
5. If the honest answer is that this card should be killed, say so and give me the exact
   edit to remove it. A dead card in the bank is cheaper than a bad post.
6. Log the diagnosis in the card's notes so the same cause is recognisable next time.

CONSTRAINT
No speculative fixes. If the evidence does not identify a cause, say "cause not identified"
and list what you would need to see.
```

**If it goes wrong:** if the same card gets stuck twice at the same stage, the defect is in the skill or the spec, not the card — fix it upstream so every future card benefits.

---

## Three rules that keep this thing honest

1. **Import before you look, export after you edit.** The admin panel keeps working state
   in your browser; `pipeline.json` is truth. Never leave unexported panel edits sitting
   while Claude is working the same file — last writer wins.
2. **The check happens before you ever see the draft.** `/cf-script` and `/cf-assemble`
   reject and re-request anything that violates the intake note's bans or compliance
   limits before the file is written — a deleted claim stays deleted, it never comes back
   as a vaguer version of itself.
3. **Nothing publishes without a typed yes.** Stage 4 is an approval gate on purpose. A
   machine that can post while you sleep is a machine that can embarrass you while you
   sleep.

## Costs, plainly

This machine drives three paid services and includes none of them. Claude Code needs a paid
plan or API billing. Higgsfield generation runs on credits you buy in your own account.
Postiz is either a hosted plan or a server you run. Check current pricing on each vendor's
own pricing page before you commit to a posting cadence — the cadence you can afford is a
function of their prices, not of this product. Record what you actually pay in
`pipeline.json`'s `costs` array each month; Prompt B7 turns that into cost per published
post, which is the only cost number worth having.

Nothing here promises an audience, a customer, or a sale. It promises a repeatable pipeline
with a visible state, which is the part most people never build.
