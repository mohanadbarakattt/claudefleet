---
name: dp-launch
description: "Stage LAUNCH-KIT of the Digital Product Machine. Writes the sales page, the five-email launch sequence, the launch-week social posts and the Higgsfield promo-video briefs against the validated problem statement, sweeps them for banned claims, and moves the card to SCHEDULED."
allowed-tools: Read, Write, Edit, Bash, Task, Grep
---

Runs on a card with `machine: "product"` and `stage: 3` (LAUNCH-KIT).

## Preconditions — check, and stop if any fails

1. The card is at `stage: 3` and `notes/<slug>/package/manifest.md` exists with an operator-approved price in it.
2. `notes/<slug>/validation.md` is readable. Every claim in the launch copy has to trace back to it or to a file in `build/`. Copy written from imagination is how a product gets returned.
3. The operator has decided the launch window — cart open date, cart close date (or "always open"), and their timezone. Ask if unset; fake deadlines are not an option.

## Steps

1. Read `validation.md`, `package/manifest.md`, `package/README-for-buyer.md`, and skim two deliverables so the copy describes what is actually inside.
2. `mkdir -p "$CLAUDEFLEET_HOME/product-machine/notes/<slug>/launch"`.
3. Delegate with the Task tool, `subagent_type: dp-launch-writer`. It writes into `launch/`:
   - `sales-page.md` — headline, the problem in the buyer's words, what is inside (straight from the manifest), who it is not for, price, the 30-day money-back terms, and an FAQ that answers the objections listed in `validation.md`.
   - `emails.md` — five emails, each with subject line, preview text, body, and a send offset relative to cart open.
   - `social.md` — launch-week posts grouped per platform, each with the copy, the asset it needs from `assets/<slug>/`, and its slot in the week.
   - `promo-video-briefs.md` — two Higgsfield video briefs (hook, shots, on-screen text, aspect ratio, length).
   - `needs-user.md` — anything the copy wants but nobody can invent: real testimonials, real buyer results, real screenshots.
4. Sweep the kit before showing it:

```bash
grep -rniE "guarantee[d]? (income|results|earnings)|make \\\$|passive income|replace your (job|salary)|[0-9]+x (your|more)|testimonial|case study" \
  "$CLAUDEFLEET_HOME/product-machine/notes/<slug>/launch/"
```

Every hit is guilty until proven innocent. The only permitted guarantee is the 30-day money-back refund. Income promises, invented statistics, invented testimonials and invented results all get deleted, and the underlying claim moves to `needs-user.md` if the operator could legitimately supply it.

## Human approval gate

Read the sales page and email 1 back to the operator and get an explicit approval or edit list before advancing. This is the copy that goes out under their name.

```bash
python3 - <<'PY'
import json,os,uuid,datetime as dt
h=os.path.expanduser(os.environ.get("CLAUDEFLEET_HOME","~/claudefleet")); p=h+"/pipeline.json"
d=json.load(open(p)); CID="<card-id>"; ST=4
TXT="/dp-launch — sales page + 5 emails + launch-week posts + promo briefs approved"
for c in d["cards"]:
    if c["id"]==CID: c["stage"]=ST; c["notes"]=(c.get("notes","")+" | "+TXT)[:4000]
d.setdefault("log",[]).append({"id":uuid.uuid4().hex[:8],"ts":dt.datetime.now().isoformat(timespec="seconds"),"machine":"product","stage":3,"text":TXT})
json.dump(d,open(p,"w"),indent=2)
PY
```

Next command: `/dp-schedule`.
