---
name: dp-schedule
description: "Stage SCHEDULED of the Digital Product Machine. Turns the approved launch kit into a slot-by-slot Postiz schedule plus email send times, holds a hard approval gate before anything is queued, records what actually got queued, and files the retro for the next product cycle."
allowed-tools: Read, Write, Edit, Bash, Task
---

Runs on a card with `machine: "product"` and `stage: 4` (SCHEDULED). This is the machine's last stage: the card stays at 4 and gets marked launched.

## Preconditions — check, and stop if any fails

1. The card is at `stage: 4` and `notes/<slug>/launch/` contains `social.md`, `emails.md` and `sales-page.md`, all operator-approved in `/dp-launch`.
2. `product-machine/assets/<slug>/` contains the finished media the posts reference. List the folder and match filenames against `social.md`. A scheduled post pointing at a file that does not exist fails silently at the worst moment.
3. The operator has a working Postiz account (hosted or self-hosted — check current pricing on Postiz's own pricing page for the hosted plan) with the target channels connected, and the sales page is live at a URL. No live URL means nothing to link to.

## Steps

1. Read `pipeline.json`, the card, `launch/social.md`, `launch/emails.md`, and `ls "$CLAUDEFLEET_HOME/product-machine/assets/<slug>"`.
2. Delegate with the Task tool, `subagent_type: dp-scheduler`. It writes `notes/<slug>/schedule/postiz-plan.md`: one row per post with channel, date and time including timezone, the exact caption from `social.md`, the asset filename, the link, and any platform-required trim (flagged, never silently applied); then the email send times relative to cart open; then a conflicts section for slots that collide or fall outside the launch window.
3. Check every asset filename in the plan against the actual folder listing before showing it to anyone.

## Human approval gate — hard stop

Print the full plan. The operator must reply with an explicit approval before a single slot is queued. Nothing about this skill queues, posts, or sends on its own: it produces the plan, the operator queues it in their own Postiz account against their own connected channels. If they ask you to change a time, a caption or a channel, change it in `postiz-plan.md` first, then re-present.

## After the operator has queued it

Ask what actually went in and what failed — expired channel tokens and rejected media are the normal failures — and write the answer into `schedule/queued.md` with the timestamp. Then append the retro: three lines in `schedule/retro.md` on what to change next cycle (scope, price, channel mix), which is the input to the next `/dp-validate`.

```bash
python3 - <<'PY'
import json,os,uuid,datetime as dt
h=os.path.expanduser(os.environ.get("CLAUDEFLEET_HOME","~/claudefleet")); p=h+"/pipeline.json"
d=json.load(open(p)); CID="<card-id>"; ST=4
TXT="/dp-schedule — <n> posts queued in Postiz, emails set, LAUNCHED "+dt.date.today().isoformat()
for c in d["cards"]:
    if c["id"]==CID: c["stage"]=ST; c["notes"]=(c.get("notes","")+" | "+TXT)[:4000]
d.setdefault("log",[]).append({"id":uuid.uuid4().hex[:8],"ts":dt.datetime.now().isoformat(timespec="seconds"),"machine":"product","stage":4,"text":TXT})
json.dump(d,open(p,"w"),indent=2)
PY
```

Finally, remind the operator to log this cycle's Claude, Higgsfield and Postiz spend in the admin panel's cost table — those are their real numbers, and nobody else can fill them in.
