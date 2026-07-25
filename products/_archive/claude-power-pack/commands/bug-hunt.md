---
description: Run a systematic root-cause debugging protocol on a described bug.
---

The bug being reported: $ARGUMENTS

Follow this protocol in order. Do not skip to a fix before completing the earlier steps — the
whole point of this command is to avoid patching a symptom while the real cause survives.

## 1. Restate the symptom precisely

Write down exactly what's observed: the error message verbatim, when it happens, when it
doesn't, and what "correct" behavior would look like instead. If the report is vague ("it's
broken"), ask for or find the specifics before proceeding — you cannot debug a feeling.

## 2. Reproduce it

- Find or construct the smallest case that triggers the bug. Prefer an existing failing test;
  if none exists, write a minimal repro script/call.
- If you cannot reproduce it after a real attempt, say so explicitly and move to gathering
  indirect evidence (logs, error tracker output, git blame on the suspect area) rather than
  guessing at a fix blind.

## 3. Form 2-3 competing hypotheses

Before reading more code, write down the plausible causes given the symptom. Then rank them by
how consistent each is with everything observed so far (when it happens, when it doesn't, what
changed recently).

## 4. Gather evidence to eliminate hypotheses

For each hypothesis, find something you can check that would prove or disprove it:

- `git log -p` / `git blame` on the suspect file to see what changed and when.
- Add temporary logging or use existing logs to check actual runtime values at the suspect point.
- Grep for every caller of the suspect function — is the bad state coming from one caller or
  is it a property of the function itself?
- Check test coverage of the suspect path — is this an untested edge case?

Do this until one hypothesis is clearly confirmed by evidence, not vibes.

## 5. Trace to the true root cause

Once you know *what* is wrong, trace *why* it became wrong, following the bad value/state
backward through the call chain to its origin. The fix belongs at the origin, not at the point
where it happened to surface as an error.

## 6. Check blast radius before fixing

Grep every call site of whatever you're about to change. Confirm your fix:

- Resolves the reported symptom.
- Doesn't just move the bug to a different caller.
- Fixes the shared root cause once (in the shared function/module) rather than adding a guard
  only in the one path the report named — sibling callers with the same bug should get fixed too.

## 7. Fix and verify

- Make the minimal change that addresses the root cause.
- Re-run the original reproduction — confirm it now passes/behaves correctly.
- If you add a regression test, confirm it actually fails against the old code (revert
  mentally / check) before confirming it passes against the new code — a test that would have
  passed either way proves nothing.

## Report format

```
SYMPTOM: <verbatim>
ROOT CAUSE: <precise, file:line>
EVIDENCE: <what confirmed it — not a guess>
FIX: <what changed and why it addresses the cause>
BLAST RADIUS: <other callers/paths checked>
VERIFICATION: <repro re-run result>
```

If you get stuck between hypotheses with genuinely insufficient evidence, report that honestly —
list what's ruled out and what evidence would resolve the rest. Do not ship a guess as a diagnosis.
