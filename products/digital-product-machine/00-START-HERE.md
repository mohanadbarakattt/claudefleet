# Start here — your first hour

This is the installer. (`02-build-prompts.md`'s Part A walks the same install as a slower,
Claude Code-guided alternative for deeper Higgsfield/Postiz/profile configuration — run one path
or the other, not both.)

Goal for this hour: the machine installed, your own board on screen, and **one real product
idea moved through two stages** — Validate, then Build. You will not touch Higgsfield or
Postiz today; those come in at stages 3 and 5.

Have ready before you start: Claude Code working (`claude --version` prints a version) with web
access enabled, a terminal, a browser, and **one product idea written in a sentence**. If you
don't have an idea yet, use the one thing people ask you about most often. Don't spend the hour
choosing.

Every path below is literal. Copy exactly.

---

## 1 — Point the installer at this machine (2 min)

Open a terminal. Edit the first line to wherever you unzipped the product, then run all four:

```zsh
export FLEET_SRC="$HOME/Downloads/claudefleet-digital-product-machine"
export MACHINE_DIR="product-machine"
export CLAUDEFLEET_HOME="$HOME/claudefleet"
ls "$FLEET_SRC" && ls "$FLEET_SRC/_engine"
```

Both `ls` commands must list files. If either errors, fix `FLEET_SRC` before going on —
a wrong path here is the single most common way this install fails.

## 2 — Run the installer (10 min)

Open `_engine/INSTALL.md` and run the copy-pasteable block under **"2–6. The whole install"**
in this same terminal window, in one go. It creates `~/claudefleet/`, seeds `pipeline.json`,
copies the five agents and five skills into `~/.claude/`, copies the admin panel, backs up
your `settings.json`, and merges the three hooks.

Read `_engine/hooks/README.md` before you run the hook merge step. Hooks execute shell
commands on your machine; you should know what they do. They log runs and print a pipeline
snapshot — they never write to `pipeline.json`.

Then restart Claude Code so the new skills, agents and hooks are picked up.

## 3 — Verify the install before you trust it (3 min)

```zsh
ls "$HOME"/.claude/skills/dp-*/SKILL.md
ls "$HOME"/.claude/agents/dp-*.md
jq '.hooks | keys' "$HOME/.claude/settings.json"
```

Expected: five `SKILL.md` lines, five agent files, and a key list containing `PostToolUse`,
`SessionStart` and `Stop`. A skill directory without `SKILL.md` inside it will not load. If
the `jq` call errors, your settings JSON is broken — restore the `.bak` file the installer
made and do the manual merge described in `INSTALL.md`.

## 4 — Switch the pipeline to this machine (2 min)

The seed `pipeline.json` ships configured for the content machine. Point it at this one and
clear the example cards so the board is yours:

```zsh
jq '.machine="product"
    | .stages=["Validate","Build","Package","Launch Kit","Scheduled"]
    | .cards=[] | .log=[] | .demo=false' \
   "$CLAUDEFLEET_HOME/pipeline.json" > "$CLAUDEFLEET_HOME/pipeline.new.json" \
&& mv "$CLAUDEFLEET_HOME/pipeline.new.json" "$CLAUDEFLEET_HOME/pipeline.json" \
&& echo "pipeline switched to product"
```

No `jq`? Same thing in python3:

```zsh
python3 - <<'PY'
import json, os
p = os.path.expanduser("~/claudefleet/pipeline.json")
d = json.load(open(p))
d.update(machine="product", demo=False, cards=[], log=[],
         stages=["Validate","Build","Package","Launch Kit","Scheduled"])
json.dump(d, open(p,"w"), indent=2)
print("pipeline switched to product")
PY
```

## 5 — Open the board (3 min)

```zsh
open "$CLAUDEFLEET_HOME/admin.html"        # macOS
xdg-open "$CLAUDEFLEET_HOME/admin.html"    # Linux
```

It opens with demo data. Click **Clear demo data** in the orange banner, then **Import JSON**
and pick `~/claudefleet/pipeline.json`. Set the machine selector in the header to **Digital
Product Machine**. You should now see five empty columns: Validate, Build, Package, Launch
Kit, Scheduled.

The panel cannot write to your disk. Whenever you edit in the panel, click **Export JSON** and
move the download back over your pipeline file:

```zsh
mv "$HOME/Downloads/pipeline.json" "$CLAUDEFLEET_HOME/pipeline.json"
```

## 6 — Run stage 1: Validate (20 min)

```zsh
cd "$CLAUDEFLEET_HOME" && claude
```

Always start sessions from the fleet home — that is where `pipeline.json` lives and where the
hooks look. At the session start you should see a one-line `ClaudeFleet [product] …` snapshot.

Now type the command and your idea in one message. Replace the idea with yours; keep the
shape — who it's for, what problem, what format:

```
/dp-validate A prompt pack for freelance copywriters who lose hours rewriting cold
outreach that reads like a template. Format: ~40 prompts plus a short usage guide.
```

The skill creates the card, hands the idea to the `dp-researcher` agent, and writes a
validation memo to `~/claudefleet/product-machine/notes/<slug>/validation.md`. Read the whole
memo — it ends in a verdict with the evidence it used and the gaps it could not fill. Then the
session stops and asks you for **GO / NO-GO / MORE RESEARCH**, and waits.

**You make that call, not the memo.** If the evidence is thin, say NO-GO and run
`/dp-validate` on your next idea — that is a successful first hour, not a failed one. Killing a
bad idea in twenty minutes is what stage 1 is for. On GO the card moves to BUILD.

## 7 — Run stage 2: Build (15 min to start it) (in the same session)

```
/dp-build
```

It picks up the card you just validated, hands it to `dp-builder`, and drafts the product
against the validated problem statement — not against your original hunch. It asks you to
approve the outline before it writes anything long, which is where you cut scope. On a real
product this stage takes more than one session; today you only need the approved outline and
the first section on disk, in `~/claudefleet/product-machine/notes/<slug>/build/`.

Before you stop, get a critical pass on what exists. Type this in the same session:

```
Take the buyer's side. Read everything in build/ and list what is thin, generic, or filler
— specifically, with the section name. Be unimpressed.
```

## 8 — Close the loop (5 min)

Exit the session, then:

```zsh
cat "$CLAUDEFLEET_HOME/logs/run.log"
jq -r '.cards[] | "\(.stage)  \(.title)"' "$CLAUDEFLEET_HOME/pipeline.json"
```

You should see logged runs, and one card sitting at stage index 1 (Build). Re-open the panel
and click **Import JSON** to see it on the board.

**Hour one is done when all five are true:** five skills and five agents installed · hooks
registered and logging · `pipeline.json` set to `product` with your card in it · a validation
memo you have actually read · the board showing that card in Validate or Build.

---

## Today's homework, before day two

- Create your **Higgsfield** account — stage 3 needs it for cover art and promo stills.
- Create or self-host **Postiz** and connect the social accounts you'll launch on — stage 5
  needs it.
- Decide where you will take payment and deliver the file. The machine does not include a
  checkout, and stage 4's sales page needs a URL to point at.
- Check current pricing on each vendor's own pricing page and write the real numbers into the
  panel's cost tracker as your invoices arrive. It starts empty on purpose.

Then read `03-operating-runbook.md` and pick the time of day you'll run your 15-minute loop.
