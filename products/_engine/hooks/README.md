# Hooks

`settings-hooks.json` in this folder is what you merge into `~/.claude/settings.json`
(see `../INSTALL.md` step 6 for the merge itself).

## Read this before you merge anything

**Hooks run shell commands on your machine, automatically, with your user's
permissions.** They fire without asking you, on every session start, on every file
write, at the end of every session. A hook can do anything you can do at a terminal:
read your files, delete them, make network calls. Pasting hook JSON from the internet
into your settings without reading it is a genuine risk, and that includes hook JSON
that came in a product you paid for. Open `settings-hooks.json`, read all three
`command` strings, and satisfy yourself about what they do before merging.

Here is what these three actually do, in full: they read `pipeline.json`, they create a
`logs/` directory inside your fleet home, and they append lines to `logs/run.log`. No
network calls, no deletes, no writes anywhere except `$CLAUDEFLEET_HOME/logs/run.log`,
no data leaves your machine. Every command is a `python3 -c '...'` one-liner you can
read end to end in about thirty seconds. Do that.

If you don't want them, the engine still works — you lose the automatic pipeline
snapshot and the audit log, nothing else. Skills and agents don't depend on hooks.

## The three hooks

All three resolve the fleet home the same way: `$CLAUDEFLEET_HOME` if set, otherwise
`~/claudefleet`.

### 1. `SessionStart` — pipeline snapshot into context

**Runs:** every time a Claude Code session starts.
**Does:** reads `$CLAUDEFLEET_HOME/pipeline.json`, counts the active machine's cards per
stage, and prints one line — `ClaudeFleet [content] Idea:1 | Script:1 | Render:1
| Assemble:1 | Scheduled:1 || last run: /cf-render — 5-shot Higgsfield brief
written...`. `SessionStart` stdout is added to the session's context, so Claude opens
every session already knowing where the work stands.
**Why:** it removes the "remind me where we are" turn at the top of every session, and
it stops Claude inventing pipeline state it hasn't read.
**Writes nothing.** If `pipeline.json` is missing or malformed it prints nothing and
exits cleanly. If the file has no `stages` array (the admin panel drops that key when it
exports, since it carries its own stage names), the line degrades to `stage1:… stage5:…`
— still correct counts, just generic labels.

### 2. `PostToolUse` (matcher `Write|Edit`) — file audit line

**Runs:** after Claude successfully writes or edits a file.
**Does:** if the file is inside your fleet home, appends a tab-separated line to
`logs/run.log`: timestamp, `file`, tool name, absolute path. Files outside the fleet
home are ignored entirely, so working in unrelated repos never touches this log.
**Why:** the `log` array in `pipeline.json` is the curated history a skill chooses to
record; this is the raw one. When a card's assets are wrong and you need to know what
was written and when, this is the file that answers it. Append-only text can't corrupt
your pipeline the way a concurrent JSON rewrite can.

### 3. `Stop` — session end marker

**Runs:** when the main agent finishes responding and the session stops.
**Does:** if the session's working directory is inside your fleet home, appends
`timestamp  session-end  <session_id>` to `logs/run.log`. Sessions started elsewhere are
ignored.
**Why:** it brackets the run, so a day's log reads as a sequence of sessions rather
than a flat pile of writes.
**Note:** because of the cwd guard, this only fires for sessions you start from inside
the fleet home — `cd ~/claudefleet && claude`. To log sessions started anywhere, edit
the command in your settings and replace `ok=(c+os.sep).startswith(h+os.sep)` with
`ok=True` — then every Claude Code session on your machine writes a line here.

## How to test a hook actually fired

Real-session test (the honest one): `cd ~/claudefleet && claude`, ask it to create a
file in that folder, exit, then `cat ~/claudefleet/logs/run.log`. Two new lines.

Direct test without a session — feeds each hook the same JSON shape Claude Code sends on
stdin, straight out of your installed settings:

```zsh
export CLAUDEFLEET_HOME="$HOME/claudefleet"
S="$HOME/.claude/settings.json"

# 1. SessionStart — should print the pipeline line
jq -r '.hooks.SessionStart[-1].hooks[0].command' "$S" | zsh

# 2. PostToolUse — should add a "file" line to the log
echo "{\"tool_name\":\"Write\",\"tool_input\":{\"file_path\":\"$CLAUDEFLEET_HOME/notes/hook-test.md\"},\"cwd\":\"$CLAUDEFLEET_HOME\"}" \
  | zsh -c "$(jq -r '.hooks.PostToolUse[-1].hooks[0].command' "$S")"

# 3. Stop — should add a "session-end" line
echo "{\"session_id\":\"manual-test\",\"cwd\":\"$CLAUDEFLEET_HOME\"}" \
  | zsh -c "$(jq -r '.hooks.Stop[-1].hooks[0].command' "$S")"

tail -3 "$CLAUDEFLEET_HOME/logs/run.log"
```

(The `[-1]` picks the last entry for that event, which is ours if you merged by
appending. If you have other hooks on the same events, check the index.)

You can also run `/hooks` inside a Claude Code session to see what's registered, and
start Claude with `claude --debug` to watch hooks execute.

## When a hook does nothing

Each command ends with `2>/dev/null || true` — deliberately, so a broken hook can never
block your session or spray errors into your terminal. The cost is silence when it
fails. To debug, copy the command, strip the trailing `2>/dev/null || true`, and run it
by hand; python will tell you what's wrong. Usual causes:

- `python3` not on PATH (`python3 -V`).
- Fleet home isn't where the hook thinks: it defaults to `~/claudefleet` and only uses
  `CLAUDEFLEET_HOME` if that variable is visible to the process Claude Code spawned.
  Setting it in `~/.zshrc` works for terminal launches; the reliable route is the `env`
  key in `settings.json` (see INSTALL.md).
- `pipeline.json` is malformed — `jq -e . ~/claudefleet/pipeline.json` tells you.
- For hooks 2 and 3, the path or cwd was outside the fleet home, so the guard skipped
  it. That's correct behavior, not a bug.

Hook edits take effect on the next session; run `/hooks` or restart Claude Code after
changing `settings.json`.

## How to remove them

Restore the timestamped backup INSTALL.md told you to take:

```zsh
ls ~/.claude/settings.json.bak.*
cp ~/.claude/settings.json.bak.<timestamp> ~/.claude/settings.json
```

Or remove them by hand: open `~/.claude/settings.json`, and inside `"hooks"` delete our
array element from `SessionStart`, `PostToolUse` and `Stop` — the ones whose `command`
starts with `python3 -c 'import json`. Leave any other elements in those arrays alone,
and leave the event keys themselves in place if other hooks still use them. Validate
afterwards with `jq -e . ~/.claude/settings.json`; a settings file that doesn't parse is
a bad afternoon.

Removing hooks does not touch `logs/run.log` or `pipeline.json`. Delete those yourself
if you want them gone.
