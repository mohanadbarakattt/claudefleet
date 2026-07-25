---
name: dp-build
description: "Stage BUILD of the Digital Product Machine. Turns a validated problem statement into the actual deliverable files — templates, lessons, guide — with a scope confirmation before drafting and a no-placeholder check after, then moves the card to PACKAGE."
allowed-tools: Read, Write, Edit, Bash, Task, Glob, Grep
---

Runs on a card with `machine: "product"` and `stage: 1` (BUILD).

## Preconditions — check, and stop if any fails

1. The card is at `stage: 1`. Anything earlier → run `/dp-validate` first.
2. `$CLAUDEFLEET_HOME/product-machine/notes/<slug>/validation.md` exists and line 1 starts with `DECISION: GO`. No GO, no build — this is the rule the whole machine rests on.
3. The operator has said how many working days this build gets. Scope creep, not writing speed, is what kills product cycles; without a number, ask for one.

## Steps

1. Read `pipeline.json`, take the card and its slug from `notes`, and read `validation.md` in full. The problem statement in that memo is the spec — every deliverable must trace back to it.
2. `mkdir -p "$CLAUDEFLEET_HOME/product-machine/notes/<slug>/build"`.
3. Delegate with the Task tool, `subagent_type: dp-builder`, asking first for `build/00-outline.md` only: the deliverable list, and for each one its purpose, its format, and the single thing the buyer does with it after opening it.
4. **Scope gate.** Show the outline to the operator and ask them to cut it to what fits the agreed days. Do not draft anything until they answer. Record what was cut in the outline under `## Cut from v1`.
5. Re-run `dp-builder` on the approved outline to draft every deliverable as a complete, numbered file (`01-...md`, `02-...md`) plus `build/assets-needed.md` listing anything only the operator can supply — their own screenshots, their own numbers, their own account names.
6. Verify before advancing:

```bash
grep -rniE "TODO|TBD|lorem ipsum|\[insert|placeholder|coming soon|XXX" \
  "$CLAUDEFLEET_HOME/product-machine/notes/<slug>/build/"
```

Any hit that is not inside `assets-needed.md` gets fixed and re-checked. A buyer who opens a template and finds `[insert here]` asks for the refund, and is right to.

7. Read one deliverable end to end yourself and confirm someone with the buyer's context could act on it without asking a question.

## Update state

```bash
python3 - <<'PY'
import json,os,uuid,datetime as dt
h=os.path.expanduser(os.environ.get("CLAUDEFLEET_HOME","~/claudefleet")); p=h+"/pipeline.json"
d=json.load(open(p)); CID="<card-id>"; ST=2
TXT="/dp-build — <n> deliverables drafted in build/, placeholder check clean"
for c in d["cards"]:
    if c["id"]==CID: c["stage"]=ST; c["notes"]=(c.get("notes","")+" | "+TXT)[:4000]
d.setdefault("log",[]).append({"id":uuid.uuid4().hex[:8],"ts":dt.datetime.now().isoformat(timespec="seconds"),"machine":"product","stage":1,"text":TXT})
json.dump(d,open(p,"w"),indent=2)
PY
```

Report the file list and the contents of `assets-needed.md`, then name the next command: `/dp-package`.
