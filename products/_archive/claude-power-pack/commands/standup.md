---
description: Summarize recent git activity and open todos into a daily standup update.
---

Generate a daily standup update by looking at real activity — do not ask the user to recap it
from memory when it's available in git and the project itself.

## Step 1 — Gather real signal

Run these yourself and use the actual output (adjust the time window if the user specified one
in $ARGUMENTS, otherwise default to "since yesterday" / last 24h):

- `git log --since="24 hours ago" --oneline --all` (or since last standup if a longer window is
  implied) to see what actually got committed.
- `git diff --stat HEAD@{1.day.ago} HEAD` (or equivalent) for a sense of scope/size of changes,
  falling back gracefully if the ref doesn't exist.
- `git status` for anything in progress but not yet committed.
- Check for a todo/task file if one exists in the project (`TODO.md`, `docs/PROGRESS.md`, issue
  tracker references in commit messages) — use it for the "planned" section, don't invent tasks.

If this isn't a git repo, or there's no activity in the window, say so plainly rather than
padding the update with filler.

## Step 2 — Structure the update

```
## Standup — <date>

**Done (last 24h):**
- <one line per meaningful commit/change, grouped if several commits form one logical unit —
  describe the outcome, not just the commit message verbatim>

**In progress:**
- <uncommitted work from git status, or partially-done items visible in the diff/todo file>

**Next:**
- <pulled from a todo/progress file if one exists, or the logical next step implied by what's
  in progress — don't invent new work that isn't grounded in something real>

**Blockers:**
- <only if something in the todo file, commit messages, or recent activity indicates a stall —
  otherwise omit this section rather than writing "none" as filler>
```

## Rules

- Group related commits into one narrative line — a standup listing 14 raw commit messages is
  not a summary, it's a dump. Six commits that all implement one feature become one "Done" line.
- Use outcome language ("Added rate limiting to the login endpoint") not commit-message-speak
  ("fix: add rl mw").
- Keep it to what's verifiable from the repo/project — do not guess at what a teammate is working
  on unless it's visible in shared branches/commits.
- Keep the whole thing short enough to read in under 30 seconds — this is a standup, not a report.
