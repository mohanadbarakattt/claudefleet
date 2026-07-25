---
description: Run a pre-deploy checklist against the current changes and report a clear go/no-go.
---

You are running a pre-deploy checklist. This is not a vibe check — every item must be verified
against real output (command results, file contents, actual diffs), not assumed. Work through
the checklist in order, run the commands yourself, and produce a final go/no-go report.

## 1. Scope the change

- Run `git status` and `git diff` (or `git diff --staged` if staged) to see exactly what's
  changing. If this isn't a git repo, ask the user what "the current changes" refers to.
- Run `git log -5 --oneline` for recent context and to match commit-message conventions later
  if needed.
- Summarize in one line what this change does before checking anything else.

## 2. Build & typecheck

- Detect the project's build/typecheck command (check `package.json` scripts, `Makefile`,
  `pyproject.toml`, etc. — don't assume `npm run build`, verify it exists).
- Run it. If it fails, that's an automatic **no-go** — report the exact error, do not proceed
  to guess a fix unless asked.

## 3. Tests

- Detect and run the test suite (or the subset covering the changed files/modules if the full
  suite is slow — check for a `test:changed` or similar script first).
- Report pass/fail counts verbatim. A "some tests fail but they're unrelated" claim is not
  acceptable without showing which ones and why they're unrelated.

## 4. Lint / format

- Run the project's lint command if one exists. Note any errors (not just warnings) as blocking.

## 5. Secrets & config check

- Grep the diff for common leak patterns: hardcoded API keys, `.env` files staged for commit,
  hardcoded passwords/tokens, `console.log`/`print` debug statements left in, commented-out
  code blocks.
- Check whether any new environment variables were introduced — if so, confirm they're
  documented (README, `.env.example`) and flag if not.

## 6. Migration / data safety check (if applicable)

- If the diff touches database schema, migrations, or data-shape changes: confirm there's a
  rollback path and that the migration doesn't silently drop or truncate data.

## 7. Dependency check

- If `package.json`/`requirements.txt`/etc. changed, note what was added and whether it's a
  reasonable, actively maintained dependency versus an unnecessary addition.

## Final report format

```
SHIP CHECK: <one-line change summary>

[x] Build/typecheck   — pass/fail + detail
[x] Tests             — pass/fail counts
[x] Lint              — pass/fail + detail
[x] Secrets/config    — clean / N issues found
[x] Migration safety  — n/a / checked, safe / concern
[x] Dependencies      — n/a / reviewed

VERDICT: GO / NO-GO

Blocking issues (if any):
- ...

Non-blocking notes:
- ...
```

Be honest about a NO-GO. The point of this command is to catch what would have been embarrassing
in production, not to rubber-stamp a deploy.
