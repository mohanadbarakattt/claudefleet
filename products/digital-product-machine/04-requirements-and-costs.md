# Requirements and costs

Read this before your first cycle, and read it before you decide whether this machine is worth
running at all. Nothing here is optional-but-recommended dressed up as required; each item
below is listed with the specific reason the machine cannot function without it.

**This product quotes no prices, anywhere, ever.** Every vendor below sets its own plans,
changes them without notice, and prices differently by region and billing period. Any number
printed in a product like this one would be wrong within months. Verify current pricing on
each vendor's own pricing page before you commit.

---

## The three services the engine drives

### 1. Claude Code — the brain

**What it's for:** every stage. It reads `pipeline.json`, runs the five skills, dispatches the
five agents, writes the memo, the product, the briefs and the launch copy, and writes the
state back.

**Why the machine can't run without it:** the skills and agents *are* Claude Code files. With
no Claude Code, this product is five markdown documents and an HTML page. Not a partial
degradation — a full stop.

**Billing model:** a paid Claude plan, or API billing, or both. Free-tier access is not
sufficient for sustained daily use of Claude Code. Plan tiers carry different usage limits,
and the limits are what you'll feel first. **Verify current pricing at Anthropic's pricing
page before you commit.**

### 2. Higgsfield — the media factory

**What it's for:** stage 3 (cover art, promo stills) and optionally stage 4 (promo video). The
machine writes complete generation briefs; Higgsfield renders them on your account.

**Why the machine can't run without it:** a digital product needs a cover and a sales page
needs visuals. The machine writes briefs — it cannot render pixels. You can paste the same
briefs into another generator you already pay for (they are plain text and deliberately
portable), but the shipped path assumes Higgsfield, and *some* paid generator is unavoidable
unless you have a designer.

**Billing model:** a paid account with generation allowances that vary by plan; expect
per-generation consumption against whatever your plan includes, and expect failed generations
to consume it too. Budget for regeneration, not just for the shots you keep. **Verify current
pricing and what each plan actually includes at Higgsfield's pricing page before you commit.**

### 3. Postiz — the distribution layer

**What it's for:** stage 5. Queues the launch-week posts to your own connected social accounts
on a schedule you approve.

**Why the machine can't run without it:** without a scheduler the launch-week posts exist as
text you post by hand, one at a time, on the day. Workable in an emergency (see the runbook's
fallbacks), unworkable as a repeatable business.

**Billing model:** Postiz is open source, so there are two routes — self-host it (no licence
fee, but you pay for a server and you own the maintenance) or use their hosted plan. **Verify
current hosted pricing at Postiz's pricing page, or price your own hosting, before you
commit.** Note that connected platforms also impose their own API limits and periodically
expire tokens; that is on the platforms, not on Postiz.

---

## What else this machine genuinely needs

**A checkout and delivery platform.** The machine builds and packages a product and writes a
sales page — it does not take money, host your file, or deliver it to a buyer, and it does not
integrate with anything that does. You need a storefront or payment processor (Gumroad, Lemon
Squeezy, Payhip, Stripe, or similar) with its own account and its own fees, and stage 4 needs
the checkout URL before the sales page can be finished. All of them take a percentage, a fixed
fee, a subscription, or a combination — **verify current fees on whichever one you pick before
you commit.**

**An email sender, if you use the email sequence.** Stage 4 writes an email sequence. Postiz
schedules social posts, not email. To send the sequence you need your own email tool and,
realistically, a list to send it to. This is the dependency people discover on launch day.
**Verify current pricing at whichever provider you choose** — most price by subscriber count
or send volume.

**An audience or a list.** The machine writes the launch; it does not supply anyone to launch
to. If you have neither, budget several months of building one, or budget paid traffic, before
you expect a launch to do anything at all.

**`python3`.** The three hooks are python one-liners. Pre-installed on macOS with the Xcode
command line tools and on essentially every Linux. Without it the hooks silently do nothing —
you lose the session-start snapshot and the run log, and the rest of the machine still works.

**A browser.** For the admin panel. One local file, no network calls, no build step.

**`jq` (optional).** Only for the automatic hook merge and the pipeline commands in
`00-START-HERE.md`. Every step has a manual or python3 alternative.

**Your time.** Roughly 4–8 focused hours per product cycle, plus fifteen minutes a day. That
is the real cost and it does not appear on any invoice.

---

## What the $99 actually buys

The $99 buys the system: the five skills, the five agents, the hooks, the admin panel, and the
documentation that makes them a repeatable process instead of a folder of prompts. It does not
buy, include, subsidise, discount or bundle a single one of the subscriptions above.

Those costs are real, recurring, and yours. At minimum you are paying monthly for Claude, for
Higgsfield generations, and for Postiz hosted or self-hosted — plus checkout fees on anything
you sell and an email tool if you send email. Add them up on the vendors' own current pricing
pages **before** you buy this, not after. If that monthly total is not something you can
comfortably carry for several months without revenue, do not buy this machine — it will sit
unused and the subscriptions will bill anyway.

Nothing in this product promises, projects, or estimates any income. It makes the work
repeatable and visible. Whether what you make sells depends on your offer, your market and
your audience, and none of those are in a zip file.

---

## Pre-flight checklist

Tick every line before your first run.

**Accounts and billing**
- [ ] Claude Code installed; `claude --version` prints a version
- [ ] A paid Claude plan or API billing is active on that account
- [ ] Higgsfield account created, plan chosen, current pricing checked on their pricing page
- [ ] Postiz running (hosted plan or self-hosted) and reachable
- [ ] The social accounts you intend to launch on are connected in Postiz and freshly authorised
- [ ] Checkout/delivery platform account created and its fees checked
- [ ] Email tool chosen, if you plan to send the email sequence

**Machine**
- [ ] `python3 -V` prints a version
- [ ] Installer run per `_engine/INSTALL.md`; `ls ~/.claude/skills/dp-*/SKILL.md` lists five
- [ ] `ls ~/.claude/agents/dp-*.md` lists five
- [ ] `jq '.hooks | keys' ~/.claude/settings.json` includes SessionStart, PostToolUse, Stop
- [ ] `~/.claude/settings.json.bak.*` exists (the installer's backup — keep it)
- [ ] `pipeline.json` has `"machine": "product"` and the five product stage names
- [ ] Admin panel opens, demo data cleared, your pipeline imported

**Business**
- [ ] One product idea written in a sentence: who, what problem, what format
- [ ] A rough monthly budget for all subscriptions above, from their actual pricing pages
- [ ] Fifteen minutes a day, at a fixed time, blocked in your calendar
- [ ] You have read the five quality gates in `03-operating-runbook.md` and accept that none
      of them are skippable
