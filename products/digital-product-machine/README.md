# Digital Product Machine

A ClaudeFleet machine. It runs one repeatable loop — validate an idea, build the product,
package it, write the launch, schedule the launch — and it keeps the state of every product
you have in flight in a plain JSON file so the work survives the end of a chat session.

This is not a course about digital products. It is the operating system for making them:
five slash commands, five specialist agents, three hooks, and a local dashboard, installed
into Claude Code on your own machine.

## Who it's for

Someone who already has, or is willing to build, an audience or a list, and wants to ship
information products (template packs, prompt packs, guides, mini-courses, swipe files) on a
schedule instead of once every eight months. It suits solo operators, freelancers
productising what they already sell as a service, and small agencies packaging their process.

It is a poor fit if you want software products, physical goods, anything needing a codebase,
or if you are not willing to run paid subscriptions (see below). It is also a poor fit if you
want a machine that runs unattended — every stage has a human approval gate on purpose.

## The five stages

| # | Stage | Command | Drives | Ends with |
|---|---|---|---|---|
| 1 | Validate | `/dp-validate` | Claude | A GO / NO-GO memo with demand evidence |
| 2 | Build | `/dp-build` | Claude | Complete product content, reviewed |
| 3 | Package | `/dp-package` | Higgsfield | Sellable bundle + cover and promo-still art |
| 4 | Launch Kit | `/dp-launch` | Claude | Sales page, email sequence, launch-week posts |
| 5 | Scheduled | `/dp-schedule` | Postiz | Launch queued on your own accounts, approved |

A card can sit in a stage for as long as it needs to, and it can move backwards — a NO-GO at
stage 1 kills it, a failed review at stage 2 sends it back to a rewrite. Full stage-by-stage
detail, including what you personally must approve, is in `01-architecture.md`.

## What's in the box

```
digital-product-machine/
  README.md                       this file
  00-START-HERE.md                the first hour, in order, with exact commands
  01-architecture.md              the five stages in detail
  02-build-prompts.md             17 paste-ready prompts: build the machine, then run it
  03-operating-runbook.md         daily loop, weekly review, Postiz launch handoff,
                                  failure fallbacks + render-retry order, QC gates
  04-requirements-and-costs.md    every dependency, and the pre-flight checklist
  skills/dp-validate.md           the five slash commands (the installer copies each
  skills/dp-build.md              one to ~/.claude/skills/<name>/SKILL.md)
  skills/dp-package.md
  skills/dp-launch.md
  skills/dp-schedule.md
  agents/dp-researcher.md         the five specialist subagents
  agents/dp-builder.md
  agents/dp-packager.md
  agents/dp-launch-writer.md
  agents/dp-scheduler.md

_engine/                          shared by every ClaudeFleet machine
  ENGINE.md                       what the engine is and how state flows
  INSTALL.md                      the installer — this is your "02", read it after 01
  pipeline.example.json           seed for your pipeline.json
  hooks/settings-hooks.json       the three hook entries you merge into settings.json
  hooks/README.md                 what each hook runs — read before merging
  admin-panel/index.html          the local dashboard (one file, no build, no network)
  admin-panel/README.md           how the JSON round-trip works
```

Installation is shared across every ClaudeFleet machine, so it lives in `_engine/INSTALL.md`
rather than in this folder. There is one documented route from unzip to first run:
**`00-START-HERE.md` is the installer** — it walks the exact `_engine/INSTALL.md` commands in
order and gets your first card through Validate and Build inside an hour. Read
`01-architecture.md` after that, once your board is running, for the stage-by-stage detail.
`02-build-prompts.md`'s Part A (Prompts 1–9) is an alternative, slower route through the same
install, driven by Claude Code prompts instead of copy-pasted terminal commands — use it only if
you want the deeper profile/Higgsfield/Postiz configuration it adds before your first run. Run
one path or the other, not both.

## Requirements, stated plainly

This machine drives three paid third-party services. **The $99 buys the system, not the
subscriptions.**

- **Claude Code** — the brain. Every stage runs through it. Needs a paid Claude plan or API
  billing. Without it, nothing here runs at all.
- **Higgsfield** — the media factory for cover art, promo stills and promo video. The machine
  writes the generation briefs; Higgsfield renders them on your account and your credits.
- **Postiz** — the distribution layer for the launch posts. Hosted plan or self-hosted.

All three bill on their own terms and change their plans without telling us. This product
quotes no prices, ever — verify current pricing on each vendor's own pricing page before you
commit. Beyond those three you also need somewhere to take money and deliver the file, and an
email sender if you intend to send the email sequence the machine writes; neither ships here.
`04-requirements-and-costs.md` lists every dependency with the reason it is unavoidable.

Also required: web access in Claude Code (stage 1 is research — without it that stage produces
opinion, not validation), `python3` (the hooks are python one-liners), a browser for the panel,
and roughly 4–8 focused hours per product cycle. `jq` is optional but makes install easier.

## What this does not do

It does not sell for you, does not post on its own, does not run unattended, does not send
data anywhere, and makes no claim about what you will earn. It makes the work repeatable and
visible. The offer, the market, and the judgment calls stay yours. The only guarantee attached
to this product is a 30-day money-back refund — nothing here is a guarantee about results.

Start with `00-START-HERE.md`.
