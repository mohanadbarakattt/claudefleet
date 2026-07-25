---
name: dp-validate
description: "Stage VALIDATE of the Digital Product Machine. Checks a product idea against cited demand signals and comparable paid products, writes a validation memo, and moves the card to BUILD only after the operator gives an explicit GO."
allowed-tools: Read, Write, Edit, Bash, Task, WebSearch, WebFetch
---

Runs on a card with `machine: "product"` and `stage: 0` (VALIDATE).

## Preconditions — check, and stop if any fails

1. `$CLAUDEFLEET_HOME/pipeline.json` exists (`CLAUDEFLEET_HOME` defaults to `~/claudefleet`). Missing → the operator has not finished INSTALL.md step 2.
2. At least one `machine: "product"` card at `stage: 0`. If the operator names an idea that has no card, create one first: `{"id": <8 hex chars>, "machine": "product", "stage": 0, "title": <idea>, "created": <ISO date>, "notes": "queued for validation"}`.
3. Web access works. Without it this stage produces opinion, not validation — say so and stop.

## Steps

1. Read `pipeline.json`. If several stage-0 product cards exist, list them and ask which one.
2. Build the slug: title lowercased, every run of non-alphanumerics → `-`, trimmed to 40 chars. Then `mkdir -p "$CLAUDEFLEET_HOME/product-machine/notes/<slug>"`.
3. Delegate the research with the Task tool, `subagent_type: dp-researcher`. Pass the idea, who is meant to buy it, the price band the operator has in mind, and the memo contract below. Do not research inline — that is the agent's job and its own context window.
4. Inspect the returned memo before you show it. It must contain: the problem in one sentence in the buyer's own words; at least three independent demand signals, each with a live URL and the date it was read; at least two comparable paid products with what they include and the price shown on their page today; the gap you would fill; three named risks; a verdict. Any claim without a source → send it back once, naming the specific gap.
5. Write the memo to `$CLAUDEFLEET_HOME/product-machine/notes/<slug>/validation.md`, with a first line reading `DECISION: PENDING`.

## Human approval gate — mandatory

Print the verdict, the three strongest signals, and the three risks. Ask the operator for **GO / NO-GO / MORE RESEARCH** and wait for an answer in the session. You never make this call. On NO-GO or MORE RESEARCH: append the reason to the card's `notes`, leave `stage` at 0, stop.

## On GO

Rewrite line 1 of `validation.md` to `DECISION: GO <today>`, then update state. Keep the slug inside `notes` — the admin panel drops card keys it does not recognise on export, so anything that must survive a round-trip lives in `notes`.

```bash
python3 - <<'PY'
import json,os,uuid,datetime as dt
h=os.path.expanduser(os.environ.get("CLAUDEFLEET_HOME","~/claudefleet")); p=h+"/pipeline.json"
d=json.load(open(p)); CID="<card-id>"; ST=1
TXT="/dp-validate — memo written, operator GO (slug=<slug>)"
for c in d["cards"]:
    if c["id"]==CID: c["stage"]=ST; c["notes"]=(c.get("notes","")+" | "+TXT)[:4000]
d.setdefault("log",[]).append({"id":uuid.uuid4().hex[:8],"ts":dt.datetime.now().isoformat(timespec="seconds"),"machine":"product","stage":0,"text":TXT})
json.dump(d,open(p,"w"),indent=2)
PY
```

Confirm the new stage back to the operator and name the next command: `/dp-build`.
