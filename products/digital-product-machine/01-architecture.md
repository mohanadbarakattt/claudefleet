# Architecture — how this machine works

One product idea is one **card** in `~/claudefleet/pipeline.json`: an `id`, a `machine`
(`"product"`), a `stage` index 0–4, a `title`, a `created` timestamp, `notes`. Five skills move
cards forward, one stage each; five agents do the specialist work inside those stages; three
hooks record what happened; the admin panel is a read/write view over the same file. Nothing
else holds state — delete every session transcript you have and the business is still fully
described by `pipeline.json` plus the files in `~/claudefleet/product-machine/`.

Shared mechanics: `_engine/ENGINE.md`. This document is the five stages.

---

## Stage 1 — Validate (`/dp-validate`)

**In:** one idea in a sentence — who it's for, what problem, what format — plus any evidence
you already have: support emails, DMs, the question you get asked constantly.

**What the machine does:** `dp-researcher` looks for evidence that this problem already
exists in public and that people already pay to solve it — forum and community threads,
comparable paid products and what they charge, the question patterns people actually type.
It writes a validation memo to `product-machine/notes/<slug>/validation.md`: the problem
statement in the buyer's own words, the comparable products it found, the strongest angle,
the objections that will come up, and an explicit GO or NO-GO with the reasoning attached.
Where evidence is missing it says so instead of filling the gap — an unsupported claim in a
validation memo is worse than a blank.

**Service:** Claude only — and it needs working web access. Without it this stage produces
opinion, not validation, and the skill says so and stops.

**You approve:** the verdict. The skill prints the signals and the risks, asks you for GO /
NO-GO / MORE RESEARCH, and waits — it never makes that call. Check that the problem statement
is phrased the way a buyer would say it, not the way a marketer would.

**Done when:** a memo exists on disk, you have read it end to end, the verdict is GO, and the
card carries a one-line problem statement you would be comfortable reading aloud to a customer.
NO-GO is also done: the idea is dead and the card is closed. Cheapest outcome this machine
produces.

---

## Stage 2 — Build (`/dp-build`)

**In:** a GO card and its validation memo.

**What the machine does:** `dp-builder` turns the validated problem statement into the actual
deliverable — the prompts, the templates, the lessons, the guide. It works from the memo, not
from your original hunch, and it holds scope: one problem, one promise, one format. It writes
the outline first, alone, and stops for your approval before writing anything long. Finished
content lands in `product-machine/notes/<slug>/build/`.

**Service:** Claude only.

**You approve:** twice — the outline before the writing starts (this is where you cut scope,
cheaply), then the content itself, personally, all of it. Skimming here is what makes a product
not worth its price. Use it yourself once — run your own prompts, fill in your own template;
anything you would not use, cut. Ask the session for a hostile pass before you sign off:
*"take the buyer's side, list what is thin, generic or filler, by section."*

**Done when:** every section is written (no outlines standing in for content), the hostile pass
is addressed or consciously accepted, you have used the thing once, and the file count matches
what the promise says the buyer gets.

---

## Stage 3 — Package (`/dp-package`)

**In:** finished, reviewed product content.

**What the machine does:** `dp-packager` assembles the sellable bundle — file structure and
naming, the start-here the buyer opens first, the licence and usage terms, the delivery
format — and writes the media briefs: a cover-art brief and promo-still briefs, each
a complete prompt with subject, composition, aspect ratio, colour direction and an explicit
"no text in frame" instruction where text should be added later in an editor. Briefs go to
`product-machine/notes/<slug>/package/`. You paste them into **Higgsfield**, generate on your
own account and credits, and drop the results into `product-machine/assets/<slug>/`, named as
the briefs specify. The engine does not generate media and cannot spend credits you have not
bought.

**Service:** Higgsfield (plus Claude for the briefs).

**You approve:** every generated asset, at full size, before it goes near a sales page. Check
text rendering especially — AI generators mangle on-screen text routinely. Regenerate rather
than ship almost-right; the cover is the first thing a buyer judges.

**Done when:** the bundle is a single deliverable you could hand over right now, the cover art
is approved at full size, and you have downloaded and opened the whole package once from the
buyer's side.

---

## Stage 4 — Launch Kit (`/dp-launch`)

**In:** a packaged product, its price, and the checkout URL it will be sold from.

**What the machine does:** `dp-launch-writer` writes the launch into
`product-machine/notes/<slug>/launch/` against the validated problem statement and the real
contents of the product: the sales page (headline, problem, what's inside, who it's not for,
objections, refund terms), the email sequence with send offsets, the launch-week social posts,
and a promo-video brief for Higgsfield if you want moving assets. Every claim it writes has to
trace back to something the product actually contains — over-claiming here is the most
expensive mistake in the machine and the one that generates refunds.

**Service:** Claude (plus Higgsfield if you generate promo video from the brief).

**You approve:** every number, every claim, every proof point. The machine does not know your
results or anyone's earnings and will not invent them — where copy needs a real figure it flags
the gap; you supply it or the claim is cut. Say nothing about what buyers will earn.

**Done when:** the sales page is ready to publish, you have clicked every link and the
checkout yourself, the email sequence is loaded in whatever sends your email, and no claim
survives that the product cannot back.

---

## Stage 5 — Scheduled (`/dp-schedule`)

**In:** an approved launch kit and approved assets.

**What the machine does:** `dp-scheduler` turns the launch kit into a queue plan at
`product-machine/notes/<slug>/schedule/postiz-plan.md` — one row per post with channel, date
and time including timezone, the exact caption, the asset filename, the link, any
platform-required trim flagged rather than silently applied, plus email send times relative to
cart open and a conflicts section. You enter that plan into **Postiz**, which publishes to your
own connected accounts. The card then carries the post-launch note: what to watch, what to
change next cycle.

**Service:** Postiz.

**You approve:** the queue itself, item by item, in Postiz before anything goes out — the last
human gate in the machine, never skipped. Confirm each platform is actually connected; expired
tokens fail silently until a post doesn't appear.

**Done when:** every launch-week item is queued in Postiz with a date, the email sequence is
scheduled in your email tool, you have seen the queue with your own eyes, and the card's notes
say what you'll do differently next time.

---

## Moving backwards

Cards move back as normally as forward: a failed review holds a card in Build, collapsed
evidence sends it back to Validate, unusable generations hold it at Package. Editing
`pipeline.json` by hand to move, close or re-note a card is supported, and often fastest.
