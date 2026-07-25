# Autopilot Content Machine

A ClaudeFleet machine. It turns Claude Code into the operator of a repeatable
content-to-distribution pipeline: you pick a niche and an offer, the machine researches
angles, writes short-form scripts, converts each script into Higgsfield generation
briefs, writes the captions and cut order, and queues the finished posts in Postiz —
stopping at defined gates so a human approves before anything reaches a queue.

It is not an app and not a SaaS. It is one JSON file that holds your pipeline state,
five Claude Code skills, a set of subagents, three optional hooks, and a single-file HTML
dashboard you open in a browser. Nothing phones home. Nothing runs unless you run it.

## Who it's for

Someone already doing — or about to do — short-form content at volume: an operator
running their own accounts, a one-person content service handling a few clients, a
founder who needs a steady posting cadence without hiring an editor and a writer. You
need to be comfortable in a terminal, and you need to already have (or be willing to buy)
the three subscriptions below.

It is not for someone looking for a hands-off money button. The machine removes the
blank page, the format drift, and the "where were we?" tax of running content as a
business. It does not remove judgment.

## The five stages

| # | Stage | Command | Runs on | Ends when |
|---|---|---|---|---|
| 1 | **Idea** | `/cf-ideas` | Claude | Approved hooks exist as cards |
| 2 | **Script** | `/cf-script` | Claude | Script + alternative hooks approved |
| 3 | **Render** | `/cf-render` | Higgsfield | Usable clips exist on disk |
| 4 | **Assemble** | `/cf-assemble` | Claude | One finished, watchable post |
| 5 | **Scheduled** | `/cf-schedule` | Postiz | Post is queued with a time |

Every item of work is a *card* moving left to right. Its position lives in
`pipeline.json`, so Thursday's session picks up Tuesday's work without re-explaining the
business. `01-architecture.md` has the detail.

## What's in the box

```
autopilot-content-machine/
  README.md                  ← you are here
  00-START-HERE.md           first hour: unzipped folder → a card moving through two stages
  01-architecture.md         each stage: input, work, agent, service, approval, done
  03-operating-runbook.md    daily loop, weekly review, Postiz handoff, failure
                             fallbacks + shot-retry order, QC gates
  04-requirements-and-costs.md  every dependency, honest cost talk, pre-flight checklist
  skills/
    cf-ideas.md               fills Idea (writes new cards at stage 0)
    cf-script.md              Idea      → Script
    cf-render.md              Script    → Render
    cf-assemble.md            Render    → Assemble
    cf-schedule.md            Assemble  → Scheduled
  agents/                    the specialists the skills delegate to — an angle scout, a
                             script writer, a shot designer, a caption writer and a
                             distribution planner, one .md file each (`ls agents/` for
                             exact names)
  _engine/
    ENGINE.md                what the shared engine is and how the parts fit
    INSTALL.md               the ten-minute install, copy-pasteable
    pipeline.example.json    seed state; becomes your ~/claudefleet/pipeline.json
    hooks/settings-hooks.json  three hooks to merge into ~/.claude/settings.json
    hooks/README.md          what each hook does — read before you merge
    admin-panel/index.html   the dashboard; copied to ~/claudefleet/admin.html
    admin-panel/README.md    how import/export sync works
```

## What it requires (read this before you buy or before you start)

This machine **drives three paid third-party services and cannot run without them**:

- **Claude (Claude Code)** — the brain. Needs a paid Claude plan or API billing.
- **Higgsfield** — the media factory. Needs a funded account to generate at any real
  volume; the machine writes briefs, your account and your credits render them.
- **Postiz** — distribution. Open source and self-hostable, or use their hosted plan.

Also required: macOS or Linux with zsh (Windows via WSL), `python3`, a browser, a video
editor you already know, and connected social accounts. Full detail, including a
pre-flight checklist, is in `04-requirements-and-costs.md`.

**Your $99 buys this system — the pipeline, the skills, the agents, the hooks, the
dashboard and the documentation. It does not buy the subscriptions.** Those are separate,
recurring, and billed to you by each vendor. Prices change and vary by region and tier,
so this product never quotes them: check each vendor's own pricing page before you commit.

## What it does not do

It does not post anything on its own — publishing happens through *your* Postiz account,
on a schedule you approved. It does not run unattended; nothing fires without a session
you started. It does not bypass any service's limits or pricing. It sends your data
nowhere: every file it touches is on your disk. And it does not guarantee any business
outcome — it makes the work repeatable and visible, but whether the output sells depends
on your offer, your market and your judgment, none of which ships in a zip file.

Covered by a 30-day money-back guarantee: if the system isn't what you expected, ask for
a refund. That guarantee is about your purchase price, and nothing else.
