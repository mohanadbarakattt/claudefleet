# The ClaudeFleet Engine

You just unzipped a machine. This document explains the thing that runs it.

## What the engine is

The engine is a small, local, file-based orchestration layer that turns Claude Code from
a chat window into an operator for a repeatable business pipeline. Not an app, not a
SaaS, not a server: one JSON file, a handful of markdown files Claude Code already knows
how to load, three hook entries in your settings, one HTML file you open in a browser.
Nothing phones home. Nothing runs unless you run it.

The point is state. A chat session forgets; a pipeline file does not. Every piece of
work gets a stable identity, a position, and a history — so Thursday's session picks up
Tuesday's work without you re-explaining the business.

## The four parts

**1. The pipeline.** `pipeline.json` holds a `machine` key, an ordered `stages` array of
five stage names, a `cards` array (each card is one item of work: `id`, `machine`,
`stage` as a 0-4 index, `title`, `created`, `notes`), a `log` array of runs (`ts`,
`machine`, `stage`, `text`), a `costs` array (`month`, `service`, `amount`, `note` —
numbers you record yourself), and a `services` block tracking whether Claude, Higgsfield
and Postiz are connected. Exactly five stages per machine; the names differ because the
work differs — the content machine runs Idea → Script → Render → Assemble → Scheduled,
the product machine Validate → Build → Package → Launch Kit → Scheduled. Plain JSON on
purpose: readable, hand-editable, diffable, git-able.

**2. Skills.** Claude Code skill files (markdown with YAML frontmatter carrying a
`description`). Each skill advances a card out of one stage into the next and writes the
result back into `pipeline.json`. Five per machine, one per stage, named for the work
they finish — `/cf-ideas`, `/cf-script`, `/cf-render`, `/cf-assemble`, `/cf-schedule` on
the content machine, and `/dp-validate`, `/dp-build`, `/dp-package`, `/dp-launch`,
`/dp-schedule` on the product machine. They are the verbs of the business; each skill's
own instructions tell Claude what "done" means for that stage.

**3. Agents.** Claude Code subagent files (YAML frontmatter with `name`, `description`
containing `<example>` blocks, `tools`, `model`) — the specialists a stage delegates to:
a strategist, a script writer, a prompt engineer, a reviewer. Skills decide *what stage*
happens; agents do the work inside it, in their own context window, so the main session
stays cheap and focused.

**4. Hooks.** Entries in Claude Code's `settings.json` firing on real events
(`SessionStart`, `PostToolUse`, `Stop`) — the engine's black box recorder. On session
start they print the current stage counts into context so Claude knows where the business
stands before you type; on file writes inside your fleet folder and at session end they
append a timestamped line to `logs/run.log`. Hooks execute shell commands on your
machine — read `hooks/README.md` before you merge them.

**Plus the admin panel.** One local HTML file (`_engine/admin-panel/index.html`) — no
build step, no dependencies, no network calls. It shows the business as five stage
columns of cards, plus the run log, the connection state of the three services, and your
logged costs. A browser can't write to your disk on its own, so the sync is explicit and
two-buttoned: **Import JSON** loads the `pipeline.json` Claude has been updating,
**Export JSON** downloads the panel's state as `pipeline.json` to drop back into your
fleet home. Between those, the panel keeps working state in that browser's local storage.

## Where Claude, Higgsfield and Postiz plug in

**Claude (Claude Code) is the brain.** It plans, writes, critiques, and runs the skills
and agents. It reads `pipeline.json`, decides what the next card needs, produces the
words — briefs, scripts, captions, generation prompts — and updates the file. It never
touches the other two services' accounts.

**Higgsfield is the media factory.** The engine writes generation briefs and prompts;
Higgsfield renders the video and image assets from them, in your own account, on your
own credits. You drop the results into the machine's assets folder. The engine tracks
*which* card an asset belongs to and gives you a place to record what the batch cost in
credits — it does not generate media itself and cannot spend credits you haven't bought.

**Postiz is the distribution layer.** Finished assets plus finished copy get scheduled
and published through your Postiz account, connected to your own social accounts. The
engine's job ends at "approved and ready with a schedule".

All three are paid third-party services with their own accounts, limits and billing.
Claude Code needs a paid Claude plan or API billing. Higgsfield needs a paid account to
generate at any useful volume. Postiz is open-source and self-hostable, or you pay for
their hosted plan. Check current pricing on each vendor's own pricing page — this
product does not know their prices and never quotes them. Budget for all three; without
them the machine does not run.

## The data flow

`pipeline.json` is the single source of truth. Everything else is a view or a writer:

- **Skills mutate it.** A skill bumps a card's `stage` index, appends to its `notes`,
  and pushes a record onto `log` (`ts`, `machine`, `stage`, `text` — the text names the
  skill that ran and what it produced).
- **The admin panel is a view over it**, and a second place you can edit by hand (add a
  card, move a stage, log a cost). The sync being manual, one rule keeps both sides
  honest: Import before you look, Export after you edit, and never leave unexported
  panel edits sitting while Claude works the same file — last writer wins.
- **Hooks log, they do not mutate.** They append plain lines to `logs/run.log` —
  deliberate, because an append-only text log cannot corrupt your pipeline the way a
  concurrent JSON rewrite can. The `log` array is the curated history; `logs/run.log`
  is the raw one.
- **You own it.** Editing `pipeline.json` by hand is a supported, normal operation.

## What the engine does not do

- It does not bypass any service's limits, quotas, or pricing. It is a client of Claude,
  Higgsfield and Postiz exactly like you are, and obeys whatever your plans allow.
- It does not post anything anywhere on its own. Publishing happens through *your*
  configured Postiz account, on a schedule you approve. No Postiz account, no posting.
- It does not run unattended. Nothing fires without a session you started.
- It does not send your data anywhere. Every file it uses is on your disk.
- It does not guarantee any business outcome. It is a workflow system: it makes the
  work repeatable and visible. Whether the output sells is down to your offer, your
  market, and your judgment — none of which is included in a zip file.
