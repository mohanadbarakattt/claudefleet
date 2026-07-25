# Digital Product Machine — The Build Prompt Pack

Seventeen prompts. Part A builds the machine on your computer (run once, in order, one session
per prompt or two) — it's an alternative to the terminal-commands install in `00-START-HERE.md`,
for anyone who wants Claude Code to adapt the skills, agents, and Higgsfield/Postiz config to
their own profile as it installs. Already installed via `00-START-HERE.md`? Skip Part A and
start at Prompt 10 — Part B is what you run forever after.

**Before you start.** These prompts assume the install in `_engine/INSTALL.md` is where you're
headed, and that you have: Claude Code working (`claude --version`), `python3`, and accounts for
the two services this machine drives — **Higgsfield** (media generation) and **Postiz**
(scheduling/publishing, hosted or self-hosted). All three are paid third-party services with
their own billing, on their own terms; check current pricing on each vendor's own pricing page.
This pack never quotes their prices and never estimates them. Without those subscriptions the
machine does not run.

**Conventions used by every prompt** (the engine's spine — keep them or change them everywhere):

| Thing | Path |
|---|---|
| Fleet home | `~/claudefleet/` |
| Pipeline state | `~/claudefleet/pipeline.json` |
| This machine's workspace | `~/claudefleet/product-machine/` |
| Per-product notes and drafts | `~/claudefleet/product-machine/notes/<slug>/` |
| Per-product rendered assets | `~/claudefleet/product-machine/assets/<slug>/` |
| Skills | `~/.claude/skills/dp-<stage>/SKILL.md` |
| Agents | `~/.claude/agents/dp-<name>.md` |
| Hooks | merged into `~/.claude/settings.json` |
| Raw run log | `~/claudefleet/logs/run.log` |

Stages, in order: **Validate → Build → Package → Launch Kit → Scheduled** (stage indexes 0–4 in
`pipeline.json`). Slash commands, one per stage: `/dp-validate`, `/dp-build`, `/dp-package`,
`/dp-launch`, `/dp-schedule`. Every stage writes into its own subfolder under
`notes/<slug>/` — `validation.md` directly, then `build/`, `package/`, `launch/`, `schedule/` —
never under a `products/` folder, which this machine does not have.

Anything in `[SQUARE_BRACKETS]` is a variable **you** replace before pasting. Replace all of
them — a prompt run with the brackets still in it produces generic slop.

---

## PART A — BUILD PROMPTS

Run 1 through 9 in order. Do not skip 9.

### Prompt 1 — Preflight and scaffold
**When you run it:** once, first thing, in a Claude Code session started in your home directory.
**What you get back:** the `~/claudefleet/product-machine/` folder tree plus a preflight table naming anything missing.

```
You are setting up the Digital Product Machine, a local file-based pipeline that runs inside
Claude Code. Work only inside the paths named below. Touch nothing else in my home directory.

INPUTS
- FLEET_HOME: [~/claudefleet]
- UNZIPPED_PRODUCT_DIR: [~/Downloads/claudefleet-digital-product-machine]

STEPS
1. Preflight. Run these and report the raw output of each: `claude --version`, `python3 -V`,
   `jq --version`, `ls UNZIPPED_PRODUCT_DIR`, `ls UNZIPPED_PRODUCT_DIR/_engine`. Install
   nothing. If jq is absent, tell me I must use the manual hook merge in Prompt 6.
2. Create these, skipping any that already exist:
   FLEET_HOME/logs/
   FLEET_HOME/product-machine/config/
   FLEET_HOME/product-machine/notes/
   FLEET_HOME/product-machine/assets/
3. Copy UNZIPPED_PRODUCT_DIR/_engine/admin-panel/index.html to FLEET_HOME/admin.html only if
   FLEET_HOME/admin.html does not exist. Say which branch you took.
4. Do NOT create pipeline.json. Prompt 2 does that.
5. Write FLEET_HOME/product-machine/README.md: a map of the tree, one line per folder saying
   what lands there (note/<slug>/ holds each product's drafts, one subfolder per stage after
   Validate; assets/<slug>/ holds Higgsfield renders), then the five stages Validate, Build,
   Package, Launch Kit, Scheduled with the matching slash commands /dp-validate, /dp-build,
   /dp-package, /dp-launch, /dp-schedule.

OUTPUT
A markdown table with columns Check | Result | Blocking?, one row per preflight item. Then the
list of paths you created and the ones you skipped. Last line exactly: READY or BLOCKED: <why>.

CONSTRAINTS
Never delete, never overwrite an existing file, never use sudo. If a command fails, report the
real error text — do not summarise it as "seems fine".
```
**If it goes wrong:** `ls UNZIPPED_PRODUCT_DIR` fails — you pasted the download path wrong; find the folder with `ls ~/Downloads | grep -i fleet` and rerun with the exact name.

---

### Prompt 2 — Seed pipeline.json with your niche and offer
**When you run it:** immediately after Prompt 1, once. Never again — after this, skills own the file.
**What you get back:** `~/claudefleet/pipeline.json`, valid JSON, product stages, your first Validate cards.

```
You are writing the single source of truth for my Digital Product Machine: pipeline.json.

INPUTS
- FLEET_HOME: [~/claudefleet]
- EXAMPLE_FILE: [~/Downloads/claudefleet-digital-product-machine/_engine/pipeline.example.json]
- MY_NICHE: [who I sell to, in one sentence — e.g. "solo bookkeepers who serve trades businesses"]
- MY_OFFER_THESIS: [what kind of digital product I intend to sell them, one sentence]
- FIRST_IDEAS: [2-4 rough product ideas, one line each]
- CURRENCY: [USD]

STEPS
1. Read EXAMPLE_FILE to learn the exact key names. Keep that schema — the admin panel only
   reads keys it knows, and unknown top-level keys are lost on its next export.
2. If FLEET_HOME/pipeline.json already exists, STOP and show me its contents instead. Do not
   overwrite my state.
3. Otherwise write FLEET_HOME/pipeline.json with: schema 1, demo false, machine "product",
   currency CURRENCY, selectedStage 0, and stages exactly
   ["Validate","Build","Package","Launch Kit","Scheduled"].
4. Rewrite the top-level "note" string to name MY_NICHE and MY_OFFER_THESIS and to point at
   product-machine/config/profile.md as the long-form version.
5. cards: one card per FIRST_IDEAS entry — id "p-0001" upward, machine "product", stage 0,
   title = the idea in under 12 words, created = current UTC time in ISO-8601 with a Z, notes =
   two lines: "slug: <kebab-case-slug>" then my raw idea text verbatim. The slug lives in notes
   on purpose: it survives a panel export.
6. log: [] . services: claude/higgsfield/postiz each connected false, lastRun null, note "".
7. costs: one row per service for the current month, amount 0, note "fill in from my own
   invoice". Do not guess, estimate, or quote any vendor's pricing anywhere in this file.
8. Validate: run `python3 -m json.tool FLEET_HOME/pipeline.json > /dev/null` and show the result.

OUTPUT
The full file, then the validation result, then a one-line summary: N cards seeded at Validate.
```
**If it goes wrong:** the file already existed and you actually wanted a reset — move it aside (`mv pipeline.json pipeline.json.old`) and rerun; never edit it while a skill is mid-run.

---

### Prompt 3 — Write the business profile every stage reads
**When you run it:** once, after Prompt 2. Revisit it whenever your positioning changes.
**What you get back:** `~/claudefleet/product-machine/config/profile.md` — the context file all five skills load.

```
You are writing the profile that every stage of my Digital Product Machine reads before it does
anything. Interview me first, write second.

INPUTS
- AUDIENCE: [who exactly — role, situation, what they already tried]
- THE PROBLEM: [the specific expensive problem I solve, in their words not mine]
- PROOF I ACTUALLY HAVE: [what I have genuinely done/seen — leave blank if none]
- VOICE: [3 adjectives + one writer/account whose tone I want to be near]
- FORMATS I WILL SHIP: [e.g. templates, notion kit, prompt pack, short course]
- PRICE BAND I AM COMFORTABLE IN: [e.g. 19-99]
- HARD NOS: [topics, claims, or styles I refuse]

STEPS
1. Ask me up to 6 clarifying questions, then wait for my answers. Ask only about things you
   cannot infer.
2. Write FLEET_HOME/product-machine/config/profile.md with these sections: Audience; Problem;
   Offer thesis; Voice (with 3 example sentences in it and 3 sentences that are NOT it); Formats;
   Price band; Evidence I can legitimately cite; Hard nos; Claim rules.
3. The Claim rules section is mandatory and must state, as binding instructions to any future
   session: never state an earnings figure, a "results in N days" claim, or a testimonial that
   did not happen; never invent statistics, user counts, or vendor prices; the only guarantee
   permitted anywhere in this business is a 30-day money-back refund guarantee, which is about
   refunds and never about earnings; anything unverified goes into a needsUser list instead of
   into the copy.
4. Add a "needsUser" section listing every fact you needed and I did not supply.

OUTPUT
The file, then the needsUser list repeated in chat as a numbered to-do.

QUALITY BAR
A stranger reading only this file must be able to tell my product apart from a generic one in the
same niche. If any section could be pasted into a competitor's profile unchanged, rewrite it.
```
**If it goes wrong:** the voice section reads like everyone else's — feed it three real messages you've written to a customer and tell it to derive the voice from those instead.

---

### Prompt 4 — Install and adapt the five skills
**When you run it:** once, after Prompt 3.
**What you get back:** five valid skill files at `~/.claude/skills/dp-*/SKILL.md`, adapted to your profile.

```
You are installing the five Claude Code skills that move a card through my Digital Product
Machine. Each skill is a directory under ~/.claude/skills/<name>/ containing SKILL.md.

INPUTS
- FLEET_HOME: [~/claudefleet]
- SOURCE_SKILLS_DIR: [~/Downloads/claudefleet-digital-product-machine/skills]  (may not exist)
- PROFILE: FLEET_HOME/product-machine/config/profile.md

STEPS
1. Read PROFILE. If SOURCE_SKILLS_DIR exists, read those files and adapt them; otherwise write
   them from this spec.
2. Create dp-validate, dp-build, dp-package, dp-launch, dp-schedule. Each SKILL.md starts with
   YAML frontmatter containing a `description` field: one sentence naming the stage transition
   and when to use it. Frontmatter must be the first line of the file.
3. Every skill body must specify this identical STAGE CONTRACT, written out in full in each file:
   read FLEET_HOME/pipeline.json; select the target card by id, or by title if I named one;
   refuse to run if the card's stage index is not the one this skill consumes, and say which
   skill I actually need; read config/profile.md and obey its Claim rules; do the stage work;
   write artifacts under FLEET_HOME/product-machine/notes/<slug>/ — Validate writes
   validation.md directly in that folder; Build, Package, Launch Kit and Scheduled each write
   into their own subfolder (build/, package/, launch/, schedule/); anything Higgsfield renders
   lands in FLEET_HOME/product-machine/assets/<slug>/, never under notes/; then update
   pipeline.json in one pass — for Validate, Build, Package and Launch Kit, once the gate
   passes, set card.stage to the next index (1, 2, 3, 4 respectively). Scheduled is the
   machine's last stage: instead of incrementing, leave card.stage at 4 and mark the card
   launched in card.notes — there is no stage 5, and no skill may ever write a stage index
   past 4. Either way, append a dated line to card.notes, and push a log entry {id, ts (UTC
   ISO-8601 with Z), machine "product", stage (card.stage AFTER this write — 4 for Scheduled,
   since it does not change), text "/dp-<name> — <what was produced>"}; write to a temp file,
   validate it parses with python3 -m json.tool, then move it into place.
4. Each skill also defines its own GATE — the condition that must be true before the card is
   allowed to advance. Stage gates: Validate needs an operator GO on a memo carrying three-plus
   cited demand signals and two-plus comparable paid products; Build needs every promised
   deliverable existing as a real file with no placeholder text, verified by a grep sweep;
   Package needs a manifest checked against the actual build folder, a buyer README, refund
   terms, and a price I approved — no sales page at this stage, that is Launch Kit's job;
   Launch Kit needs the sales page and email 1 read back to me and approved, with a banned-claims
   sweep clean; Scheduled needs my explicit approval line before a single slot is queued, and —
   because it is the last stage — the card stays at index 4 and is marked launched rather than
   advanced to a stage 5 that does not exist.
5. Print `ls ~/.claude/skills/*/SKILL.md`.

CONSTRAINT
No skill may publish, post, or spend anything. A skill that cannot meet its gate must leave the
card where it is and write the reason into card.notes.
```
**If it goes wrong:** `/dp-validate` doesn't autocomplete in Claude Code — the file landed as `~/.claude/skills/dp-validate.md` instead of `dp-validate/SKILL.md`; move it into a directory of that name and restart the session.

---

### Prompt 5 — Install and adapt the five agents
**When you run it:** once, after Prompt 4.
**What you get back:** five subagent files at `~/.claude/agents/dp-*.md` that the skills delegate to.

```
You are installing the specialist subagents my Digital Product Machine's skills delegate to.
Each is one markdown file at ~/.claude/agents/<name>.md.

INPUTS
- SOURCE_AGENTS_DIR: [~/Downloads/claudefleet-digital-product-machine/agents]  (may not exist)
- PROFILE: ~/claudefleet/product-machine/config/profile.md

STEPS
1. Read PROFILE. Adapt SOURCE_AGENTS_DIR files if present; otherwise write from this spec.
2. Create exactly these five, each with YAML frontmatter carrying `name`, `description`,
   `tools`, and `model`. The description must end with two <example> blocks showing a realistic
   user request and why this agent is the right one — that is how Claude Code decides to route
   to it.
   - dp-researcher (model sonnet; tools Read, Write, WebSearch, WebFetch) — validates a product
     idea against real, citable demand signals and comparable paid products for /dp-validate,
     before anything gets built. Produces one memo ending in a GO / NO-GO / MORE RESEARCH
     verdict. Never invents a demand signal, a URL, a quote, or a competitor's price; a missing
     signal is written as "not found", never smoothed over.
   - dp-builder (model sonnet; tools Read, Write, Edit, Glob, Grep) — writes the actual
     deliverable for /dp-build: the outline first, alone, stopping for approval, then every
     templated file, lesson or guide in full once the outline is cut. Never writes a
     placeholder, a TODO, or an invented statistic, case study or income promise.
   - dp-packager (model sonnet; tools Read, Write, Edit, Bash, Glob) — turns a finished build
     folder into a sellable bundle for /dp-package: manifest checked against a real `ls -R`,
     buyer README, licence and refund terms, and a price-band proposal (never the price itself)
     with paste-ready Higgsfield briefs for cover art and promo stills.
   - dp-launch-writer — writes the launch campaign for /dp-launch: sales page, five-email
     sequence, launch-week social posts, and Higgsfield promo-video briefs, every claim traced
     to the validation memo or the manifest, in the voice defined in PROFILE.
   - dp-scheduler (model haiku; tools Read, Write, Edit) — turns the approved launch kit into a
     slot-by-slot Postiz schedule plus email send times and a conflicts list for /dp-schedule.
     Never claims a post was queued, scheduled or sent — it produces a plan; the operator queues
     it, and nothing moves without an explicit approval line in the session.
3. Match each agent's tool set to what the shipped versions actually carry (listed above) — all
   five write their own output files; only dp-researcher needs web access, and only dp-packager
   needs Bash, to list the build folder for real before it writes the manifest.
4. Every agent's body must include: "Load ~/claudefleet/product-machine/config/profile.md and
   obey its Claim rules. Never invent facts, statistics, prices, or testimonials. Never state or
   imply what income anyone will make."
5. Print `ls ~/.claude/agents/` and, in a session restart, `/agents`.

QUALITY BAR
Each agent's anti-fabrication hard rules must survive the adaptation verbatim — those are what
stop an invented statistic, testimonial, or income promise from ever reaching a buyer. If an
adaptation softens a "never invent..." line to make the copy read better, put it back.
```
**If it goes wrong:** the agents never get invoked — the `<example>` blocks are too abstract; rewrite them as sentences you'd actually type.

---

### Prompt 6 — Wire the hooks
**When you run it:** once, after Prompt 5. Read `_engine/hooks/README.md` first — hooks run shell commands on your machine.
**What you get back:** a backed-up, merged `~/.claude/settings.json` and a verified stage-count line on session start.

```
You are merging the ClaudeFleet hooks into my existing Claude Code settings. My settings.json
almost certainly already has content and may already have hooks from plugins. Losing them is the
failure mode I care about.

INPUTS
- HOOKS_FILE: [~/Downloads/claudefleet-digital-product-machine/_engine/hooks/settings-hooks.json]
- SETTINGS: ~/.claude/settings.json
- FLEET_HOME: [~/claudefleet]

STEPS
1. Show me the contents of HOOKS_FILE and, in plain English, exactly what shell command each of
   the three entries runs and when. I want to read this before anything is written.
2. Back up SETTINGS to SETTINGS.bak.<timestamp> and show me the backup path.
3. Merge, do not replace: keep every existing top-level key; for each event key in HOOKS_FILE,
   APPEND our array element to the existing array for that event rather than replacing it.
   Write to a temp file, verify it parses with `jq -e . <temp>` (or python3 -m json.tool if jq
   is missing), and only then move it into place.
4. If FLEET_HOME is not ~/claudefleet, add a top-level "env" key setting CLAUDEFLEET_HOME to
   FLEET_HOME, because an exported shell variable will not reach a GUI-launched session.
5. The SessionStart hook prints stage counts. Confirm it reads the stage names out of
   pipeline.json rather than hardcoding content-machine names; if it hardcodes them, adapt it so
   it prints Validate / Build / Package / Launch Kit / Scheduled counts for machine "product".
6. Verify: run `jq '.hooks | keys' ~/.claude/settings.json`, then execute the SessionStart
   command exactly as configured and show me its raw output.

OUTPUT
A before/after diff of the hooks object only, the backup path, and the verification output.

CONSTRAINT
If the merged file fails to parse at any point, restore the backup and stop. Never hand me a
half-written settings.json.
```
**If it goes wrong:** the session-start line prints nothing — the hook can't find `pipeline.json`; check `ls ~/claudefleet/pipeline.json` and the `CLAUDEFLEET_HOME` env key.

---

### Prompt 7 — Configure the Higgsfield brief format for your brand style
**When you run it:** once, after Prompt 6, with two or three reference clips or images you like.
**What you get back:** `config/higgsfield-brief.md` — a reusable brief template plus one fully worked example.

```
You are defining the house format for every media brief this machine will hand to Higgsfield.
The engine never generates media; it writes briefs I paste into my own Higgsfield account, on my
own credits.

INPUTS
- PROFILE: ~/claudefleet/product-machine/config/profile.md
- LOOK I WANT: [3-6 words, e.g. "clean desk, daylight, no people"]
- REFERENCES: [links or file paths to 2-3 clips/images whose look I want — or describe them]
- PRIMARY ASPECT: [9:16]
- SECONDARY ASPECT: [1:1]
- SHOT LENGTH I EDIT TO: [e.g. 3-5 seconds]
- THINGS THAT MUST NEVER APPEAR: [e.g. fake logos, invented UI, on-screen text, faces]

STEPS
1. Read PROFILE for voice and hard nos.
2. Write FLEET_HOME/product-machine/config/higgsfield-brief.md containing:
   a. A BRIEF TEMPLATE with fixed fields: card id, product slug, purpose of the clip, aspect,
      shot count, per-shot rows (subject / camera move / lighting / duration / negative
      constraints), reference image slot, and output filename convention
      assets/<slug>/<card-id>-shot-N.<ext>.
   b. A HOUSE STYLE block derived from LOOK I WANT and REFERENCES, written as directive prompt
      language, not adjectives — say what is in frame and how the camera moves.
   c. A NEVER list built from THINGS THAT MUST NEVER APPEAR, plus this default: no invented
      statistics, prices, logos, or product UI rendered as if real.
   d. A CREDITS block: a place to record what each batch actually cost me in credits after the
      fact. Do not estimate credit costs and do not quote Higgsfield's pricing — I check that on
      their pricing page.
   e. A REGENERATION RULE: what makes a clip a reject (garbled on-screen text, warped hands,
      wrong aspect) and how many retries before I change the prompt instead.
3. Then write one COMPLETE worked example brief, filled in for the product idea in card p-0001,
   ready to paste into Higgsfield with no edits.

QUALITY BAR
The worked example must contain zero brackets and zero "insert here". If I can't paste it as-is,
it's not done.
```
**If it goes wrong:** clips come back generic — your house style block is still adjectives; rewrite it as concrete nouns, camera moves and lighting.

---

### Prompt 8 — Configure the Postiz channel mapping
**When you run it:** once, after your Postiz instance is connected to your social accounts.
**What you get back:** `config/postiz-channels.md` — the channel table, slot plan, and the approval gate `/dp-schedule` obeys.

```
You are writing the distribution config for my Digital Product Machine. Postiz is where finished
copy and finished assets get scheduled; it is connected to my own social accounts.

INPUTS
- CHANNELS I HAVE CONNECTED IN POSTIZ: [list them exactly as Postiz names them, with handles]
- POSTIZ SETUP: [hosted or self-hosted, and the URL I open]
- MY POSTING WINDOWS: [e.g. Tue/Thu 18:00 and Sat 10:00, local time — and my timezone]
- LAUNCH LENGTH: [e.g. 7 days]
- WHO APPROVES: [me]

STEPS
1. Write FLEET_HOME/product-machine/config/postiz-channels.md with:
   a. A CHANNEL TABLE: Channel | Handle | Asset format | Aspect | Caption style | Link allowed?
      | Verified caption/limit notes. Leave the limit column to be filled from what Postiz's own
      composer shows me — do not state any platform's character or duration limits from memory.
   b. A SLOT PLAN mapping MY POSTING WINDOWS across LAUNCH LENGTH: for each slot, the channel,
      the asset type, and the job that post does (tease / teach / proof / offer / close).
   c. A NAMING CONTRACT: every scheduled item is identified as <card-id>-<slot-n>, and the
      matching media file is assets/<slug>/<card-id>-shot-N.<ext>, so a failed post is traceable
      back to one card in pipeline.json.
   d. An APPROVAL GATE, stated as a binding instruction to future sessions: /dp-schedule prepares
      drafts and a schedule table and then STOPS. Nothing is queued, scheduled, or published
      until I reply with an explicit approval line. Claude never posts on my behalf.
   e. A FAILURE PLAYBOOK: expired channel token, rejected media aspect, duplicate-content
      rejection — what to do for each, and where to record it (card.notes plus the services block
      in pipeline.json).
2. Set services.postiz.connected in pipeline.json to true only if I confirm the channels are
   actually connected right now.

OUTPUT
The file, then a 5-line summary of the slot plan.
```
**If it goes wrong:** you can't name your channels exactly — open Postiz and copy them verbatim; a mismatched channel name is the most common scheduling failure.

---

### Prompt 9 — End-to-end smoke test
**When you run it:** once, immediately after Prompt 8, before you put real work in.
**What you get back:** `notes/SMOKE-TEST.md` — a pass/fail table for all five stages, and a pipeline restored to its pre-test state.

```
You are testing that my Digital Product Machine actually works end to end, using a throwaway
product so that a failure costs me nothing.

SETUP
1. Copy ~/claudefleet/pipeline.json to ~/claudefleet/pipeline.json.pre-smoke and tell me the path.
2. Add one card: id "p-9999", machine "product", stage 0, title "SMOKE TEST — do not sell",
   notes first line "slug: smoke-test".

RUN — after each of the five steps, re-read pipeline.json and record what actually changed
(card stage index before/after, the appended notes line, the new log entry's text), plus which
files appeared under product-machine/notes/smoke-test/.
3. /dp-validate on p-9999. Use the throwaway topic "a one-page checklist for [MY_NICHE]".
4. /dp-build on p-9999 — a deliberately tiny deliverable is fine, but it must be real content.
5. /dp-package on p-9999.
6. /dp-launch on p-9999 — the Higgsfield brief must come out in the format defined in
   config/higgsfield-brief.md. Do not generate any media.
7. /dp-schedule on p-9999 — it must produce the schedule table and then STOP at the approval
   gate. If it schedules or publishes anything, that is a FAIL and the most serious one.

CHECKS
8. Confirm the SessionStart hook now reports Validate/Build/Package/Launch Kit/Scheduled counts
   including p-9999, and that ~/claudefleet/logs/run.log gained lines during this session.
9. Confirm pipeline.json still parses: python3 -m json.tool.

OUTPUT
Write notes/SMOKE-TEST.md: a table Stage | Skill | Card moved? | Log entry written? | Artifacts |
PASS/FAIL, then a numbered list of every defect with the exact file or line at fault.

CLEANUP
10. Restore pipeline.json from pipeline.json.pre-smoke, delete notes/smoke-test/ and
    assets/smoke-test/ (if either exists), and confirm p-9999 is gone. Leave SMOKE-TEST.md in
    place.
```
**If it goes wrong:** a stage runs but the card doesn't move — that skill's STAGE CONTRACT section is missing or its gate silently failed; open its SKILL.md and check it writes pipeline.json back.

---

## PART B — OPERATING PROMPTS

These are the ones you keep. Start every session with `cd ~/claudefleet && claude`.

### Prompt 10 — Fill the idea bank
**When you run it:** whenever Validate has fewer than five cards in it — typically once a month.
**What you get back:** `notes/idea-bank-<date>.md` plus new stage-0 cards in `pipeline.json`.

```
You are stocking the Validate stage of my Digital Product Machine with product candidates that
come from evidence, not from your imagination.

INPUTS
- PROFILE: ~/claudefleet/product-machine/config/profile.md
- RAW SIGNAL I AM PASTING: [paste real material — customer DMs, support tickets, the questions
  you get asked most, comments, a competitor's FAQ. Quantity beats polish.]
- SIGNAL SOURCES I CAN CHECK: [subreddits, forums, communities, marketplaces I actually use]
- HOW MANY: [12]
- FORMATS ALLOWED: [from PROFILE — templates, kits, prompt packs, short courses]

STEPS
1. Read PROFILE. Read the pipeline.json cards already at Validate so you don't duplicate them.
2. Cluster RAW SIGNAL into recurring problems. For each cluster, quote the strongest 1-2 real
   lines verbatim — that quote is the cluster's evidence and must be traceable to what I pasted.
3. Produce HOW MANY product candidates. Each: working title; the one problem it removes; who it
   is for; format; the smallest version that would still be worth paying for; the single
   assumption that would kill it if false.
4. Score each 1-5 on: evidence strength (how much real signal), how narrow the audience is, how
   fast I could build it, and how easily it is copied. Show the scores; do not average them into
   a fake composite.
5. Write notes/idea-bank-<today>.md with all of it, then add the top [5] as new cards at stage 0
   in pipeline.json following the stage contract's id and slug rules.

CONSTRAINTS
Zero invented numbers — no market sizes, no search volumes, no revenue figures, no "everyone is
looking for X". If you have no evidence for a cluster, label it UNVERIFIED and list what I'd have
to go look at. Never describe any candidate in terms of what it will earn.
```
**If it goes wrong:** the ideas feel generic — you pasted too little raw signal; 20 real customer messages beat any amount of clever prompting.

---

### Prompt 11 — Advance a card: Validate → Build
**When you run it:** on one card at a time, when you're ready to give an idea a GO or a NO-GO.
**What you get back:** `notes/<slug>/validation.md` — a cited evidence memo ending in an explicit GO / NO-GO / MORE RESEARCH verdict.

```
Run /dp-validate on my Digital Product Machine. Delegate the evidence gathering to the
dp-researcher agent, then make the call yourself.

INPUTS
- CARD: [p-0003]  (or the card title)
- WHAT I ALREADY KNOW: [anything I've heard directly from this audience — quotes preferred]
- PLACES TO CHECK: [the communities, marketplaces, or search terms worth looking at]
- MY EVIDENCE BAR: [the skill's own minimum is three independent demand signals plus two
  comparable paid products — raise it if you want more before you'll say GO]

STEPS
1. Load the card from pipeline.json and config/profile.md. Refuse to continue if the card is not
   at stage 0, and tell me which skill it needs instead.
2. Have dp-researcher gather evidence: who has this problem, in their own words; what they
   currently do instead; what comparable products already exist and what buyers complain about
   in them. Every item needs a source I can open and the date it was read, or it does not count.
3. The returned memo must contain, in order: the problem in the buyer's own words; at least
   three demand signals (URL, date read, quote or paraphrase); at least two comparable paid
   products (name, URL, what's included, price shown today); the gap those comparables leave;
   three named risks; and a verdict. Anything not found is written as "not found."
4. Write notes/<slug>/validation.md with a first line of `DECISION: PENDING`.
5. Print the verdict, the three strongest signals, and the three risks, then ask me for
   **GO / NO-GO / MORE RESEARCH** and wait — you never make this call.
6. On GO: rewrite line 1 to `DECISION: GO <today>` and advance the card to Build (stage 1). On
   NO-GO or MORE RESEARCH: leave the card at Validate (stage 0), append the reason to card.notes,
   and stop — that is a successful outcome, not a failed prompt.

CONSTRAINTS
No invented statistics, no invented quotes, no estimated market sizes. Unverifiable items are
written as "not found," never smoothed over. A GO with fewer than three signals and two
comparables is a failure of this prompt — say so instead of padding the memo.
```
**If it goes wrong:** everything comes back GO — dp-researcher is short-changing the risks or padding weak signals as strong ones; ask it to argue the NO-GO case first.

---

### Prompt 12 — Advance a card: Build → Package
**When you run it:** after a GO verdict, across as many sessions as the product needs.
**What you get back:** real, finished deliverable files under `notes/<slug>/build/`.

```
Run /dp-build on my Digital Product Machine. Outline first and stop; draft only after I approve.

INPUTS
- CARD: [p-0003]
- SCOPE CEILING: [the version I can finish in <N> focused work blocks — be brutal]
- DELIVERABLE LIST: [what the buyer receives, e.g. "18 templates + one 12-page walkthrough"]
- WHAT I WILL NOT INCLUDE IN V1: [say it out loud so it stops creeping back in]
- SOURCE MATERIAL: [my own notes, past client work, transcripts — paths or pasted text]
- WORKING DAYS THIS BUILD GETS: [the skill refuses to run without a number]

STEPS
1. Load the card, notes/<slug>/validation.md, and config/profile.md. Refuse to run if the card
   is not at Build (stage 1), or if line 1 of validation.md does not start with `DECISION: GO`.
2. Delegate to dp-builder, asking first for notes/<slug>/build/00-outline.md only: the
   deliverable list mapped to the exact problem from the validation memo, and for each item its
   purpose, its format, and the single thing the buyer does with it. Any item that does not trace
   back to a validated problem gets cut, not justified. Show me the outline and STOP.
3. On my approval — with the cuts recorded under a `## Cut from v1` heading in the outline —
   re-run dp-builder on the approved outline to draft every deliverable as a complete, numbered
   file in notes/<slug>/build/ (`01-...md`, `02-...md`), plus `assets-needed.md` for anything
   only I can supply.
4. Run the shipped placeholder sweep before advancing:
   `grep -rniE "TODO|TBD|lorem ipsum|\[insert|placeholder|coming soon|XXX" notes/<slug>/build/`
   Any hit that is not inside assets-needed.md gets fixed and re-checked.
5. Read one deliverable end to end yourself and confirm someone with the buyer's context could
   act on it without asking a question.
6. Advance the card to Package (stage 2) only when every item in DELIVERABLE LIST exists as a
   real file and the placeholder sweep is clean.

QUALITY BAR
Every deliverable must be usable by someone who has never spoken to me. No "TODO", no "insert
your X here" except where a fill-in blank is genuinely the point of a template, no lorem ipsum,
no section that only restates its own title. Prefer 12 things that work over 40 that gesture.
```
**If it goes wrong:** it drafts everything at once and quality collapses — enforce one deliverable per pass, and start a fresh session when the context gets long.

---

### Prompt 13 — Advance a card: Package → Launch Kit
**When you run it:** once the build's placeholder sweep is clean.
**What you get back:** `notes/<slug>/package/` — manifest, buyer README, terms, and paste-ready Higgsfield briefs; renders you generate land in `assets/<slug>/`.

```
Run /dp-package on my Digital Product Machine. Turn finished files into something a stranger can
buy, download, and use without asking me a question.

INPUTS
- CARD: [p-0003]
- PRICE: [the number I have decided — the packager proposes a band, you do not choose it]
- WHERE IT WILL BE SOLD: [e.g. Gumroad, Lemon Squeezy, my own site]
- WHAT THE BUYER GETS ACCESS TO AFTER PURCHASE: [zip, hosted folder, Notion duplicate link]
- SUPPORT I WILL ACTUALLY PROVIDE: [e.g. email replies within 3 working days — only promise what
  I will really do]

STEPS
1. Load the card and notes/<slug>/build/00-outline.md. Refuse to run if the card is not at
   Package (stage 2), or if notes/<slug>/build/assets-needed.md lists a blocker I have not
   supplied.
2. mkdir notes/<slug>/package/ and assets/<slug>/.
3. Delegate to dp-packager. It writes into notes/<slug>/package/:
   - manifest.md — every file in the bundle, checked against a real `ls -R` of build/, one line
     each.
   - README-for-buyer.md — what this is, who it's for, and a quickstart to one useful result in
     five minutes.
   - terms.md — usage licence and the 30-day money-back refund terms. No sales page here — that
     is /dp-launch's job, next.
   - media-briefs.md — paste-ready Higgsfield prompts for one cover image and three promo
     stills.
4. Check manifest.md against the actual `ls -R build/` yourself — a manifest listing a file the
   folder doesn't contain is a refund waiting to happen.
5. PRICE GATE: dp-packager proposes a price band with its reasoning from the comparables in
   validation.md. Present the band, then ask me for the number. Write only the number I give into
   manifest.md — never publish a price I have not approved.
6. Tell me to run the prompts in media-briefs.md in my own Higgsfield account and drop the
   renders into assets/<slug>/, keeping the filenames the brief specifies.
7. Advance the card to Launch Kit (stage 3) once the price is approved and the terms are written.

OUTPUT
The package folder tree, manifest.md, and the media briefs — no sales page and no launch copy
here; that starts at /dp-launch.
```
**If it goes wrong:** the manifest lists a file that isn't there — rerun the `ls -R` check yourself before advancing; dp-packager should never write from memory or from the outline.

---

### Prompt 14 — Advance a card: Launch Kit → Scheduled
**When you run it:** when the package is done and you're ready to produce the campaign.
**What you get back:** `notes/<slug>/launch/` — sales page, five-email sequence, launch-week posts, and paste-ready Higgsfield video briefs.

```
Run /dp-launch on my Digital Product Machine. Delegate writing to dp-launch-writer, sweep for
banned claims yourself, and produce media briefs in my house format.

INPUTS
- CARD: [p-0003]
- LAUNCH WINDOW: [cart open date, cart close date or "always open", and my timezone]
- LIST SIZE AND CONTEXT: [e.g. "340 subscribers, last emailed 6 weeks ago" — or "no list yet"]
- CHANNELS: [from config/postiz-channels.md]
- OFFER MECHANIC: [e.g. launch price for the first 7 days, then standard price — or none]
- ONE THING I WANT REMEMBERED: [the single idea the campaign should hammer]

STEPS
1. Load the card, notes/<slug>/package/manifest.md (must already carry a price I approved),
   notes/<slug>/validation.md, config/profile.md, config/higgsfield-brief.md,
   config/postiz-channels.md. Refuse to run if the card is not at Launch Kit (stage 3), or if
   I have not given a real cart-open date, cart-close date, and timezone.
2. Skim two deliverables from notes/<slug>/build/ so the copy describes what's actually inside.
3. Delegate to dp-launch-writer. It writes into notes/<slug>/launch/:
   - sales-page.md — headline, the problem in the buyer's words, what's inside (straight from
     the manifest), who it's not for, price, the 30-day money-back terms, and an FAQ built from
     validation.md's objections.
   - emails.md — five emails (announce, teach, objection, proof-or-process, close), each with
     subject line, preview text, body, and a send offset from cart open. Where I have no proof,
     use process — show how the thing was made — never a fabricated testimonial.
   - social.md — launch-week posts grouped per channel, following config/postiz-channels.md,
     each tagged with its slot in the week.
   - promo-video-briefs.md — two Higgsfield video briefs in the exact template from
     config/higgsfield-brief.md, paste-ready, output filenames as
     assets/<slug>/<card-id>-shot-N.mp4.
   - needs-user.md — anything the copy wants but nobody can invent.
4. Sweep before showing me anything:
   `grep -rniE "guarantee[d]? (income|results|earnings)|make \$|passive income|replace your (job|salary)|[0-9]+x (your|more)|testimonial|case study" notes/<slug>/launch/`
   Every hit is guilty until proven innocent; fix it, or move the underlying claim to
   needs-user.md if I could legitimately supply it.
5. Read the sales page and email 1 back to me and get an explicit approval or edit list — this
   is the copy that goes out under my name. Nothing advances without it.
6. On my approval, advance the card to Scheduled (stage 4) — exactly as the shipped skill does,
   with no separate "ready" holding stage in between — and log what was produced.

CONSTRAINT
The only guarantee that may appear is the 30-day money-back refund guarantee. No income claims,
no "results guaranteed", no invented social proof — not in a subject line, not in a caption.
```
**If it goes wrong:** the emails all sound the same — give each one a different job and forbid it from restating the others' argument.

---

### Prompt 15 — Advance a card: Scheduled (launch it)
**When you run it:** once your Higgsfield clips are back and dropped into `assets/<slug>/`, and the launch copy is approved.
**What you get back:** `notes/<slug>/schedule/postiz-plan.md` — a slot-by-slot table plus email send times, a hard stop for your approval, and (after you queue it) `queued.md` and `retro.md`.

```
Run /dp-schedule on my Digital Product Machine. Prepare everything, queue nothing until I say so.

INPUTS
- CARD: [p-0003]
- LAUNCH START DATE AND MY TIMEZONE: [2026-08-04, Africa/Cairo]
- ASSETS PRESENT: [confirm what is actually in assets/<slug>/ — list the filenames]
- CHANNEL EXCEPTIONS THIS RUN: [e.g. skip X this week]
- SALES PAGE LIVE URL: [the machine will not schedule posts pointing at a page that isn't live]

STEPS
1. Load the card, notes/<slug>/launch/social.md, notes/<slug>/launch/emails.md, and the actual
   listing of assets/<slug>/. Refuse to run if the card is not at Scheduled (stage 4 — this is
   the stage /dp-launch already advanced it to; /dp-schedule does not wait at Launch Kit), or if
   social.md and emails.md were not approved in /dp-launch, or if the sales page has no live URL.
2. Delegate to dp-scheduler. It writes notes/<slug>/schedule/postiz-plan.md: one row per post
   with channel, date and time including timezone, the exact caption from social.md, the asset
   filename, the link, and any platform-required trim (flagged, never silently applied); then
   the email send times as offsets from cart open; then a conflicts section for anything
   colliding or missing.
3. Check every asset filename in the plan against the real assets/<slug>/ listing yourself
   before showing it to anyone. Anything unmatched is a blocker, not a hopeful row.
4. STOP. Show me the full plan and wait. Nothing is queued, scheduled, or published until I
   reply with an explicit approval line — Claude never posts on my behalf.
5. After I approve and queue it myself in my own Postiz account, ask me what actually went in
   and what failed (expired tokens and rejected media are the normal failures). Write the answer
   into notes/<slug>/schedule/queued.md with a timestamp.
6. This is the machine's last stage: the card stays at Scheduled (stage 4) — there is no stage 5
   to advance to. Mark the card LAUNCHED in card.notes and the log entry instead of bumping the
   stage index, set services.postiz.lastRun, and append three lines to
   notes/<slug>/schedule/retro.md for next cycle.

CONSTRAINTS
Publishing is my action, not yours. If any asset is missing, the correct output is a blocked
schedule and a list of what to regenerate — never a filler post and never a repeated clip
presented as a new one.
```
**If it goes wrong:** a channel rejects the media aspect — check the Aspect column in postiz-channels.md against what Higgsfield actually rendered, then regenerate that shot rather than letting the platform re-crop it.

---

### Prompt 16 — Batch a week of output
**When you run it:** one long session per week, usually Monday.
**What you get back:** `notes/week-<date>-plan.md` and several cards advanced in one pass.

```
You are running my Digital Product Machine's weekly batch. Plan the week against real capacity,
then execute, then report honestly.

INPUTS
- HOURS I ACTUALLY HAVE THIS WEEK: [6]
- HIGGSFIELD CREDITS I AM WILLING TO SPEND: [the number from my own account balance]
- WIP LIMIT: [max 2 cards in Build at once]
- MUST SHIP THIS WEEK: [the one card that matters most, or "none"]

STEPS
1. Read pipeline.json. Print the current board: every card grouped by stage, with days since its
   last log entry.
2. Propose the week: which cards advance which stage, in what order, with a rough time cost per
   move. Respect WIP LIMIT and HOURS I ACTUALLY HAVE — if the plan does not fit, cut cards and
   say which, do not compress estimates to make it fit.
3. Sequence so that anything needing Higgsfield turnaround happens on day 1, since generation and
   my review sit between /dp-launch and /dp-schedule.
4. Show me the plan and STOP for approval.
5. On approval, execute card by card, running the appropriate slash command for each
   (/dp-validate, /dp-build, /dp-package, /dp-launch, /dp-schedule). After each card, re-read
   pipeline.json to confirm the stage index actually moved, and start a fresh sub-task per card
   so context from one product does not bleed into another.
6. Anything that fails its stage gate stops there with the reason written into card.notes. Do
   not force a card forward to hit the plan.
7. Write notes/week-<date>-plan.md: planned vs actual, per card, with the reason for every miss.

CONSTRAINT
A batch report that claims more progress than pipeline.json shows is worse than no report.
Reconcile against the file, not against your memory of the session.
```
**If it goes wrong:** quality drops in the second half of the batch — you're running one long context; split the batch across two sessions and reload the board at the start of each.

---

### Prompt 17 — Weekly review and stuck-card triage
**When you run it:** end of the week, before you plan the next one.
**What you get back:** `notes/review-<date>.md` — board health, cost log, and a per-card unstick plan.

```
You are reviewing my Digital Product Machine the way an unimpressed operations person would.
Facts from the files, not encouragement.

INPUTS
- WEEK ENDING: [2026-08-08]
- WHAT I ACTUALLY SPENT THIS MONTH: [my real invoice amounts for Claude, Higgsfield, Postiz —
  from my own billing pages; leave blank and I'll fill them in]
- STUCK THRESHOLD: [7 days with no log entry]
- WHAT SOLD OR LANDED THIS WEEK: [real numbers from my own store/analytics, or "nothing yet"]

STEPS
1. Read pipeline.json and ~/claudefleet/logs/run.log. Report: cards per stage; every card whose
   last log entry is older than STUCK THRESHOLD; the stage where cards pile up most.
2. For EVERY stuck card, do a short autopsy: which gate is it failing (the gate condition is in
   that stage's SKILL.md), what exactly is missing, and the single next action that unsticks it.
   Classify each as blocked-by-me, blocked-by-a-service, blocked-by-missing-input, or
   badly-scoped. Say plainly if the honest answer is to kill the card.
3. Update the costs array in pipeline.json with WHAT I ACTUALLY SPENT. Do not estimate, infer,
   or fill in any vendor's pricing — blank stays blank until I supply a number.
4. Check the services block against reality: is anything showing connected that has actually
   failed recently in the log?
5. Compare this week's plan (notes/week-<date>-plan.md) with what the log shows happened, and
   name the one process defect that cost the most time.
6. Write notes/review-<date>.md: the board, the stuck-card autopsies with next actions, the cost
   table, the one defect, and three candidate moves for next week ranked by what they unblock.

CONSTRAINT
No motivational language, no vanity summaries, no projections of future income or sales. If the
week was bad, the review says the week was bad and names the reason.
```
**If it goes wrong:** the review reads as cheerful and vague — it's summarising the chat instead of the files; make it quote line numbers from `logs/run.log` and card ids from `pipeline.json` for every claim.
