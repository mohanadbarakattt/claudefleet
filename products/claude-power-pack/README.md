# Claude Code Power Pack

Five subagents and seven slash commands for [Claude Code](https://claude.com/claude-code), built
around one idea: **the expensive model should think, cheap agents should do the volume work.**
Copy two folders, restart Claude Code, and you have a working delegation system plus a set of
commands that turn Claude Code into a real dev/ops/marketing assistant instead of a chat window.

No filler, no "TODO — customize this later." Every file here is complete and usable the moment
you install it.

## Who this is for

You're using Claude Code daily for real work — shipping code, debugging, writing specs, doing
the marketing/ops side of a small project or agency — and you're tired of:

- Re-explaining the same delegation pattern in every project's `CLAUDE.md`
- Writing subagent definitions from scratch every time you start a new repo
- Watching the main model burn its context reading files it could've had summarized for it
- Ad-hoc debugging that treats symptoms instead of finding root causes
- Blank-page problems for landing copy, proposals, SEO passes, and standups

If you run one or two projects solo or with a small team, this pack gives you a working
operating system for how you use Claude Code, not just a pile of prompts.

## What's inside

```
claude-power-pack/
├── README.md                 you are here
├── INSTALL.md                copy-paste install commands
├── CLAUDE-template.md        global delegation policy for ~/.claude/CLAUDE.md
├── agents/
│   ├── executor.md           Sonnet — implements well-specified tasks
│   ├── reviewer.md           Sonnet — adversarial review of diffs before you ship
│   ├── researcher.md         Sonnet — web + codebase research, returns summaries not dumps
│   ├── marketer.md           Sonnet — direct-response copy: landing pages, hooks, emails
│   └── bug-hunter.md         Sonnet — systematic root-cause debugging
└── commands/
    ├── ship-check.md         /ship-check   — pre-deploy checklist with a real go/no-go
    ├── spec.md                /spec         — vague idea → precise implementation spec
    ├── bug-hunt.md             /bug-hunt     — systematic debugging protocol
    ├── content-day.md          /content-day  — one topic → a week of social content
    ├── seo-pass.md              /seo-pass     — audit + fix meta/OG/heading SEO basics
    ├── client-proposal.md       /client-proposal — discovery notes → client-ready proposal
    └── standup.md                /standup      — git log + todos → daily standup update
```

### The agents

- **executor** — hands it a decided plan/spec, it builds. Doesn't re-architect, doesn't ask
  "are you sure," ships the smallest diff that satisfies the spec and verifies before reporting
  done.
- **reviewer** — adversarial second pair of eyes on any diff. Tries to break the change: empty
  inputs, race conditions, silent behavior changes, unverified claims. Not a style linter.
- **researcher** — answers open-ended questions across the web or codebase and reports back a
  cited summary, not a dump of every page it read. Keeps your main context lean.
- **marketer** — writes landing copy, hooks, launch emails, and ad copy in a specific,
  benefit-led style. Always gives you 3 variants, never invents stats or testimonials.
- **bug-hunter** — systematic debugging: reproduce, form hypotheses, gather evidence, trace to
  root cause, check every caller before fixing. Fixes the bug once at the source, not per symptom.

### The commands

- **`/ship-check`** — runs build, tests, lint, a secrets/config grep, and a migration-safety
  check, then gives you a clear GO / NO-GO instead of "looks good to me."
- **`/spec [idea]`** — turns a vague feature request into an implementation-ready spec with
  explicit edge cases, acceptance criteria, and out-of-scope boundaries.
- **`/bug-hunt [description]`** — runs the reproduce → hypothesize → evidence → root-cause
  protocol on a described bug, on demand, without spinning up a subagent.
- **`/content-day [topic]`** — turns one topic into a full week of platform-ready social posts
  plus one short-form video script, with varied hooks so it doesn't read as the same post 7x.
- **`/seo-pass`** — audits and directly fixes on-page SEO basics (titles, meta descriptions, OG
  tags, heading structure, alt text) in the current project, flagging anything it can't fix
  without fabricating facts.
- **`/client-proposal [notes]`** — turns discovery-call notes into a structured, client-ready
  proposal, flagging anything (pricing, dates) it can't invent.
- **`/standup [window]`** — reads real git log/diff/status and turns it into a skimmable daily
  update, not 14 raw commit messages.

## 2-minute install

```zsh
# from inside this product folder
cp -r agents/*.md ~/.claude/agents/
cp -r commands/*.md ~/.claude/commands/
```

Then restart Claude Code (or run `/agents` and `/help` inside a session to confirm they're
picked up). See `INSTALL.md` for the exact commands including folder creation if you don't
already have `~/.claude/agents` or `~/.claude/commands`.

Optionally, merge `CLAUDE-template.md` into your global `~/.claude/CLAUDE.md` to make Claude Code
automatically delegate to these agents instead of doing volume work in the expensive main thread.

## Quick-start examples

Once installed, just talk to Claude Code normally — it will auto-delegate to the right agent
based on the description in each agent's frontmatter. You can also invoke things explicitly:

```
> Use the executor agent to add a DELETE /api/projects/:id endpoint following the same
  pattern as DELETE /api/tasks/:id.

> Have reviewer check this diff before I commit — it touches the Stripe webhook handler.

> /spec add CSV export to the reports page

> /ship-check

> /bug-hunt customers are getting intermittent 500s on checkout, no clear repro yet

> /content-day we just launched dark mode

> /standup
```

You don't need to memorize which agent to use for most tasks — describe what you need and Claude
Code will match it against the descriptions in `agents/*.md`. The slash commands are explicit and
always available via `/`.

## A note on model choice

All five agents default to `model: sonnet` in their frontmatter — a good default balance of
quality and cost for both implementation and judgment-heavy work (review, research, debugging,
copywriting). If you want cheaper, higher-volume mechanical work (bulk file reads, boilerplate,
search-and-summarize), see `CLAUDE-template.md` for the `grunt`/Haiku pattern this pack's
delegation policy is built around — you can add a Haiku-tier agent alongside these five if your
workflow needs one.

## License

Personal/commercial use for you and your projects. Don't resell or redistribute this pack itself
as your own product.
