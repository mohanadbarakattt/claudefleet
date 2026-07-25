# Install — ClaudeFleet Engine (macOS / Linux, zsh)

Ten minutes. Every path below is literal — a wrong path is the difference between
"this product is great" and "this product is broken", so copy exactly.

## 0. Before you start

You need:

- **Claude Code**, installed and working (`claude --version` prints a version). Requires
  a paid Claude plan or API billing — this is an ongoing cost, not a one-time one.
- **python3** (`python3 -V`). Pre-installed on macOS with the Xcode command line tools
  and on essentially every Linux. The hooks are python one-liners; without python3 they
  silently do nothing.
- **jq** (`jq --version`) — only for the automatic hook merge in step 4. If you don't
  have it, use the manual merge instead. macOS: `brew install jq`.
- Accounts for the services the machine drives: **Higgsfield** (media generation) and
  **Postiz** (scheduling/publishing, hosted or self-hosted). Both are paid third-party
  services with their own billing. Check current pricing on their own pricing pages.

Two locations matter:

| What | Where it goes |
|---|---|
| Agents | `~/.claude/agents/<agent-name>.md` |
| Skills | `~/.claude/skills/<skill-name>/SKILL.md` |
| Hooks | merged into `~/.claude/settings.json` |
| `pipeline.json`, `logs/` | `~/claudefleet/` (your "fleet home") |
| Scripts, briefs, generated assets | `~/claudefleet/<machine>-machine/` |
| Admin panel | `~/claudefleet/admin.html` (copied from `_engine/admin-panel/index.html`) |

Agents and skills can also be installed per-project in `<project>/.claude/agents/` and
`<project>/.claude/skills/` if you'd rather not have them loaded in every session. The
paths below use the user-level (`~/.claude/...`) install because a fleet is a business,
not a repo.

## 1. Set two variables

Point `FLEET_SRC` at the folder you unzipped, and name your machine's working folder
(`content-machine` for the Autopilot Content Machine, `product-machine` for the Digital
Product Machine — these match the folder names the admin panel shows).

The zip unpacks to a folder named after the **machine**, not after the zip file — so
`claudefleet-content-machine.zip` gives you `autopilot-content-machine/`. Use these:

| You bought | Unzipped folder | `MACHINE_DIR` |
|---|---|---|
| Autopilot Content Machine | `autopilot-content-machine` | `content-machine` |
| Digital Product Machine | `digital-product-machine` | `product-machine` |

```zsh
# EDIT THESE TWO LINES to match what you bought and where you unzipped it
export FLEET_SRC="$HOME/Downloads/autopilot-content-machine"
export MACHINE_DIR="content-machine"

export CLAUDEFLEET_HOME="$HOME/claudefleet"
ls "$FLEET_SRC" && ls "$FLEET_SRC/_engine"   # both must list files before you continue
```

If that `ls` errors, you have the wrong `FLEET_SRC`. Find it with
`ls ~/Downloads | grep -iE 'content-machine|product-machine'` and paste the exact name.

## 2–6. The whole install, copy-pasteable

Run this after step 1, in the same terminal window.

```zsh
# --- 2. create the fleet home and seed pipeline.json (never overwrites an existing one)
mkdir -p "$CLAUDEFLEET_HOME/logs" \
  "$CLAUDEFLEET_HOME/$MACHINE_DIR"/{assets,notes,scripts,briefs,posts,schedule}
[ -f "$CLAUDEFLEET_HOME/pipeline.json" ] \
  || cp "$FLEET_SRC/_engine/pipeline.example.json" "$CLAUDEFLEET_HOME/pipeline.json"

# --- 3. agents  ->  ~/.claude/agents/<name>.md
mkdir -p "$HOME/.claude/agents"
for a in "$FLEET_SRC"/agents/*.md(N) "$FLEET_SRC"/*/agents/*.md(N); do
  cp "$a" "$HOME/.claude/agents/"
done

# --- 4. skills  ->  ~/.claude/skills/<name>/SKILL.md
mkdir -p "$HOME/.claude/skills"
for f in "$FLEET_SRC"/skills/*(N) "$FLEET_SRC"/*/skills/*(N); do
  if [ -d "$f" ]; then
    cp -R "$f" "$HOME/.claude/skills/"
  else
    n="${${f:t}:r}"; mkdir -p "$HOME/.claude/skills/$n"
    cp "$f" "$HOME/.claude/skills/$n/SKILL.md"
  fi
done

# --- 5. admin panel
cp "$FLEET_SRC/_engine/admin-panel/index.html" "$CLAUDEFLEET_HOME/admin.html"

# --- 6. hooks: BACK UP settings.json, then merge (read hooks/README.md first)
mkdir -p "$HOME/.claude"
[ -f "$HOME/.claude/settings.json" ] || echo '{}' > "$HOME/.claude/settings.json"
cp "$HOME/.claude/settings.json" "$HOME/.claude/settings.json.bak.$(date +%Y%m%d%H%M%S)"
jq -s '.[0] as $cur | .[1] as $new
       | $cur + {hooks: (reduce ($new.hooks | keys_unsorted[]) as $k
                  (($cur.hooks // {}); .[$k] = ((.[$k] // []) + $new.hooks[$k])))}' \
   "$HOME/.claude/settings.json" "$FLEET_SRC/_engine/hooks/settings-hooks.json" \
   > "$HOME/.claude/settings.json.new" \
  && jq -e . "$HOME/.claude/settings.json.new" >/dev/null \
  && mv "$HOME/.claude/settings.json.new" "$HOME/.claude/settings.json" \
  && echo "hooks merged"
```

### About that merge — read this before you run it

`settings.json` almost certainly already has content, and may already have hooks (from
plugins, from your own setup). **Do not replace the file, and do not replace the
`hooks` object.** The `jq` above is written specifically to avoid that: it keeps every
existing key, and for each of the three events it *appends* our entry to whatever array
is already there. It writes to a temp file, validates it parses, and only then moves it
into place — and you took a timestamped backup on the line before.

**Manual merge instead** (no jq): open `~/.claude/settings.json` in an editor and open
`_engine/hooks/settings-hooks.json` next to it. If your file has no `"hooks"` key,
paste the whole `"hooks": { ... }` object in as a top-level key. If it already has one,
paste each event's *array element* into the matching existing array, e.g.:

```jsonc
// before
"hooks": { "Stop": [ { "hooks": [ { "type": "command", "command": "your-existing-thing" } ] } ] }

// after — your entry kept, ours appended to the same array
"hooks": { "Stop": [ { "hooks": [ { "type": "command", "command": "your-existing-thing" } ] },
                     { "hooks": [ { "type": "command", "timeout": 10, "command": "python3 -c '...'" } ] } ] }
```

Restart Claude Code (or run `/hooks`) after editing so the new hooks are picked up.

### Custom fleet home

The hooks default to `~/claudefleet` and read `CLAUDEFLEET_HOME` if it is set. Exporting
it in `~/.zshrc` works when you launch `claude` from a terminal, but not always from a
GUI launcher. The reliable way to use a different folder is to add it to
`~/.claude/settings.json` as a top-level key:

```json
"env": { "CLAUDEFLEET_HOME": "/Users/you/work/claudefleet" }
```

Simplest option: keep the default `~/claudefleet` and set nothing.

## 7. Open the admin panel

```zsh
open "$CLAUDEFLEET_HOME/admin.html"           # macOS
xdg-open "$CLAUDEFLEET_HOME/admin.html"       # Linux
```

It opens with demo data. Click **Import JSON**, pick `~/claudefleet/pipeline.json`, and
you're looking at your own board. The panel can't write to your disk on its own — when
you edit in the panel, click **Export JSON** and move the downloaded `pipeline.json`
back over `~/claudefleet/pipeline.json`:

```zsh
mv "$HOME/Downloads/pipeline.json" "$CLAUDEFLEET_HOME/pipeline.json"
```

A few browsers block local storage on `file://` URLs; the panel warns you if that
happens (export before closing the tab). Serving the folder avoids it entirely:

```zsh
cd "$CLAUDEFLEET_HOME" && python3 -m http.server 8787
# then open http://localhost:8787/admin.html
```

## 8. Run the machine

```zsh
cd "$CLAUDEFLEET_HOME" && claude
```

Start sessions from the fleet home — that's where `pipeline.json` lives, and the `Stop`
hook only logs sessions whose working directory is inside it. The machine's own folder
(`~/claudefleet/content-machine/`) is where scripts, briefs and generated assets land.

## Verify it worked

**Check 1 — agents and skills are discoverable.**

```zsh
ls "$HOME/.claude/agents" && ls "$HOME/.claude/skills"
```

Every agent file from your machine folder should be listed, and every skill should be a
*directory* containing `SKILL.md` (`ls ~/.claude/skills/*/SKILL.md` prints one line per
skill). Then start `claude` and run `/agents` — the machine's agents appear in the list.
If a skill directory has no `SKILL.md` inside it, Claude Code will not load it.

**Check 2 — the hooks are registered and the pipeline snapshot works.**

```zsh
jq '.hooks | keys' "$HOME/.claude/settings.json"
```

Must print a list including `"PostToolUse"`, `"SessionStart"` and `"Stop"` — and must
not error (an error means the JSON is broken; restore your `.bak` file). Now run the
snapshot command exactly as the hook does:

```zsh
jq -r '.hooks.SessionStart[-1].hooks[0].command' "$HOME/.claude/settings.json" | zsh
```

You should see a line like `ClaudeFleet [content] Idea:1 | Script:1 | Render:1
| Assemble:1 | Scheduled:1 || last run: /cf-render — 5-shot Higgsfield brief
written...`. Nothing printed means the hook can't find `pipeline.json` — check
`ls "$CLAUDEFLEET_HOME/pipeline.json"`.

**Check 3 — the run log actually fires.**

Start a session in the fleet home (`cd "$CLAUDEFLEET_HOME" && claude`), ask Claude to
write a scratch file inside it ("create notes/hook-test.md with the word hello"), then
exit the session and run:

```zsh
cat "$CLAUDEFLEET_HOME/logs/run.log"
```

You should see two tab-separated lines: one `file  Write  .../notes/hook-test.md` from
the `PostToolUse` hook and one `session-end` from the `Stop` hook. If the file doesn't
exist, see the troubleshooting notes in `hooks/README.md`.

## Uninstall

```zsh
rm -f "$HOME"/.claude/agents/<the-agents-you-copied>.md
rm -rf "$HOME"/.claude/skills/<the-skills-you-copied>
# hooks: restore the backup you took, or delete just our three entries by hand
cp "$HOME/.claude/settings.json.bak.<timestamp>" "$HOME/.claude/settings.json"
```

`~/claudefleet/` is your data — deleting it deletes your pipeline. Back it up before
you remove anything.
