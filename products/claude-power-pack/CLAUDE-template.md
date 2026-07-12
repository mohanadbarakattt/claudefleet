# Token-budget policy (orchestrate expensive, execute cheap)

Copy this into your global `~/.claude/CLAUDE.md` (or merge it with what's already there) to make
Claude Code delegate volume work to cheaper subagents by default instead of doing everything in
the expensive main thread.

---

The main model's job is thinking: architecture, debugging root causes, reviewing, and writing
precise specs. Delegate volume and well-specified work to subagents via the Agent/Task tool:

- **`executor` (Sonnet)** — well-specified implementation: "build this per this spec," refactors,
  wiring, test writing. Write the spec carefully once, then hand off. Don't hand it open design
  decisions — decide those yourself first.
- **`reviewer` (Sonnet)** — adversarial review of a diff before you sign off on it, especially
  before committing anything nontrivial or touching money/auth/data-mutation paths.
- **`researcher` (Sonnet)** — open-ended research across the web or codebase. Returns a cited
  summary, not raw file/page dumps — this is what keeps the main model's context lean.
- **`grunt` (Haiku, optional — add if your workflow needs it)** — mechanical/high-volume work:
  codebase searches, reading many files and summarizing, bulk edits/renames, running test suites
  and reporting, boilerplate generation. Minimal judgment required, high volume.

## Rules of thumb

1. **Before doing multi-file reading or searching yourself, ask: "could a subagent do this and
   report back?"** A three-sentence summary costs far less context than five files' worth of raw
   content. This is the single highest-leverage habit in this policy.
2. **Batch independent delegations in parallel**, in one message, when they don't depend on each
   other's output. Don't serialize work that could run concurrently.
3. **Keep the main context lean.** Never paste large file dumps, logs, or raw command output into
   the main conversation — have a subagent digest it and report the distilled version.
4. **Review subagent output critically — you (the main model) own correctness.** A subagent
   report is a claim, not a fact. Spot-check anything load-bearing before acting on it, and
   escalate back to yourself (rather than trusting blindly) whenever a subagent reports ambiguity,
   a failure, or an assumption it had to make.
5. **Skip delegation for trivial one-file tasks** where writing the handoff prompt costs more
   than just doing the thing directly. Delegation is a tool for volume and cost control, not a
   ritual to perform on every single request.
6. **Write the spec once, carefully, before handing off.** The quality of an `executor` or
   `researcher` result is capped by the quality of the prompt it received. A vague handoff
   ("clean this up") produces vague work. Give exact file paths, acceptance criteria, and the
   decision already made — see `/spec` for a command that produces this automatically.
7. **Verification is not optional and is not the subagent's self-report.** "Executor says tests
   pass" is not the same as tests passing — for anything nontrivial, either re-run the
   verification yourself or route it through `reviewer` before treating it as done.
8. **Anti-stall preamble on every subagent prompt.** Tell each subagent explicitly that it is the
   sole agent on the task and should begin immediately without asking clarifying questions back —
   subagents that stall waiting for a human mid-task defeat the purpose of delegation. Put
   genuinely necessary clarifications in the prompt up front instead.

## Example delegation prompt shape

Don't write:

> "Build the CSV export feature."

Write:

> "You are the sole agent on this task — begin immediately. Implement CSV export per this spec:
> [paste spec]. Files likely touched: `src/reports/export.ts`, `src/routes/reports.ts`. Acceptance
> criteria: [list]. Run `npm test` and `npm run typecheck` before reporting done. Report: files
> changed, how verified, any deviations from spec."

The difference in output quality between these two prompts is the entire point of this policy —
delegation only pays off when the spec is precise enough that the subagent doesn't have to guess.
