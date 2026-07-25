---
name: dp-package
description: "Stage PACKAGE of the Digital Product Machine. Assembles the drafted deliverables into a sellable bundle with a buyer README and terms, writes paste-ready Higgsfield briefs for cover art and promo stills, takes the operator's price decision, and moves the card to LAUNCH-KIT."
allowed-tools: Read, Write, Edit, Bash, Task, Glob
---

Runs on a card with `machine: "product"` and `stage: 2` (PACKAGE).

## Preconditions — check, and stop if any fails

1. The card is at `stage: 2` and `notes/<slug>/build/` contains at least one deliverable plus `00-outline.md`.
2. `build/assets-needed.md` is either empty of blockers or the operator has supplied what it lists. Packaging around a known hole ships the hole.
3. The operator has a Higgsfield account if they want the cover art and promo stills generated. Generation runs in their account and spends their own credits — verify current pricing and credit costs on Higgsfield's own pricing page before committing to a big render batch. The engine writes briefs; it never generates media and cannot spend credits.

## Steps

1. Read `pipeline.json`, the card, and `notes/<slug>/build/00-outline.md`.
2. `mkdir -p "$CLAUDEFLEET_HOME/product-machine/notes/<slug>/package" "$CLAUDEFLEET_HOME/product-machine/assets/<slug>"`.
3. Delegate with the Task tool, `subagent_type: dp-packager`. It writes into `package/`:
   - `manifest.md` — every file in the bundle, checked against an actual listing of `build/`, with a one-line description each.
   - `README-for-buyer.md` — what this is, who it is for, and a quickstart that gets a first-time buyer to one useful result in five minutes.
   - `terms.md` — usage licence, what is not included, and the 30-day money-back refund terms. A refund promise is the only guarantee that may appear anywhere in this product.
   - `media-briefs.md` — paste-ready Higgsfield prompts for one cover image and three promo stills, each with subject, style, aspect ratio, and how many variations to pull.
4. Check `manifest.md` against `ls -R build/`. A manifest that lists a file the folder does not contain is a refund waiting to happen.

## Price gate — operator decides

The packager proposes a price band with its reasoning from `validation.md` (what comparable paid products charge, what this includes that they do not). Present the band, then ask the operator for the number. Write only the number they give into `manifest.md`. Never publish a price the operator has not approved.

## Higgsfield handoff

Tell the operator to run the prompts in `media-briefs.md` in their Higgsfield account and drop the renders into `product-machine/assets/<slug>/`, keeping the filenames the brief specifies. Then update state.

```bash
python3 - <<'PY'
import json,os,uuid,datetime as dt
h=os.path.expanduser(os.environ.get("CLAUDEFLEET_HOME","~/claudefleet")); p=h+"/pipeline.json"
d=json.load(open(p)); CID="<card-id>"; ST=3
TXT="/dp-package — bundle manifest + buyer README + terms written; Higgsfield briefs ready; price approved"
for c in d["cards"]:
    if c["id"]==CID: c["stage"]=ST; c["notes"]=(c.get("notes","")+" | "+TXT)[:4000]
d.setdefault("log",[]).append({"id":uuid.uuid4().hex[:8],"ts":dt.datetime.now().isoformat(timespec="seconds"),"machine":"product","stage":2,"text":TXT})
json.dump(d,open(p,"w"),indent=2)
PY
```

Next command: `/dp-launch`.
