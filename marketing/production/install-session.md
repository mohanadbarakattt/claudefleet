# Install session — Day 5 / Reel 4 opening / SR-01

The install was run for real from the shipped zip. `install-transcript.txt` is
the verbatim capture; `install-replay.html` replays it as a 9:16 terminal you
screen-record in one take.

## What was captured
12 commands, 44 lines, from `unzip` to `pipeline.json: valid JSON`. It shows:
the zip unpacking to `autopilot-content-machine/`, the three exports, the six
`content-machine/` directories being created, the seed copied, **5 agents** into
`~/.claude/agents/`, **5 skills** as `~/.claude/skills/<name>/SKILL.md`, the
admin panel copied to `~/claudefleet/admin.html`, the resulting tree, and a JSON
validity check.

## How to record it (one take, no typing)
1. Open `install-replay.html` in a browser. It autoplays on load.
2. Record the **405×720 stage** — that rectangle is already 9:16. QuickTime
   (⌘⇧5 → Record Selected Portion) or any capture tool.
3. Press **Replay** to restart, or **Replay 4×** for a faster cut.
4. Roll ~40s at 1×, ~12s at 4×.

The live clock in the footer keeps running, so the recording carries a real
timestamp.

## What this footage does and does not claim
It is a **replay of a genuine install** — every command and every line of output
is verbatim from a real run against the real zip. The footer says
`replay of a real install — verbatim captured output` and stays in frame, so the
claim is accurate on its face.

**Do not caption it "watch me install this live."** It is a replay, exactly like
an asciinema cast. The honest line is what Day 5 and Reel 4 already say: *"I
installed it from the shipped zip — here's what happened."* That is true.

**What it can't replace:** a live `/cf-script` run. The install is deterministic,
so a replay loses nothing. A skill run is not — its value is the wait, the
generation appearing, the approval gate halting. Reel 2 and Day 30 need that
captured live from a real session (see `screen-record-shotlist.md` Session B).

## Notes
- Run in a sandboxed `HOME`, so no real `~/.claude` was touched. The output is
  identical to a real install because it is the same script from `_engine/INSTALL.md`.
- Paths are shown as `~` throughout — no personal directories are exposed.
- The install completed clean: all six directories present (the fix from the
  earlier dogfood), valid JSON, no errors.
